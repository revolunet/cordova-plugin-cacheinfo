
#import <Cordova/CDV.h>

#import "CDVCacheInfo.h"

@implementation CDVCacheInfo

- (void)getInfos:(CDVInvokedUrlCommand*)command
{
    NSDictionary *infos = [ [NSDictionary alloc]
                           initWithObjectsAndKeys :
                           [NSNumber numberWithLong:[[NSURLCache sharedURLCache] currentDiskUsage]], @"DiskCache",
                           [NSNumber numberWithLong:[[NSURLCache sharedURLCache] diskCapacity]], @"DiskCapacity",
                           [NSNumber numberWithLong:[[NSURLCache sharedURLCache] currentMemoryUsage]], @"MemoryCache",
                           [NSNumber numberWithLong:[[NSURLCache sharedURLCache] memoryCapacity]], @"MemoryCapacity",
                           nil
                           ];
    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary: infos];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}


- (void)clear:(CDVInvokedUrlCommand*)command
{
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}


@end
