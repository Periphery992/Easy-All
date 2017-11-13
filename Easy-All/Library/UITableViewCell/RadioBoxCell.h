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

/**
 配置cell的文本属性

 @param title 文本内容
 @param font 文本字体
 @param color 文本颜色
 */
- (void)configTitle:(NSString *)title font:(UIFont *)font color:(UIColor *)color;


/**
 配置第一项选择框

 @param title 文本内容
 @param font 文本字体
 @param color 文本颜色
 @param isSelected 是否选中
 */
- (void)configRadioFirstWithTitle:(NSString *)title font:(UIFont *)font color:(UIColor *)color isSelected:(BOOL)isSelected;

/**
 配置第二项选择框
 
 @param title 文本内容
 @param font 文本字体
 @param color 文本颜色
 @param isSelected 是否选中
 */
- (void)configRadioSecondWithTitle:(NSString *)title font:(UIFont *)font color:(UIColor *)color isSelected:(BOOL)isSelected;

/**
 配置第二项选择框
 
 @param title 文本内容
 @param font 文本字体
 @param color 文本颜色
 @param isSelected 是否选中
 */
- (void)configRadioThirdWithTitle:(NSString *)title font:(UIFont *)font color:(UIColor *)color isSelected:(BOOL)isSelected;

/**
 配置选中项

 @param index 选中项编号，0，1，2
 */
- (void)configSelectedWithIndex:(NSInteger)index;

/**
 获取当前选中项编号

 @return 选中项的编号
 */
- (NSInteger)getIndexOfSelected;
@end
