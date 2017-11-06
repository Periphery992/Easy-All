//
//  MoreTextCell.m
//  Easy-All
//
//  Created by chensa on 2017/11/4.
//  Copyright © 2017年 chensa. All rights reserved.
//

#import "MoreTextCell.h"

@implementation MoreTextCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        CGFloat width = SCREEN_WIDTH/5;
        for (int i = 0; i < 5; i++)
        {
            UILabel *lblTitle = [[UILabel alloc]initWithFrame:CGRectMake(0+width*i, 0, width, 30)];
            lblTitle.tag = 10000+i;
            lblTitle.textAlignment = NSTextAlignmentCenter;
            [self.contentView addSubview:lblTitle];
        }
    }
    return self;
}

- (void)configTextWithArrSting:(NSMutableArray *)mutarrString
{
//    NSInteger count = mutarrString.count;
    CGFloat width = SCREEN_WIDTH/mutarrString.count;
    for (int i = 0; i < mutarrString.count; i++)
    {
        UILabel *lblTitle = (UILabel *)[self.contentView viewWithTag:10000+i];
        lblTitle.frame = CGRectMake(0+width*i, 0, width, 30);
        lblTitle.text = mutarrString[i];
    }
}

@end
