//
//  NSString+YJSString.h
//  UICategory
//
//  Created by yjs on 2021/12/23.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (YJSString)

/// 空字符串处理
/// @param emptypString emptypString
+ (NSString *)stringEmpty:(NSString *)emptypString;

@end

@interface NSString (YJSBase64)

/// 编码
/// @param plainText 原文本
+ (NSString *)base64Encode:(NSString *)plainText;

/// 解码
/// @param base64String base64文本
+ (NSString *)base64Decode:(NSString *)base64String;

@end

@interface NSString (YJSMD5)

- (NSString *)md5HexDigest;

/**
 rc4 加密
 s
 @param aInput 原文
 @param aKey 密钥
 @return 密文
 */
+ (NSString *)HloveyRC4:(NSString*)aInput key:(NSString*)aKey;

@end

@interface NSString (YJSSize)

/**
 *  @brief 计算文字的高度
 *
 *  @param font  字体(默认为系统字体)
 *  @param width 约束宽度
 */
- (CGFloat)heightWithFont:(UIFont *)font constrainedToWidth:(CGFloat)width;
/**
 *  @brief 计算文字的宽度
 *
 *  @param font   字体(默认为系统字体)
 *  @param height 约束高度
 */
- (CGFloat)widthWithFont:(UIFont *)font constrainedToHeight:(CGFloat)height;

/**
 *  @brief 计算文字的大小
 *
 *  @param font  字体(默认为系统字体)
 *  @param width 约束宽度
 */
- (CGSize)sizeWithFont:(UIFont *)font constrainedToWidth:(CGFloat)width;
/**
 *  @brief 计算文字的大小
 *
 *  @param font   字体(默认为系统字体)
 *  @param height 约束高度
 */
- (CGSize)sizeWithFont:(UIFont *)font constrainedToHeight:(CGFloat)height;

/**
 *  @brief  反转字符串
 *
 *  @param strSrc 被反转字符串
 *
 *  @return 反转后字符串
 */
+ (NSString *)reverseString:(NSString *)strSrc;

@end

NS_ASSUME_NONNULL_END
