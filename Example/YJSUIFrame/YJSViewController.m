//
//  YJSViewController.m
//  YJSUIFrame
//
//  Created by YuanJiaShuai on 01/05/2022.
//  Copyright (c) 2022 YuanJiaShuai. All rights reserved.
//

#import "YJSViewController.h"
#import <YJSUIFrame.h>

@interface YJSViewController ()

@end

@implementation YJSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    for(int i = 1; i < 101; i++){
//        [YJSProgressHUD showProgress:i/100.0 status:[NSString stringWithFormat:@"已上传 %d %%",i]];
//        if (i == 100) {
//            sleep(0.1);
//            [YJSProgressHUD dismiss];
//        }
//    }
    
    [YJSProgressHUD showSuccessWithStatus:@"请求成功"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
