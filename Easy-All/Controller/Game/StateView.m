//
//  StateView.m
//  Easy-All
//
//  Created by chensa on 2017/10/29.
//  Copyright © 2017年 chensa. All rights reserved.
//

#import "StateView.h"
#import "ProgressBar.h"

@interface StateView()
@property (nonatomic, strong) ProgressBar *progressBar_HP;
@end


@implementation StateView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor redColor];
        self.progressBar_HP = [[ProgressBar alloc]initWithFrame:CGRectMake(5, 0, self.width-10, 4)];
        [self addSubview:self.progressBar_HP];
    }
    
    return self;
}

- (void)configProgressBarPosition:(CharacterViewProgressPosition)position
{
    if (position == CharacterViewProgressPositionTop)
    {
        self.progressBar_HP.frame = CGRectMake(5, 10, self.width-10, 4);
    }
    else if (position == CharacterViewProgressPositionBottom)
    {
        self.progressBar_HP.frame = CGRectMake(5, self.height - 10, self.width-10, 4);
    }
}

@end
