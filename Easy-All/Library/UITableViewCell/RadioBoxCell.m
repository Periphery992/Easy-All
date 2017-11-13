//
//  RadioButtonCell.m
//  Easy-All
//
//  Created by chensa on 2017/9/28.
//  Copyright © 2017年 chensa. All rights reserved.
//

#import "RadioBoxCell.h"

@interface RadioBoxCell ()
@property (nonatomic, strong) UIButton *btnRadioFirst;
@property (nonatomic, strong) UIButton *btnRadioSecond;
@property (nonatomic, strong) UIButton *btnRadioThird;

@end

@implementation RadioBoxCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        //第一项选择框
        self.btnRadioFirst = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
        [self.btnRadioFirst addTarget:self action:@selector(Touch_btnRadioFirstIsConfig:) forControlEvents:UIControlEventTouchUpInside];
        self.btnRadioFirst.hidden = YES;
        [self.btnRadioFirst setTitleColor:UIColorFromRGB(lGrayColor, 1.0f) forState:UIControlStateNormal];
        [self.btnRadioFirst setImage:[UIImage imageNamed:@"radiobox_sel"] forState:UIControlStateSelected];
        [self.btnRadioFirst setImage:[UIImage imageNamed:@"radiobox_unsel"] forState:UIControlStateNormal];
        self.btnRadioFirst.titleLabel.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:self.btnRadioFirst];
        
        //第二项选择框
        self.btnRadioSecond = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
        [self.btnRadioSecond addTarget:self action:@selector(Touch_btnRadioSecondIsConfig:) forControlEvents:UIControlEventTouchUpInside];
        self.btnRadioSecond.hidden = YES;
        [self.btnRadioSecond setTitleColor:UIColorFromRGB(lGrayColor, 1.0f) forState:UIControlStateNormal];
        [self.btnRadioSecond setImage:[UIImage imageNamed:@"radiobox_sel"] forState:UIControlStateSelected];
        [self.btnRadioSecond setImage:[UIImage imageNamed:@"radiobox_unsel"] forState:UIControlStateNormal];
        self.btnRadioSecond.titleLabel.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:self.btnRadioSecond];
        
        //第三项选择框
        self.btnRadioThird = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
        [self.btnRadioThird addTarget:self action:@selector(Touch_btnRadioThirdIsConfig:) forControlEvents:UIControlEventTouchUpInside];
        self.btnRadioThird.hidden = YES;
        [self.btnRadioThird setTitleColor:UIColorFromRGB(lGrayColor, 1.0f) forState:UIControlStateNormal];
        [self.btnRadioThird setImage:[UIImage imageNamed:@"radiobox_sel"] forState:UIControlStateSelected];
        [self.btnRadioThird setImage:[UIImage imageNamed:@"radiobox_unsel"] forState:UIControlStateNormal];
        self.btnRadioThird.titleLabel.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:self.btnRadioThird];
        
    }
    
    return self;
}

#pragma mark - config
//配置cell的文本属性
- (void)configTitle:(NSString *)title font:(UIFont *)font color:(UIColor *)color
{
    self.textLabel.text = title;
    self.textLabel.font = font?font:self.textLabel.font;
    self.textLabel.textColor = color?color:self.textLabel.textColor;
}

//配置第一项选择框文本属性
- (void)configRadioFirstWithTitle:(NSString *)title font:(UIFont *)font color:(UIColor *)color isSelected:(BOOL)isSelected
{
    self.btnRadioFirst.hidden = NO;
    [self.btnRadioFirst setTitle:title forState:UIControlStateNormal];
    self.btnRadioFirst.titleLabel.font = font?font:self.btnRadioFirst.titleLabel.font;
    if (color)
    {
        [self.btnRadioFirst setTitleColor:color forState:UIControlStateNormal];
        [self.btnRadioFirst setTitleColor:color forState:UIControlStateSelected];
    }
    
    if (isSelected)
    {
            [self Touch_btnRadioFirstIsConfig:NO];
    }
    
    [self fixPosition];
}

//配置第二项选择框文本属性
- (void)configRadioSecondWithTitle:(NSString *)title font:(UIFont *)font color:(UIColor *)color isSelected:(BOOL)isSelected
{
    self.btnRadioSecond.hidden = NO;
    [self.btnRadioSecond setTitle:title forState:UIControlStateNormal];
    self.btnRadioSecond.titleLabel.font = font?font:self.btnRadioSecond.titleLabel.font;
    if (color)
    {
        [self.btnRadioSecond setTitleColor:color forState:UIControlStateNormal];
        [self.btnRadioSecond setTitleColor:color forState:UIControlStateSelected];
    }
    
    if (isSelected)
    {
        [self Touch_btnRadioSecondIsConfig:NO];
    }
    
    [self fixPosition];
}

