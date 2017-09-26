//
//  HouseLoanManager.m
//  Easy-All
//
//  Created by chensa on 2017/9/26.
//  Copyright © 2017年 chensa. All rights reserved.
//

#import "HouseLoanManager.h"

@interface HouseLoanManager()
@property (nonatomic, assign) CGFloat fAllLoan;
@property (nonatomic, assign) CGFloat fRate;
@property (nonatomic, assign) NSInteger iMonths;
@property (nonatomic, strong) NSMutableArray *mutarrMonth;

@end

@implementation HouseLoanManager

+ (instancetype)sharedInstance
{
    static id _sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[[self class] alloc] init];
    });
    return _sharedInstance;
}

- (instancetype)init
{
    if (self = [super init])
    {
        [self configAllLoan:100 Months:360 Rate:4.9];
        [self getFixedPaymentResult];
    }
    return self;
}

- (void)configAllLoan:(NSInteger)allLoan Months:(NSInteger)months Rate:(CGFloat)rate
{
    self.fAllLoan = allLoan*10000.0;
    self.iMonths = months;
    self.fRate = rate/100/12;
}


- (void)getFixedPaymentResult
{
    self.mutarrMonth = [[NSMutableArray alloc]init];
    
    

//    每月月供额=〔贷款本金×月利率×(1＋月利率)＾还款月数〕÷〔(1＋月利率)＾还款月数-1〕
    CGFloat fMPayment = (self.fAllLoan*self.fRate*pow(1+self.fRate, self.iMonths))/(pow(1+self.fRate, self.iMonths)-1);
//    总利息=还款月数×每月月供额-贷款本金
    CGFloat fAllPayment = self.iMonths * fMPayment;
    
    for (int index = 0; index < self.iMonths; index ++)
    {
        //    每月应还利息=贷款本金×月利率×〔(1+月利率)^还款月数-(1+月利率)^(还款月序号-1)〕÷〔(1+月利率)^还款月数-1〕
        CGFloat fMInterest = self.fAllLoan*self.fRate*(pow(1+self.fRate, self.iMonths)-pow(1+self.fRate, index))/(pow(1+self.fRate, self.iMonths)-1);
        //    每月应还本金=贷款本金×月利率×(1+月利率)^(还款月序号-1)÷〔(1+月利率)^还款月数-1〕
        CGFloat fMPrincipal = self.fAllLoan*self.fRate*pow(1+self.fRate, index)/(pow(1+self.fRate, self.iMonths)-1);
        
        MonthPayBean *bean = [[MonthPayBean alloc] init];
        bean.iMonthNo = index;
        bean.fMPayment = fMPayment;
        bean.fMPrincipal = fMPrincipal;
        bean.fMInterest = fMInterest;
        bean.fRemainder = fAllPayment - (index+1)*fMPayment;
        [self.mutarrMonth addObject:bean];
    }

}

@end
