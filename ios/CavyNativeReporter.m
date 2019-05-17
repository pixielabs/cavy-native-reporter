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

static void (^_callback)() = nil;
static bool cavyFinished = false;

RCT_EXPORT_MODULE(CavyNativeReporter);

// Called from JS
RCT_EXPORT_METHOD(testsFinished) {
    NSLog(@"testsFinished called by JS, received in ObjC %@", CavyNativeReporter.callback);
    cavyFinished = true;
    if (CavyNativeReporter.callback) {
        CavyNativeReporter.callback();
    }
    RCTLogInfo(@"TestsFinished");
}

// Called from within test bridge
+ (void) onFinishWithBlock:(void (^)())block
{
    if (cavyFinished) {
        block();
    } else {
        NSLog(@"inOnFinishWithBlock %@", block);
        [self setCallback:block];
    }
}

+ (void(^)())callback
{
    return _callback;
}

+ (void)setCallback:(void (^)())newCallback
{
    if (newCallback != _callback) {
        _callback = [newCallback copy];
    }
}


@end
