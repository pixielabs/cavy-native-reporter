//
//  BridgeTests.swift
//  sampleAppTests
//
//  Created by Abigail McPhillips on 15/05/2019.
//  Copyright © 2019 Facebook. All rights reserved.
//


import XCTest

// The `cavyReport` argument looks like this:
//
//{
//  duration = "0.2";
//  errorCount = 0;
//  results = (
//    {
//      message = "Test suite description: test number 1";
//      passed = 1;
//    },
//    {
//      message = "Test suite description: test number 2";
//      passed = 0;
//    }
//  );
//}
//
class BridgeTests: XCTestCase {
  func testBridge() {
    let expectation = XCTestExpectation(description: "Cavy tests passed");
    
    CavyNativeReporter.onFinish { report in
      NSLog("%@", report);
      let errorCount = report["errorCount"] as! Int;
      if (errorCount > 0) {
        XCTFail("Cavy tests had one or more errors");
      }
      expectation.fulfill();
    }
    
    wait(for: [expectation], timeout: 5);
  }
}
