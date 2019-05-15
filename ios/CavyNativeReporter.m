#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_REMAP_MODULE(CavyNativeReporter, CavyNativeReporter, NSObject)

RCT_EXTERN_METHOD(testsFinished:(NSDictionary*)report)

@end
