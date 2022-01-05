//
//  UIButton+YJSPrivate.h
//  UICategory
//
//  Created by yjs on 2021/12/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (YJSPrivate)

/// 快速创建按钮
/// @param font font
+ (UIButton *)initWithFont:(UIFont *)font;

/// 快速创建按钮
/// @param font font
/// @param titleText titleText
+ (UIButton *)initWithFont:(UIFont *)font titleText:(NSString *)titleText;

/// 修改按钮响应区域的范围
/// @param size size
- (void)setEnlargeEdge:(CGFloat)size;

/// 修改按钮响应区域的范围
/// @param insets insets
- (void)setEnlargeEdgeWithInsets:(UIEdgeInsets)insets;

@end

NS_ASSUME_NONNULL_END
