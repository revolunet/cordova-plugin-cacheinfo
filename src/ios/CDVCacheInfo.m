
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

// prefill the cache
// - (void)fetch:(CDVInvokedUrlCommand*)command
// {
//     NSLog(@"Prefetch");
    
//     for (NSString *stringURL in command.arguments) {
//         NSURL                     *url     = [NSURL URLWithString:stringURL];
//         NSURLRequest              *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:10000];
        
//         NSURLSessionConfiguration *config  = [NSURLSessionConfiguration defaultSessionConfiguration];
//         config.URLCache = [NSURLCache sharedURLCache];
//         NSURLSession              *session = [NSURLSession sessionWithConfiguration:config];
        
//         // Check the cache.
//         NSCachedURLResponse *cachedResponse = [[NSURLCache sharedURLCache] cachedResponseForRequest:request];
//         NSLog(cachedResponse ? @"Cached response found!" : @"No cached response found.");
        
//         if (!cachedResponse) {
//             NSURLSessionDataTask* loadDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
//                 UIImage *downloadedImage = [UIImage imageWithData:data];
//             }];
//             [loadDataTask resume];
//         }
//     }
    
//     CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"ok"];
//     [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    
// }

@end
