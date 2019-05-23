//
//  CavyNativeReporterObjC.m
//  CavyNativeReporter
//
//  Created by Abigail McPhillips on 15/05/2019.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import "CavyNativeReporter.h"
#import <React/RCTLog.h>

@implementation CavyNativeReporter

static void (^callback)(NSDictionary *) = nil;
static NSDictionary *cavyReport = nil;

RCT_EXPORT_MODULE(CavyNativeReporter);

RCT_EXPORT_METHOD(reporter:(NSDictionary *)report)
{    
    if (callback) {
        callback(report);
    } else {
        cavyReport = report;
    }
}

+ (void) onFinishWithBlock:(void (^)(NSDictionary *))block
{
    if (cavyReport) {
        block(cavyReport);
    } else {
        callback = block;
    }
}

@end
