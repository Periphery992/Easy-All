//
//  NSDecimalNumber+Easy.m
//  fairy-kingdom
//
//  Created by chen on 13/11/2017.
//  Copyright © 2017 chen. All rights reserved.
//

#import "NSDecimalNumber+Easy.h"

@implementation NSDecimalNumber (Easy)

- (NSDecimalNumber *)round:(NSString *)string scale:(NSInteger)scale
{
    NSDecimalNumberHandler *roundBankers = [NSDecimalNumberHandler
                                            decimalNumberHandlerWithRoundingMode:NSRoundPlain
                                            scale:scale
                                            raiseOnExactness:NO
                                            raiseOnOverflow:NO
                                            raiseOnUnderflow:NO
                                            raiseOnDivideByZero:YES];
    
    NSDecimalNumber *d = [NSDecimalNumber decimalNumberWithString:string];
    d = [d decimalNumberByRoundingAccordingToBehavior:roundBankers];
    
    return d;
}

@end
