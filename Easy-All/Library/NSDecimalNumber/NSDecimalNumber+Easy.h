//
//  NSDecimalNumber+Easy.h
//  fairy-kingdom
//
//  Created by chen on 13/11/2017.
//  Copyright © 2017 chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDecimalNumber (Easy)

/**
 四舍五入算法

 @param string 数字对应的字符串
 @param scale 保留小数位数
 @return 计算结果
 */
+ (NSDecimalNumber *)round:(NSString *)string scale:(NSInteger)scale;

@end
