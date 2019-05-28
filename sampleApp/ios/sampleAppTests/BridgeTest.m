//
//  BridgeTest.m
//  sampleAppTests
//
//  Created by Abigail McPhillips on 22/05/2019.
//

#import <XCTest/XCTest.h>
#import <CavyNativeReporter/CavyNativeReporter.h>

@interface BridgeTest : XCTestCase

@end

// Example test that uses the iOS Cavy Native Reporter.
// Waits on Cavy to finish running tests and passes if error count is 0.
@implementation BridgeTest

- (void)testBridge {
  // Make a new expectation.
  XCTestExpectation *expectation = [[XCTestExpectation alloc] initWithDescription: @"Cavy tests passed"];

  [CavyNativeReporter onFinishWithBlock: ^void(NSDictionary* report) {
    // Pull the error count from the report object.
    long errorCount = [report[@"errorCount"] integerValue];
    // Fail if there are errors.
    if (errorCount > 0) {
      XCTFail(@"Cavy tests had one or more errors");
    }
    // Fulfill the expectation.
    [expectation fulfill];
  }];

  // Wait for expectation to fulfill.
  [self waitForExpectations:@[expectation] timeout:100];
}

@end
