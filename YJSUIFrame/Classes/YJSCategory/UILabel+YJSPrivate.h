//
//  UILabel+YJSPrivate.h
//  UICategory
//
//  Created by yjs on 2021/12/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (YJSPrivate)

/// 快速创建Label
/// @param font 字体
/// @param textColor 文字颜色
+ (UILabel *)initWithFont:(UIFont *)font
                textColor:(UIColor *)textColor;

/// 快速创建Label
/// @param font 字体
/// @param textColor 文字颜色
/// @param title 显示文字
+ (UILabel *)initWithFont:(UIFont *)font
                textColor:(UIColor *)textColor
                    title:(NSString *)title;

/// 快速创建Label
/// @param font 字体
/// @param textColor 文字颜色
/// @param title 显示文字
/// @param backgroundColor 背景颜色
+ (UILabel *)initWithFont:(UIFont *)font
                textColor:(UIColor *)textColor
                    title:(NSString *)title
          backgroundColor:(UIColor *)backgroundColor;

/// 快速创建Label
/// @param font 字体
/// @param textColor 文字颜色
/// @param title 显示文字
/// @param backgroundColor 背景颜色
/// @param align 对齐方式
+ (UILabel *)initWithFont:(UIFont *)font
                textColor:(UIColor *)textColor
                    title:(NSString *)title
          backgroundColor:(UIColor *)backgroundColor
                    align:(NSTextAlignment)align;

@end

NS_ASSUME_NONNULL_END
