//
//  SwatchesView.m
//  fairy-kingdom
//
//  Created by chen on 01/11/2017.
//  Copyright © 2017 chen. All rights reserved.
//

#import "SwatchesView.h"

@interface SwatchesView()<UIGestureRecognizerDelegate>
@property (nonatomic, strong) UIPanGestureRecognizer *panGesture;
@property (nonatomic, strong) UIImageView *imgvwColor;
@property (nonatomic, assign) CGPoint originalCenter;

@end

@implementation SwatchesView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor whiteColor];
        
        self.imgvwColor = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 100, 100)];
        self.imgvwColor.backgroundColor = [UIColor redColor];
        self.imgvwColor.userInteractionEnabled = YES;
        [self addSubview:self.imgvwColor];
        
        UIView *btnPoint = [[UIView alloc]initWithFrame:CGRectMake(self.imgvwColor.originX-12.5, self.imgvwColor.originY-12.5, 25, 25)];
        btnPoint.backgroundColor = [UIColor clearColor];
        btnPoint.layer.cornerRadius = 12.5;
        btnPoint.layer.borderWidth = 2;
        btnPoint.layer.borderColor = [UIColor blackColor].CGColor;
        btnPoint.userInteractionEnabled = YES;
        self.panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureRecognize:)];
        self.panGesture.delegate = self;
        [btnPoint addGestureRecognizer:self.panGesture];
        [self addSubview:btnPoint];
    }
    
    return self;
}

- (void)panGestureRecognize:(UIPanGestureRecognizer *)tap
{
    CGPoint currentPoint = [tap translationInView:tap.view];
    
    if (tap.state == UIGestureRecognizerStateBegan)
    {
        self.originalCenter = tap.view.center;
    }
    
    if (tap.state == UIGestureRecognizerStateChanged)
    {
        tap.view.centerX = self.originalCenter.x + currentPoint.x;
        tap.view.centerY = self.originalCenter.y + currentPoint.y;
    }

    tap.view.centerX = tap.view.centerX > self.imgvwColor.rightX?self.imgvwColor.rightX:tap.view.centerX;
    tap.view.centerX = tap.view.centerX < self.imgvwColor.originX?self.imgvwColor.originX:tap.view.centerX;

    tap.view.centerY = tap.view.bottomY > self.imgvwColor.bottomY?self.imgvwColor.bottomY:tap.view.centerY;
    tap.view.centerY = tap.view.centerY < self.imgvwColor.originY?self.imgvwColor.originY:tap.view.centerY;
 
}

@end
