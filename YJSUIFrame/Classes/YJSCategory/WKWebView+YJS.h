//
//  WKWebView+YJS.h
//  UICategory
//
//  Created by yjs on 2021/12/20.
//

#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WKWebView (YJSSynchronous)

/// 模仿 UIWebview 的 JS 调用方法
/// https://stackoverflow.com/questions/4326350/how-do-i-wait-for-an-asynchronously-dispatched-block-to-finish/4326754#4326754
- (nullable NSString *)stringByEvaluatingJavaScriptFromString:(NSString *)script;

@end

@interface WKWebView (YJSClearCache)

+ (void)clearCache;
+ (void)clearDiskAndMemoryCache;
+ (void)clearAllCache;

@end

NS_ASSUME_NONNULL_END
