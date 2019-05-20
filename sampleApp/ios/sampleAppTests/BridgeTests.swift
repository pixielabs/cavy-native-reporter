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
    waitUntil(timeout: 100) { done in
      CavyNativeReporter.onFinish { cavyReport in
        let errorCount = cavyReport["errorCount"] as! Int;
        if (errorCount > 0) {
          fail("Tests failed")
        } else {
          NSLog("Tests completed")
        }
        done()
      }
    }
  }
}

