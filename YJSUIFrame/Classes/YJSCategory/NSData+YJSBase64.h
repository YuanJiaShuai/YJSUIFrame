//
//  NSData+YJSBase64.h
//  UICategory
//
//  Created by yjs on 2021/12/30.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

void *NewBase64Decode(
    const char *inputBuffer,
    size_t length,
    size_t *outputLength);

char *NewBase64Encode(
    const void *inputBuffer,
    size_t length,
    bool separateLines,
    size_t *outputLength);

@interface NSData (YJSBase64)

+ (NSData *)dataFromBase64String:(NSString *)aString;

- (NSString *)base64EncodedString;

@end

NS_ASSUME_NONNULL_END