//配置第三项选择框文本属性
- (void)configRadioThirdWithTitle:(NSString *)title font:(UIFont *)font color:(UIColor *)color isSelected:(BOOL)isSelected
{
    self.btnRadioThird.hidden = NO;
    [self.btnRadioThird setTitle:title forState:UIControlStateNormal];
    self.btnRadioThird.titleLabel.font = font?font:self.btnRadioThird.titleLabel.font;
    if (color)
    {
        [self.btnRadioThird setTitleColor:color forState:UIControlStateNormal];
        [self.btnRadioThird setTitleColor:color forState:UIControlStateSelected];
    }
    
    if (isSelected)
    {
       [self Touch_btnRadioThirdIsConfig:NO];
    }
    
    [self fixPosition];
}

//配置选中项
- (void)configSelectedWithIndex:(NSInteger)index
{
    if (index == 0)
    {
        [self Touch_btnRadioFirstIsConfig:YES];
        return;
    }
    else if (index == 1)
    {
        [self Touch_btnRadioSecondIsConfig:YES];
        return;
    }
    else if (index == 2)
    {
        [self Touch_btnRadioThirdIsConfig:YES];
        return;
    }
   [self Touch_btnRadioFirstIsConfig:YES];
}

//获取当前选中项编号
- (NSInteger)getIndexOfSelected
{
    if (self.btnRadioFirst.selected)
    {
        return 0;
    }
    
    if (self.btnRadioSecond.selected)
    {
        return 1;
    }
    
    if (self.btnRadioThird.selected)
    {
        return 2;
    }
    return 0;
    
}

//调整位置
- (void)fixPosition
{
    CGFloat right = 10;
    
    if(!self.btnRadioThird.hidden)
    {
        [self.btnRadioThird sizeToFit];
        self.btnRadioThird.rightX = SCREEN_WIDTH - right;
        self.btnRadioThird.centerY = 22;
        right = right + self.btnRadioThird.width +15;
    }
    
    if(!self.btnRadioSecond.hidden)
    {
        [self.btnRadioSecond sizeToFit];
        self.btnRadioSecond.rightX = SCREEN_WIDTH - right;
        self.btnRadioSecond.centerY = 22;
        right = right + self.btnRadioSecond.width +15;
    }
    
    if(!self.btnRadioFirst.hidden)
    {
        [self.btnRadioFirst sizeToFit];
        self.btnRadioFirst.rightX = SCREEN_WIDTH - right;
        self.btnRadioFirst.centerY = 22;
        right = right + self.btnRadioFirst.width +15;
    }
    
}

#pragma mark - Event
//选中第一项
- (void)Touch_btnRadioFirstIsConfig:(BOOL)isConfig
{
    if (!self.btnRadioThird.selected)
    {
        self.btnRadioFirst.selected = YES;
        self.btnRadioSecond.selected = NO;
        self.btnRadioThird.selected = NO;
        
        if (!isConfig)
        {
            [self TouchEvent];
        }
        
    }
}

//选中第二项
- (void)Touch_btnRadioSecondIsConfig:(BOOL)isConfig
{
    if (!self.btnRadioThird.selected)
    {
        self.btnRadioFirst.selected = NO;
        self.btnRadioSecond.selected = YES;
        self.btnRadioThird.selected = NO;
        
        if (!isConfig)
        {
            [self TouchEvent];
        }
    }
}

//选中第三项
- (void)Touch_btnRadioThirdIsConfig:(BOOL)isConfig
{
    if (!self.btnRadioThird.selected)
    {
        self.btnRadioFirst.selected = NO;
        self.btnRadioSecond.selected = NO;
        self.btnRadioThird.selected = YES;
        
        if (!isConfig)
        {
            [self TouchEvent];
        }
    }
}

//点击事件回调
- (void)TouchEvent
{
    if ([self.delegate respondsToSelector:@selector(radioBoxCell:indexOfSelected:)])
    {
        [self.delegate radioBoxCell:self indexOfSelected:[self getIndexOfSelected]];
    }
}

@end

