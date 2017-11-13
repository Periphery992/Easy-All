//
//  UIImage+Color.m
//  Common
//
//  Created by chen on 2017/1/4.
//  Copyright © 2017年 chen. All rights reserved.
//

#import "UIImage+Color.h"

@implementation UIImage (Color)

//创建一张指定大小的纯色图片
+ (UIImage *)imageWithColor:(UIColor *)color CGSize:(CGSize)size
{
    CGSize imageSize = size;
    UIGraphicsBeginImageContextWithOptions(imageSize, 0, [UIScreen mainScreen].scale); //获取上下文
    [color set]; //设置填充颜色
    UIRectFill(CGRectMake(0, 0, imageSize.width, imageSize.height)); //填充颜色
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext(); //获取图片
    UIGraphicsEndImageContext();//释放上下文
 
    return image;
}

@end
