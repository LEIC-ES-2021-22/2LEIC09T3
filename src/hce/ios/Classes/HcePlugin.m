#import "HcePlugin.h"
#if __has_include(<hce/hce-Swift.h>)
#import <hce/hce-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "hce-Swift.h"
#endif

@implementation HcePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftHcePlugin registerWithRegistrar:registrar];
}
@end
