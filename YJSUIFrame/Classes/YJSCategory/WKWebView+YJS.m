//
//  WKWebView+YJS.m
//  UICategory
//
//  Created by yjs on 2021/12/20.
//

#import "WKWebView+YJS.h"

@implementation WKWebView (YJSSynchronous)

- (NSString *)stringByEvaluatingJavaScriptFromString:(NSString *)script;{
    __block NSString *result = nil;
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    if (![NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self evaluateJavaScript:script completionHandler:^(id _Nullable responseData, NSError * _Nullable error) {
                if ([responseData isKindOfClass:NSString.class]) {
                    result = responseData;
                } else if ([responseData respondsToSelector:@selector(stringValue)]) {
                    result = [responseData stringValue];
                }
                dispatch_semaphore_signal(semaphore);
            }];
        });
    } else {
        [self evaluateJavaScript:script completionHandler:^(id _Nullable responseData, NSError * _Nullable error) {
            if ([responseData isKindOfClass:NSString.class]) {
                result = responseData;
            } else if ([responseData respondsToSelector:@selector(stringValue)]) {
                result = [responseData stringValue];
            }
            dispatch_semaphore_signal(semaphore);
        }];
    }
    if (![NSThread isMainThread]) {
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    } else {
        while (dispatch_semaphore_wait(semaphore, DISPATCH_TIME_NOW)) {
            [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate dateWithTimeIntervalSinceNow:0]];
        }
    }
    return result;
}

@end

@implementation WKWebView (YJSClearCache)

+ (void)clearDiskAndMemoryCache{
    NSSet *websiteDataTypes
    = [NSSet setWithArray:@[
                            WKWebsiteDataTypeDiskCache,
                            WKWebsiteDataTypeMemoryCache,
                            ]];
    NSDate *dateFrom = [NSDate dateWithTimeIntervalSince1970:0];
    [[WKWebsiteDataStore defaultDataStore] removeDataOfTypes:websiteDataTypes modifiedSince:dateFrom completionHandler:^{
        
    }];
}

+ (void)clearCache{
    NSSet *websiteDataTypes
    = [NSSet setWithArray:@[
                            WKWebsiteDataTypeDiskCache,
                            WKWebsiteDataTypeMemoryCache,
                            WKWebsiteDataTypeLocalStorage,
                            WKWebsiteDataTypeCookies,
                            WKWebsiteDataTypeSessionStorage,
                            ]];
    NSDate *dateFrom = [NSDate dateWithTimeIntervalSince1970:0];
    [[WKWebsiteDataStore defaultDataStore] removeDataOfTypes:websiteDataTypes modifiedSince:dateFrom completionHandler:^{
        
    }];
}

+ (void)clearAllCache{
    NSSet *websiteDataTypes = [WKWebsiteDataStore allWebsiteDataTypes];
    NSDate *dateFrom = [NSDate dateWithTimeIntervalSince1970:0];
    [[WKWebsiteDataStore defaultDataStore] removeDataOfTypes:websiteDataTypes modifiedSince:dateFrom completionHandler:^{
        
    }];
}

@end
