//
//  UIView+YJSFrame.h
//  UICategory
//
//  Created by yjs on 2021/12/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (YJSFrame)

/// 间隔X值
@property (nonatomic, assign) CGFloat x;

/// 间隔Y值
@property (nonatomic, assign) CGFloat y;

/// 宽度
@property (nonatomic, assign) CGFloat width;

/// 高度
@property (nonatomic, assign) CGFloat height;

/// 中心点X值
@property (nonatomic, assign) CGFloat centerX;

/// 中心点Y值
@property (nonatomic, assign) CGFloat centerY;

/// 尺寸大小
@property (nonatomic, assign) CGSize size;

/// 起始点
@property (nonatomic, assign) CGPoint origin;

/// 上
@property (nonatomic) CGFloat top;

/// 下
@property (nonatomic) CGFloat bottom;

/// 左
@property (nonatomic) CGFloat left;

/// 右
@property (nonatomic) CGFloat right;

@end

NS_ASSUME_NONNULL_END
