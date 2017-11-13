//
//  UIView+Frame.m
//  Easy-All
//
//  Created by chensa on 2017/9/22.
//  Copyright © 2017年 chensa. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)

/**
 获取view左侧x坐标
 
 @return view左侧x坐标
 */
- (CGFloat)originX {
    return self.frame.origin.x;
}

/**
 设置view左侧x坐标
 
 @param originX view左侧x坐标
 */
- (void)setOriginX:(CGFloat)originX {
    CGRect frame = self.frame;
    frame.origin.x = originX;
    self.frame = frame;
    return;
}

/**
 获取view顶部y坐标
 
 @return view顶部y坐标
 */
- (CGFloat)originY {
    return self.frame.origin.y;
}

/**
 设置view左侧x坐标
 
 @param originY view左侧x坐标
 */
- (void)setOriginY:(CGFloat)originY {
    CGRect frame = self.frame;
    frame.origin.y = originY;
    self.frame = frame;
    return;
}

/**
 获取view右侧x坐标
 
 @return view右侧x坐标
 */
- (CGFloat)rightX {
    return [self originX] + [self width];
}

/**
 设置view右侧x坐标
 
 @param rightX view右侧x坐标
 */
- (void)setRightX:(CGFloat)rightX {
    CGRect frame = self.frame;
    frame.origin.x = rightX - [self width];
    self.frame = frame;
    return;
}

/**
 获取view底部y坐标
 
 @return view底部y坐标
 */
- (CGFloat)bottomY {
    return [self originY] + [self height];
}

/**
 设置view底部y坐标
 
 @param bottomY view底部y坐标
 */
- (void)setBottomY:(CGFloat)bottomY {
    CGRect frame = self.frame;
    frame.origin.y = bottomY - [self height];
    self.frame = frame;
    return;
}


/**
 获取view中心点的x坐标
 
 @return view中心点的x坐标
 */
- (CGFloat)centerX {
    return self.center.x;
}

/**
 设置view中心点的x坐标
 
 @param centerX view中心点的x坐标
 */
- (void)setCenterX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
    return;
}

/**
 获取view中心点的y坐标
 
 @return view中心点的y坐标
 */
- (CGFloat)centerY {
    return self.center.y;
}

/**
 设置view中心点的y坐标
 
 @param centerY view中心点的y坐标
 */
- (void)setCenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
    return;
}

/**
 获取view的宽
 
 @return view的宽
 */
- (CGFloat)width {
    return self.frame.size.width;
}

/**
 设置view的宽
 
 @param width view的宽
 */
- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
    return;
}

/**
 获取view的高
 
 @return view的高
 */
- (CGFloat)height {
    return self.frame.size.height;
}

/**
 设置view的高
 
 @param height view的高
 */
- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
    return;
}

/**
 获取view的origin
 
 @return view的origin
 */
- (CGPoint)origin {
    return self.frame.origin;
}

/**
 设置view的origin
 
 @param origin view的origin
 */
- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
    return;
}

/**
 获取view的size
 
 @return view的size
 */
- (CGSize)size {
    return self.frame.size;
}

/**
 设置view的size
 
 @param size view的size
 */
- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
    return;
}

//获取视图自身的中心点
- (CGPoint)selfCenter
{
    CGPoint selfCenter = CGPointMake(self.width/2, self.height/2);
    return selfCenter;
}

//获取视图自身的中心点X轴坐标
- (CGFloat)selfCenterX
{
    return self.width/2;
}

//获取摄图自身的中心点Y轴坐标
- (CGFloat)selfCenterY
{
    return self.height/2;
}

/**
 移除此view上的所有子视图
 */
- (void)removeAllSubviews {
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
    return;
}

@end
