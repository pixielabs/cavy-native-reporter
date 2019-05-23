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

@implementation BridgeTest

- (void)testBridge {
  // Make a new expectation
  XCTestExpectation *expectation = [[XCTestExpectation alloc] initWithDescription: @"Cavy tests passed"];
  
  [CavyNativeReporter onFinishWithBlock: ^void(NSDictionary* report) {
    long errorCount = [report[@"errorCount"] integerValue];
    if (errorCount > 0) {
      XCTFail(@"Cavy tests had one or more errors");
    }
    [expectation fulfill];
  }];
  
  [self waitForExpectations:@[expectation] timeout:100];
}

@end
