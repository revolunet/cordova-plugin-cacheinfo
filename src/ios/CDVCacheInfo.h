
#import <Cordova/CDVPlugin.h>

@interface CDVCacheInfo : CDVPlugin {}

- (void) getInfos:(CDVInvokedUrlCommand*)command;
- (void) clear:(CDVInvokedUrlCommand*)command;

@end
