//
//  CavyNativeReporterObjC.h
//  CavyNativeReporter
//
//  Created by Abigail McPhillips on 15/05/2019.
//

#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>

NS_ASSUME_NONNULL_BEGIN

@interface CavyNativeReporter : NSObject <RCTBridgeModule>
+ (void) onFinishWithBlock:(void(^)(NSDictionary *))block;
@end

NS_ASSUME_NONNULL_END
