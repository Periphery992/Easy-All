//
//  TestView.m
//  Easy-All
//
//  Created by chen on 20/10/2017.
//  Copyright © 2017 chensa. All rights reserved.
//

#import "TestView.h"

@interface TestView()

@property (nonatomic, strong) UIView *vwTest2;

@end

@implementation TestView

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.vwTest2 = [[UIView alloc]init];
        [self addSubview:self.vwTest2];
    
    }
    
    return self;
}


@end
