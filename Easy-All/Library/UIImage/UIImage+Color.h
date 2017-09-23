//
//  UIImage+Color.h
//  Common
//
//  Created by chen on 2017/1/4.
//  Copyright © 2017年 chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Color)


/**
 创建一张指定大小的纯色图片

 @param size 图片大小
 @param color 图片颜色
 @return 生成的图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color CGSize:(CGSize)size;

@end
