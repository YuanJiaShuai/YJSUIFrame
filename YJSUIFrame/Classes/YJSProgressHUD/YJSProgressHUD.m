//
//  YJSProgressHUD.m
//  YJSUIFrame_Example
//
//  Created by 袁佳帅 on 2022/1/28.
//  Copyright © 2022 YuanJiaShuai. All rights reserved.
//

#import "YJSProgressHUD.h"
#import <SVProgressHUD/SVProgressHUD.h>

@implementation YJSProgressHUD

+ (void)initialize{
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD setDefaultAnimationType:SVProgressHUDAnimationTypeFlat];
    [SVProgressHUD setMaximumDismissTimeInterval:2.0];
    [SVProgressHUD setMinimumDismissTimeInterval:1.6];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeNone];
    [SVProgressHUD setGraceTimeInterval:0.0];
    
    NSBundle *bundle = [NSBundle bundleForClass:[YJSProgressHUD class]];
    NSURL *url = [bundle URLForResource:@"YJSProgressHUD" withExtension:@"bundle"];
    NSBundle *imageBundle = [NSBundle bundleWithURL:url];
    
    UIImage *infoImage = [UIImage imageWithContentsOfFile:[imageBundle pathForResource:@"tips_info@2x" ofType:@"png"]];
    UIImage *successImage = [UIImage imageWithContentsOfFile:[imageBundle pathForResource:@"tips_done@2x" ofType:@"png"]];
    UIImage *errorImage = [UIImage imageWithContentsOfFile:[imageBundle pathForResource:@"tips_error@2x" ofType:@"png"]];
    
    [SVProgressHUD setErrorImage:errorImage];
    [SVProgressHUD setSuccessImage:successImage];
    [SVProgressHUD setInfoImage:infoImage];
    [SVProgressHUD setCornerRadius:8];
}

+ (void)showWithStatus:(NSString*)status{
    [SVProgressHUD showWithStatus:status];
}

+ (void)showSuccessWithStatus:(NSString*)status{
    [SVProgressHUD showSuccessWithStatus:status];
}

+ (void)showErrorWithStatus:(NSString *)status{
    [SVProgressHUD showErrorWithStatus:status];
}

+ (void)showInfoWithStatus:(NSString *)status{
    [SVProgressHUD showInfoWithStatus:status];
}

+ (void)showImage:(UIImage*)image status:(NSString*)status{
    [SVProgressHUD showImage:image status:status];
}

+ (void)showProgress:(float)progress{
    [SVProgressHUD showProgress:progress];
}

+ (void)showProgress:(float)progress status:(NSString*)status{
    [SVProgressHUD showProgress:progress status:status];
}

+ (void)showOnlyTitle:(NSString *)title{
    [SVProgressHUD showImage:[UIImage new] status:title];
}

+ (void)dismiss{
    [SVProgressHUD dismiss];
}

@end
