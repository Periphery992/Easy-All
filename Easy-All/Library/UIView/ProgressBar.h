//
//  ProgressBar.h
//  Easy-All
//
//  Created by chen on 25/10/2017.
//  Copyright © 2017 chensa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProgressBar : UIView

/**
 配置进度条进度和上限

 @param fNow 当前进度
 @param fTotal 上限
 @param animated 是否有进度条改变的动画
 */
- (void)configProgressWithfNow:(float)fNow fTotal:(float)fTotal animated:(BOOL)animated;

/**
 配置进度条进度
 
 @param fNow 设置的进度
 @param animated 是否有进度条改变的动画
 */
- (void)configProgressWithfNow:(float)fNow animated:(BOOL)animated;

/**
 配置进度条进度
 
 @param fRate 设置比例
 @param animated 是否有进度条改变的动画
 */
- (void)configProgressWithfRate:(float)fRate animated:(BOOL)animated;

/**
 设置进度条背景颜色

 @param color 进度条背景颜色
 */
- (void)configBackgroundColor:(UIColor *)color;

/**
 设置进度条颜色

 @param color 进度条颜色
 */
- (void)configProgressColor:(UIColor *)color;

@end
