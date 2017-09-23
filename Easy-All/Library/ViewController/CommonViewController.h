//
//  CommonViewController.h
//  Common
//
//  Created by chen on 2017/1/3.
//  Copyright © 2017年 chen. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,BackType)
{
    BackTypePop  = 0,
    BackTypePopToRootView = 1,
    BackTypeDismiss = 2,
};

@interface CommonViewController : UIViewController

/**
 设置状态栏的显示或隐藏
 */
@property (nonatomic, assign) BOOL statusBarHidden;

/**
 设置状态栏的样式
 */
@property (nonatomic, assign) UIStatusBarStyle statusBarStyle;

/**
 返回按钮的显示与隐藏控制 以及返回按钮点击的返回效果
 @param isShow 需要显示填写YES 不需要显示填写NO
 @param backtype 0代表返回上一页 1代表返回根页面 2代表页面消失
 */
- (void)isShowBackButton:(BOOL)isShow backType:(BackType)backtype;

/**
 设置状态栏的显示或隐藏

 @param hidden YES为隐藏，NO为显示
 */
- (void)setStatusBarHidden:(BOOL)hidden;

/**
 设置状态栏的样式

 @param statusBarStyle 状态栏的样式
 */
- (void)setStatusBarStyle:(UIStatusBarStyle)statusBarStyle;

@end
