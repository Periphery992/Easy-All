//
//  UIView+Frame.h
//  Easy-All
//
//  Created by chensa on 2017/9/22.
//  Copyright © 2017年 chensa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Frame)

/**
 view左侧x坐标
 */
@property (nonatomic) CGFloat originX;

/**
 view顶部y坐标
 */
@property (nonatomic) CGFloat originY;

/**
 view右侧x坐标
 */
@property (nonatomic) CGFloat rightX;

/**
 view底部y坐标
 */
@property (nonatomic) CGFloat bottomY;

/**
 view的宽
 */
@property (nonatomic) CGFloat width;

/**
 view的高
 */
@property (nonatomic) CGFloat height;

/**
 view中心点的x坐标
 */
@property (nonatomic) CGFloat centerX;

/**
 view中心点的y坐标
 */
@property (nonatomic) CGFloat centerY;

/**
 view的origin
 */
@property (nonatomic) CGPoint origin;

/**
 view的size
 */
@property (nonatomic) CGSize size;


/**
 移除view上的所有subview
 */
- (void)removeAllSubviews;

@end
