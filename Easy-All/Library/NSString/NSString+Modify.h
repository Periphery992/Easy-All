//
//  NSString+Modify.h
//  Easy-All
//
//  Created by chensa on 2017/10/25.
//  Copyright © 2017年 chensa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Modify)

/**
 将纯数字字符串转化成以T（千）、M（百万）、B（十亿）为单位的字符串

 @return 转化后的字符串
 */
- (NSString *)numStringSetUnit;


/**
 将整形纯数字字符串，转化成用每个3位用逗号分隔的数字字符串

 @return 转化后的字符串
 */
- (NSString *)numStringSetComma;



@end
