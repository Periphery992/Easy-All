//
//  InputBoxCell.m
//  Easy-All
//
//  Created by chensa on 2017/10/2.
//  Copyright © 2017年 chensa. All rights reserved.
//

#import "InputBoxCell.h"

@interface InputBoxCell()<UITextFieldDelegate>
@property (nonatomic, strong) UIView *vwBox;
@property (nonatomic, strong) UITextField *txtContent;
@property (nonatomic, strong) UILabel *lblUnit;

@end

@implementation InputBoxCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        //输入款
        self.txtContent = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, 0, 30)];
        self.txtContent.width = 130;
        self.txtContent.rightX = SCREEN_WIDTH - 15;
        self.txtContent.centerY = 22;
        self.txtContent.delegate = self;
        self.txtContent.borderStyle = UITextBorderStyleRoundedRect; //圆角边框
        [self.contentView addSubview:self.txtContent];
        
        //单位
        self.lblUnit = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
        [self.contentView addSubview:self.lblUnit];
    }
    return self;
}

#pragma mark - Config
//配置cell的文本内容
- (void)configTitle:(NSString *)title font:(UIFont *)font color:(UIColor *)color
{
    self.textLabel.text = title;
    self.textLabel.font = font?font:self.textLabel.font;
    self.textLabel.textColor = color?color:self.textLabel.textColor;
}

//配置输入项的单位
- (void)configUnit:(NSString *)Unit font:(UIFont *)font color:(UIColor *)color
{
    self.lblUnit.text = Unit;
    self.lblUnit.font = font?font:self.lblUnit.font;
    self.lblUnit.textColor = color?color:self.lblUnit.textColor;
    
    [self.lblUnit sizeToFit];
    if (self.lblUnit.width > 0)
    {
        self.lblUnit.width = self.lblUnit.width > 20?self.lblUnit.width:20;
    }
    self.lblUnit.rightX = SCREEN_WIDTH - 10;
    self.lblUnit.centerY = 22;
    self.txtContent.rightX = self.lblUnit.originX - 5;
}

//配置输入框的文本属性
- (void)configInputViewWithTextColor:(UIColor *)textColor textFont:(UIFont *)font keyboardType:(UIKeyboardType)keyboardType
{
    self.txtContent.textColor = textColor?textColor:self.txtContent.textColor;
    self.txtContent.font = font?font:self.txtContent.font;
    self.txtContent.keyboardType = keyboardType;
    self.txtContent.rightX = self.lblUnit.originX - 5;
}

#pragma mark - UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    self.txtContent.text = [self.txtContent.text stringByReplacingCharactersInRange:range withString:string];
    
    if ([self.delegate respondsToSelector:@selector(inputBoxCell:textFieldChanged:)])
    {
        [self.delegate inputBoxCell:self textFieldChanged:self.txtContent.text];
    }
    
    return NO;
}


@end
