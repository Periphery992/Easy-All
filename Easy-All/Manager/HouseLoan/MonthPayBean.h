//
//  MonthPayBean.h
//  Easy-All
//
//  Created by chensa on 2017/9/26.
//  Copyright © 2017年 chensa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MonthPayBean : NSObject
@property (nonatomic, assign) NSInteger iMonthNo;
@property (nonatomic, assign) CGFloat fMPayment;
@property (nonatomic, assign) CGFloat fMInterest;
@property (nonatomic, assign) CGFloat fMPrincipal;
@property (nonatomic, assign) CGFloat fRemainder;

@end
