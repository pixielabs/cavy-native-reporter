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

static void (^callback)() = nil;
static bool cavyFinished = false;

RCT_EXPORT_MODULE(CavyNativeReporter);

// Called from JS
RCT_EXPORT_METHOD(testsFinished) {
    cavyFinished = true;
    if (callback) {
        callback();
    }
}

// Called from within test bridge
+ (void) onFinishWithBlock:(void (^)())block
{
    if (cavyFinished) {
        block();
    } else {
        callback = block;
    }
}

@end
