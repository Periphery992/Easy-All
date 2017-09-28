//
//  RadioButtonCell.m
//  Easy-All
//
//  Created by chensa on 2017/9/28.
//  Copyright © 2017年 chensa. All rights reserved.
//

#import "RadioButtonCell.h"

@interface RadioButtonCell ()
@property (nonatomic, strong) UIButton *btnRadioFirst;
@property (nonatomic, strong) UIButton *btnRadioSecond;
@property (nonatomic, strong) UIButton *btnRadioThird;


@end

@implementation RadioButtonCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.btnRadioFirst = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
        [self.btnRadioFirst addTarget:self action:@selector(Touch_btnRadioFirst) forControlEvents:UIControlEventTouchUpInside];
        self.btnRadioFirst.hidden = YES;
        [self.btnRadioFirst setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.btnRadioFirst setImage:[UIImage imageNamed:@"radiobox_sel"] forState:UIControlStateSelected];
        [self.btnRadioFirst setImage:[UIImage imageNamed:@"radiobox_unsel"] forState:UIControlStateNormal];
        [self.contentView addSubview:self.btnRadioFirst];
        
        self.btnRadioSecond = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
        [self.btnRadioSecond addTarget:self action:@selector(Touch_btnRadioSecond) forControlEvents:UIControlEventTouchUpInside];
        self.btnRadioSecond.hidden = YES;
        [self.btnRadioSecond setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.btnRadioSecond setImage:[UIImage imageNamed:@"radiobox_sel"] forState:UIControlStateSelected];
        [self.btnRadioSecond setImage:[UIImage imageNamed:@"radiobox_unsel"] forState:UIControlStateNormal];
        [self.contentView addSubview:self.btnRadioSecond];

        self.btnRadioThird = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
        [self.btnRadioThird addTarget:self action:@selector(Touch_btnRadioThird) forControlEvents:UIControlEventTouchUpInside];
        self.btnRadioThird.hidden = YES;
        [self.btnRadioThird setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.btnRadioThird setImage:[UIImage imageNamed:@"radiobox_sel"] forState:UIControlStateSelected];
        [self.btnRadioThird setImage:[UIImage imageNamed:@"radiobox_unsel"] forState:UIControlStateNormal];
        [self.contentView addSubview:self.btnRadioThird];

    }
    
    return self;
}

#pragma mark - config
- (void)configHiddenAllRadioBox
{
    self.btnRadioFirst.hidden = YES;
    self.btnRadioSecond.hidden = YES;
    self.btnRadioThird.hidden = YES;
}

- (void)configTitle:(NSString *)title font:(UIFont *)font color:(UIColor *)color
{
    self.textLabel.text = title;
    self.textLabel.font = font?font:self.textLabel.font;
    self.textLabel.textColor = color?color:self.textLabel.textColor;
}

- (void)configRadioFirstWithTitle:(NSString *)title font:(UIFont *)font color:(UIColor *)color
{
    self.btnRadioFirst.hidden = NO;
    [self.btnRadioFirst setTitle:title forState:UIControlStateNormal];
    self.btnRadioFirst.titleLabel.font = font?font:self.btnRadioFirst.titleLabel.font;
    if (color)
    {
        [self.btnRadioFirst setTitleColor:color forState:UIControlStateNormal];
        [self.btnRadioFirst setTitleColor:color forState:UIControlStateSelected];
    }
    
    [self fixPosition];
}

- (void)configRadioSecondWithTitle:(NSString *)title font:(UIFont *)font color:(UIColor *)color
{
    self.btnRadioSecond.hidden = NO;
    [self.btnRadioSecond setTitle:title forState:UIControlStateNormal];
    self.btnRadioSecond.titleLabel.font = font?font:self.btnRadioSecond.titleLabel.font;
    if (color)
    {
        [self.btnRadioSecond setTitleColor:color forState:UIControlStateNormal];
        [self.btnRadioSecond setTitleColor:color forState:UIControlStateSelected];
    }
    
    [self fixPosition];
}

- (void)configRadioThirdWithTitle:(NSString *)title font:(UIFont *)font color:(UIColor *)color
{
    self.btnRadioThird.hidden = NO;
    [self.btnRadioThird setTitle:title forState:UIControlStateNormal];
    self.btnRadioThird.titleLabel.font = font?font:self.btnRadioThird.titleLabel.font;
    if (color)
    {
        [self.btnRadioThird setTitleColor:color forState:UIControlStateNormal];
        [self.btnRadioThird setTitleColor:color forState:UIControlStateSelected];
    }
    
    [self fixPosition];
}

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

- (void)Touch_btnRadioFirst
{
    self.btnRadioFirst.selected = YES;
    self.btnRadioSecond.selected = NO;
    self.btnRadioThird.selected = NO;
}

- (void)Touch_btnRadioSecond
{
    self.btnRadioFirst.selected = NO;
    self.btnRadioSecond.selected = YES;
    self.btnRadioThird.selected = NO;
}

- (void)Touch_btnRadioThird
{
    self.btnRadioFirst.selected = NO;
    self.btnRadioSecond.selected = NO;
    self.btnRadioThird.selected = YES;
}


@end
