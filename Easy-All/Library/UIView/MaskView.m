//
//  MaskView.m
//  Easy-All
//
//  Created by chensa on 2017/10/19.
//  Copyright © 2017年 chensa. All rights reserved.
//

#import "MaskView.h"

@implementation MaskView
//创建
- (id)initWithAlpha:(CGFloat)alpha tapCanHidden:(BOOL)can
{
    if (self = [super init])
    {
        self.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        self.backgroundColor = UIColorFromRGB(0x000000, alpha);
        if (can) //如果需要支持点击蒙层隐藏蒙层
        {
            [self addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(Touch_Self)]];
        }
        
    }
    return self;
}

//蒙层点击事件
- (void)Touch_Self
{
    //隐藏蒙层
    self.hidden = YES;
}

@end
