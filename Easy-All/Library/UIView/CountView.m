//
//  CountView.m
//  Easy-All
//
//  Created by chensa on 2017/10/25.
//  Copyright © 2017年 chensa. All rights reserved.
//

#import "CountView.h"
#import "NSString+Modify.h"

@interface CountView ()
@property (nonatomic, strong) UIImageView *imgvwIcon;
@property (nonatomic, strong) UILabel *lblCount;
@property (nonatomic, strong) UIImageView *imgvwBackGround;

@end

@implementation CountView

- (instancetype)initWithFrame:(CGRect)frame icon:(UIImage *)icon backgroundImage:(UIImage *)backgroundImage
{
    if (self = [super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor redColor];
        
        //背景图片
        self.imgvwBackGround = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        self.imgvwBackGround.image = backgroundImage;
        [self addSubview:self.imgvwBackGround];
        
        //icon图片
        self.imgvwIcon = [[UIImageView alloc]initWithImage:icon];
        self.imgvwIcon.origin = CGPointMake(0, self.frame.size.height/2-self.imgvwIcon.frame.size.height/2);
        [self.imgvwBackGround addSubview:self.imgvwIcon];
        
        //
        self.lblCount = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, frame.size.width-self.imgvwIcon.width, self.frame.size.height)];
        self.lblCount.textAlignment = NSTextAlignmentRight;
        self.lblCount.font = [UIFont systemFontOfSize:12];
        [self addSubview:self.lblCount];
    }
    return self;
}

//配置数量
- (void)configCount:(long long int)count
{
    NSString *strCount = [NSString stringWithFormat:@"%lld",count];
    
    //转化成T(千),M(百万),B(十亿)为单位
    strCount = [strCount numStringSetUnit];
    
    self.lblCount.text = strCount;

}



@end
