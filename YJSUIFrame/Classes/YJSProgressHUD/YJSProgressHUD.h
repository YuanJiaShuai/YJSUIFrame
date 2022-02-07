//
//  YJSProgressHUD.h
//  YJSUIFrame_Example
//
//  Created by 袁佳帅 on 2022/1/28.
//  Copyright © 2022 YuanJiaShuai. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YJSProgressHUD : NSObject

+ (void)showWithStatus:(NSString*)status;

+ (void)showSuccessWithStatus:(NSString*)status;

+ (void)showErrorWithStatus:(NSString *)status;

+ (void)showInfoWithStatus:(NSString *)status;

+ (void)showImage:(UIImage*)image status:(NSString*)status;

+ (void)showProgress:(float)progress;

+ (void)showProgress:(float)progress status:(NSString*)status;

+ (void)showOnlyTitle:(NSString *)title;

+ (void)dismiss;

@end

NS_ASSUME_NONNULL_END
