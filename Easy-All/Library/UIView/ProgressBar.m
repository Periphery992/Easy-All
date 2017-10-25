//
//  ProgressBar.m
//  Easy-All
//
//  Created by chen on 25/10/2017.
//  Copyright © 2017 chensa. All rights reserved.
//

#import "ProgressBar.h"

typedef enum : NSUInteger {
    ProgressBarOrientationHorizontal,  //水平方向
    ProgressBarOrientationVertical    //垂直方向
} ProgressBarOrientation;

@interface ProgressBar()
@property (nonatomic, strong) UIView *vwProgress;
@property (nonatomic, assign) float fTotal;
@property (nonatomic, assign) float fNow;
@property (nonatomic, assign) float fRate;
@property (nonatomic, assign) ProgressBarOrientation orientation;


@end

@implementation ProgressBar

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        if (frame.size.height > frame.size.width)
        {
            self.orientation = ProgressBarOrientationVertical;
        }
        else
        {
            self.orientation = ProgressBarOrientationHorizontal;
        }
        
        
        self.backgroundColor = [UIColor whiteColor];
        
        self.vwProgress = [[UIView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        [self addSubview:self.vwProgress];
        
        [self reloadView];
    }
    return self;
}

- (void)configBackgroundColor:(UIColor *)color
{
    self.backgroundColor = color;
}

- (void)configProgressColor:(UIColor *)color
{
    self.vwProgress.backgroundColor = color;
}

- (void)configProgressWithfNow:(float)fNow fTotal:(float)fTotal animated:(BOOL)animated
{
    self.fTotal = fTotal;
    self.fNow = fNow;
    self.fRate = self.fNow/self.fTotal;
    
    if (animated)
    {
        [UIView animateWithDuration:0.2 animations:^{
           
            [self ProgressChange];
        }];
    }
    else
    {
        [self ProgressChange];
    }
    
}

- (void)configProgressWithfNow:(float)fNow animated:(BOOL)animated
{
    self.fNow = fNow;
    self.fRate = self.fNow/self.fTotal;
    
    if (animated)
    {
        [UIView animateWithDuration:1 animations:^{
            
            [self ProgressChange];
        }];
    }
    else
    {
        [self ProgressChange];
    }
}

- (void)configProgressWithfRate:(float)fRate animated:(BOOL)animated
{
    self.fRate = fRate;
    
    if (animated)
    {
        [UIView animateWithDuration:1 animations:^{
            
            [self ProgressChange];
        }];
    }
    else
    {
        [self ProgressChange];
    }
}


- (void)ProgressChange
{
    if (self.orientation == ProgressBarOrientationHorizontal)
    {
        self.vwProgress.width = self.frame.size.width*self.fRate;
    }
    else
    {
        self.vwProgress.height = self.frame.size.height*self.fRate;
    }
}

- (void)reloadView
{
    self.layer.cornerRadius = self.orientation==ProgressBarOrientationHorizontal?self.frame.size.height/2:self.frame.size.width/2;
    
    self.vwProgress.backgroundColor = [UIColor greenColor];
    self.vwProgress.layer.cornerRadius = self.layer.cornerRadius;
}

@end
