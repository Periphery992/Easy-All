//
//  MaskView.h
//  Easy-All
//
//  Created by chensa on 2017/10/19.
//  Copyright © 2017年 chensa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MaskView : UIView

/**
 创建蒙层

 @param alpha 透明度
 @param can 点击蒙层是否隐藏蒙层
 @return 蒙层实例
 */
- (id)initWithAlpha:(CGFloat)alpha tapCanHidden:(BOOL)can;

@end
