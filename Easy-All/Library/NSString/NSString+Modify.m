//
//  NSString+Modify.m
//  Easy-All
//
//  Created by chensa on 2017/10/25.
//  Copyright © 2017年 chensa. All rights reserved.
//

#import "NSString+Modify.h"

@implementation NSString (Modify)

//转化成千、百万、十亿为单位
- (NSString *)numStringSetUnit
{
    NSString *strNewNum = @"";
    
    if (self.length < 4)
    {
        return self;
    }
    
    if ([self longLongValue] >= 1000000000)
    {
        strNewNum = [NSString stringWithFormat:@"%0.02fB",[self longLongValue]/1000000000.00];
    }
    else if ([self longLongValue] >= 1000000)
    {
        strNewNum = [NSString stringWithFormat:@"%0.02fM",[self longLongValue]/1000000.00];
    }
    else if ([self longLongValue] >= 1000)
    {
        strNewNum = [NSString stringWithFormat:@"%0.02fT",[self longLongValue]/1000.00];
    }
    
    return strNewNum;
}

- (NSString *)numStringSetComma
{
    NSString *strNewNum = @"";
    
    if (self.length < 4)
    {
        return self;
    }
    
    for (int i = 1 ; i < self.length; i++)
    {
        if (i%3==1)
        {
            strNewNum = [NSString stringWithFormat:@",%@",strNewNum];
        }
        
        NSString * strSub = [self substringWithRange:NSMakeRange(self.length-i, 1)];
        
        strNewNum = [NSString stringWithFormat:@"%@%@",strSub,strNewNum];
    }
    
    return strNewNum;
}



@end
