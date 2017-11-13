//
//  CountView.h
//  Easy-All
//
//  Created by chensa on 2017/10/25.
//  Copyright © 2017年 chensa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CountView : UIButton

/**
 创建

 @param frame 视图大小
 @param icon 图标
 @param backgroundImage 背景图片
 @return 实例
 */
- (instancetype)initWithFrame:(CGRect)frame icon:(UIImage *)icon backgroundImage:(UIImage *)backgroundImage;


/**
 设置数字文本，会自动转化成T(千),M(百万),B(十亿)为单位

 @param count 数量
 */
- (void)configCount:(long long int)count;

@end
