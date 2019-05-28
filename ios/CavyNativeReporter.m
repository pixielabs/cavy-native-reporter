//
//  CavyNativeReporterObjC.m
//  CavyNativeReporter
//
//  Created by Abigail McPhillips on 15/05/2019.
//

#import "CavyNativeReporter.h"
#import <React/RCTLog.h>

// iOS Bridge Module that exposes Cavy test reports to native code.
@implementation CavyNativeReporter

static void (^callback)(NSDictionary *) = nil;
static NSDictionary *cavyReport = nil;

RCT_EXPORT_MODULE(CavyNativeReporter);

// This method is exposed to JS through React Native NativeModules.
//
// Calls the callback with the report if callback available.
// If not, sets the report as a class variable so we can access it later.
//
// `report` - the Cavy test report.
RCT_EXPORT_METHOD(reporter:(NSDictionary *)report) {
  if (callback) {
    callback(report);
  } else {
    cavyReport = report;
  }
}

// Class method that calls the block with the report if report is available
// (i.e. if Cavy tests have finished).
// If not, sets the callback as a class variable so we can access it later.
//
// `block` - a callback function.
+ (void) onFinishWithBlock:(void (^)(NSDictionary *))block {
  if (cavyReport) {
    block(cavyReport);
  } else {
    callback = block;
  }
}

@end
