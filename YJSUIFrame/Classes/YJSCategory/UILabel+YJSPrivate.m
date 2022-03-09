//
//  UILabel+YJSPrivate.m
//  UICategory
//
//  Created by yjs on 2021/12/20.
//

#import "UILabel+YJSPrivate.h"

@implementation UILabel (YJSPrivate)

/// 快速创建Label
/// @param font 字体
/// @param textColor 文字颜色
+ (UILabel *)initWithFont:(UIFont *)font
                textColor:(UIColor *)textColor{
    UILabel *label = [[UILabel alloc]init];
    label.textColor = textColor;
    label.font = font;
    return label;
}

/// 快速创建Label
/// @param font 字体
/// @param textColor 文字颜色
/// @param title 显示文字
+ (UILabel *)initWithFont:(UIFont *)font
                textColor:(UIColor *)textColor
                    title:(NSString *)title{
    UILabel *label = [self initWithFont:font textColor:textColor];
    label.text = title;
    return label;
}

/// 快速创建Label
/// @param font 字体
/// @param textColor 文字颜色
/// @param title 显示文字
/// @param backgroundColor 背景颜色
+ (UILabel *)initWithFont:(UIFont *)font
                textColor:(UIColor *)textColor
                    title:(NSString *)title
          backgroundColor:(UIColor *)backgroundColor{
    UILabel *label = [self initWithFont:font textColor:textColor title:title];
    label.backgroundColor = backgroundColor;
    return label;
}

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
                    align:(NSTextAlignment)align{
    UILabel *label = [self initWithFont:font textColor:textColor title:title backgroundColor:backgroundColor];
    label.textAlignment = align;
    return label;
}

@end
