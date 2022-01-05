//
//  UIButton+YJSPrivate.m
//  UICategory
//
//  Created by yjs on 2021/12/20.
//

#import "UIButton+YJSPrivate.h"
#import <objc/runtime.h>

@implementation UIButton (YJSPrivate)

static char insetsKey;

+ (UIButton *)initWithFont:(UIFont *)font{
    UIButton *button = [[UIButton alloc]init];
    button.titleLabel.font = font;
    return button;
}

+ (UIButton *)initWithFont:(UIFont *)font titleText:(NSString *)titleText{
    UIButton *button = [self initWithFont:font];
    [button setTitle:titleText forState:UIControlStateNormal];
    return button;
}

- (void)setEnlargeEdge:(CGFloat)size{
    objc_setAssociatedObject(self, &insetsKey, [NSValue valueWithUIEdgeInsets:UIEdgeInsetsMake(size, size, size, size)], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)setEnlargeEdgeWithInsets:(UIEdgeInsets)insets{
    objc_setAssociatedObject(self, &insetsKey, [NSValue valueWithUIEdgeInsets:insets], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (CGRect)enlargedRect{
    NSValue *value = objc_getAssociatedObject(self, &insetsKey);
    
    if (value){
        UIEdgeInsets insets = [value UIEdgeInsetsValue];
        
        return CGRectMake(self.bounds.origin.x - insets.left,
                          self.bounds.origin.y - insets.top,
                          self.bounds.size.width + insets.left + insets.right,
                          self.bounds.size.height + insets.top + insets.bottom);
    }else{
        return self.bounds;
    }
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    CGRect rect = [self enlargedRect];
    if (CGRectEqualToRect(rect, self.bounds)){
        return [super pointInside:point withEvent:event];
    }
    return CGRectContainsPoint(rect, point) ? YES : NO;
}

@end
