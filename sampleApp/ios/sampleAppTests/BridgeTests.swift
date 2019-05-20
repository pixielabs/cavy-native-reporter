//
//  BridgeTests.swift
//  sampleAppTests
//
//  Created by Abigail McPhillips on 15/05/2019.
//  Copyright © 2019 Facebook. All rights reserved.
//

@testable import sampleApp
import XCTest
import Nimble

class BridgeTests: XCTestCase {
  func testBridge() {
    waitUntil(timeout: 100) { done in
      CavyNativeReporter.onFinish {
        done()
      }
    }
  }
}
