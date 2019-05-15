//
//  CavyNativeReporter.swift
//  CavyNativeReporter
//
//  Created by Abigail McPhillips on 14/05/2019.
//  Copyright © 2019 Facebook. All rights reserved.
//
import Foundation

@objc(CavyNativeReporter)
public final class CavyNativeReporter: NSObject {
    @objc static let requiresMainQueueSetup: Bool = true
    @objc let methodQueue = DispatchQueue.main
    
    enum Result {
        case success(results: [String])
        case failure(errors: [String])
        
        init(report: [String: Any]) {
            let errorCount = report["errorCount"] as? Int ?? Int.max
            let isSuccess = errorCount == 0
            
            let results = (report["results"] as? [NSDictionary] ?? [])
                .map { result in
                    (passed: result["passed"] as? Bool ?? false,
                     message: result["message"] as? String ?? "Missing failure message")
            }
            
            if isSuccess {
                self = .success(results: results.map { $0.message })
            } else {
                let errors = results.filter { !$0.passed } .map { $0.message }
                self = .failure(errors: errors)
            }
        }
    }
    
    private static var result: Result?
    private static var callback: ((Result) -> Void)?
    
    static func onFinished(callback: @escaping (Result) -> Void) {
        if let result = CavyNativeReporter.result {
            callback(result)
        } else {
            CavyNativeReporter.callback = callback
        }
    }
    
    @objc(testsFinished:)
    func testsFinished(report: [String: Any]) {
        let result = Result(report: report)
        NSLog(" \(report)")
        CavyNativeReporter.result = result
        CavyNativeReporter.callback?(result)
    }
}
