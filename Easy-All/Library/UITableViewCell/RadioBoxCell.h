//
//  RadioButtonCell.h
//  Easy-All
//
//  Created by chensa on 2017/9/28.
//  Copyright © 2017年 chensa. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RadioBoxCell;

@protocol RadioBoxCellDelegate <NSObject>
@optional
- (void)radioBoxCell:(RadioBoxCell *)radioBoxCell indexOfSelected:(NSInteger)index;

@end

@interface RadioBoxCell : UITableViewCell
@property (nonatomic, weak) id<RadioBoxCellDelegate> delegate;
- (void)configHiddenAllRadioBox;

- (void)configTitle:(NSString *)title font:(UIFont *)font color:(UIColor *)color;

- (void)configRadioFirstWithTitle:(NSString *)title font:(UIFont *)font color:(UIColor *)color;

- (void)configRadioSecondWithTitle:(NSString *)title font:(UIFont *)font color:(UIColor *)color;

- (void)configRadioThirdWithTitle:(NSString *)title font:(UIFont *)font color:(UIColor *)color;

- (NSInteger)getIndexOfSelected;
@end
