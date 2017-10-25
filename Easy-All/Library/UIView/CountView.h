//
//  CountView.h
//  Easy-All
//
//  Created by chensa on 2017/10/25.
//  Copyright © 2017年 chensa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CountView : UIButton

- (instancetype)initWithFrame:(CGRect)frame icon:(UIImage *)icon backgroundImage:(UIImage *)backgroundImage;
- (void)configCount:(long long int)count;

@end
