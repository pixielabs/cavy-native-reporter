//
//  CavyNativeReporterObjC.h
//  CavyNativeReporter
//
//  Created by Abigail McPhillips on 15/05/2019.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>

NS_ASSUME_NONNULL_BEGIN

@interface CavyNativeReporter : NSObject <RCTBridgeModule>
@property (class, nonatomic, copy) void(^callback)();
+ (void) onFinishWithBlock:(void(^)())block;
@end

NS_ASSUME_NONNULL_END
