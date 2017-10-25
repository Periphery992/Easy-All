//
//  MaskView.m
//  Easy-All
//
//  Created by chensa on 2017/10/19.
//  Copyright © 2017年 chensa. All rights reserved.
//

#import "MaskView.h"

@implementation MaskView

- (id)initWithAlpha:(CGFloat)alpha
{
    if (self = [super init])
    {
        self.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        self.backgroundColor = UIColorFromRGB(0x000000, alpha);
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(Touch_Self)]];
    }
    return self;
}

- (void)Touch_Self
{
    self.hidden = YES;
}

@end
