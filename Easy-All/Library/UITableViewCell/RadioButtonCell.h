//
//  RadioButtonCell.h
//  Easy-All
//
//  Created by chensa on 2017/9/28.
//  Copyright © 2017年 chensa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RadioButtonCell : UITableViewCell

- (void)configTitle:(NSString *)title font:(UIFont *)font color:(UIColor *)color;

- (void)configRadioFirstWithTitle:(NSString *)title font:(UIFont *)font color:(UIColor *)color;

- (void)configRadioSecondWithTitle:(NSString *)title font:(UIFont *)font color:(UIColor *)color;

- (void)configRadioThirdWithTitle:(NSString *)title font:(UIFont *)font color:(UIColor *)color;


@end
