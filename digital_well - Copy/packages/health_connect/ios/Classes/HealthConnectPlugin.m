#import "HealthConnectPlugin.h"
#if __has_include(<health_connect/health_connect-Swift.h>)
#import <health_connect/health_connect-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "health_connect-Swift.h"
#endif

@implementation HealthConnectPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftHealthConnectPlugin registerWithRegistrar:registrar];
}
@end
