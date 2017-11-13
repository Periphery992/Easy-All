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


/**
 配置cell的文本

 @param title 文本内容
 @param font 文本字体大小
 @param color 文本字体颜色
 */
- (void)configTitle:(NSString *)title font:(UIFont *)font color:(UIColor *)color;

/**
 配置输入项单位

 @param Unit 单位
 @param font 单位的字体大小
 @param color 单位的字体颜色
 */
- (void)configUnit:(NSString *)Unit font:(UIFont *)font color:(UIColor *)color;

/**
 配置输入框的文本属性

 @param textColor 输入框文字颜色
 @param font 输入框文字大小
 @param keyboardType 键盘类型
 */
- (void)configInputViewWithTextColor:(UIColor *)textColor textFont:(UIFont *)font keyboardType:(UIKeyboardType)keyboardType;

@end
