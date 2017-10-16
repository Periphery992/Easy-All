//
//  InputBoxCell.h
//  Easy-All
//
//  Created by chensa on 2017/10/2.
//  Copyright © 2017年 chensa. All rights reserved.
//

#import <UIKit/UIKit.h>

@class InputBoxCell;
@protocol InputBoxCellDelegate <NSObject>

- (void)inputBoxCell:(InputBoxCell *)inputBoxCell textFieldChanged:(NSString *)text;

@end

@interface InputBoxCell : UITableViewCell
@property (nonatomic, weak) id<InputBoxCellDelegate> delegate;

- (void)configTitle:(NSString *)title font:(UIFont *)font color:(UIColor *)color;

- (void)configUnit:(NSString *)Unit font:(UIFont *)font color:(UIColor *)color;

- (void)configInputViewWithTextColor:(UIColor *)textColor textFont:(UIFont *)font keyboardType:(UIKeyboardType)keyboardType;

@end
