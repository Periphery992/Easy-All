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
//        [self getAverageCapitalResult];
        [self getAverageInterestResult];
    }
    return self;
}

- (void)configAllLoan:(NSInteger)allLoan Months:(NSInteger)months Rate:(CGFloat)rate
{
    self.fAllLoan = allLoan*10000.0;
    self.iMonths = months;
    self.fRate = rate/100/12;
}

//等额本金
- (void)getAverageCapitalResult
{
    self.mutarrMonth = [[NSMutableArray alloc]init];
    
    //每月月供额=〔贷款本金×月利率×(1＋月利率)＾还款月数〕÷〔(1＋月利率)＾还款月数-1〕
    CGFloat fMPayment = (self.fAllLoan*self.fRate*pow(1+self.fRate, self.iMonths))/(pow(1+self.fRate, self.iMonths)-1);
    //总利息=还款月数×每月月供额-贷款本金
    CGFloat fAllPayment = self.iMonths * fMPayment;
    
    for (int index = 0; index < self.iMonths; index ++)
    {
        //每月应还利息=贷款本金×月利率×〔(1+月利率)^还款月数-(1+月利率)^(还款月序号-1)〕÷〔(1+月利率)^还款月数-1〕
        CGFloat fMInterest = self.fAllLoan*self.fRate*(pow(1+self.fRate, self.iMonths)-pow(1+self.fRate, index))/(pow(1+self.fRate, self.iMonths)-1);
        //每月应还本金=贷款本金×月利率×(1+月利率)^(还款月序号-1)÷〔(1+月利率)^还款月数-1〕
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

- (void)getAverageInterestResult
{
    self.mutarrMonth = [[NSMutableArray alloc]init];
    
    //每月应还本金=贷款本金÷还款月数
    CGFloat fMPrincipal = self.fAllLoan/self.iMonths;
    //每月月供递减额=每月应还本金×月利率=贷款本金÷还款月数×月利率
    CGFloat fMReduce = fMPrincipal*self.fRate;
    //总利息=〔(总贷款额÷还款月数+总贷款额×月利率)+总贷款额÷还款月数×(1+月利率)〕÷2×还款月数-总贷款额
    CGFloat fAllInterest = (self.fAllLoan/self.iMonths+self.fAllLoan*self.fRate+self.fAllLoan/self.iMonths*(1+self.fRate))/2*self.iMonths - self.fAllLoan;
    
    for (int index = 0; index < self.iMonths; index ++)
    {
        //已归还本金
        CGFloat fALLPayPrincipal = index*fMPrincipal;
        //剩余本金
        CGFloat fRemainderPrincipal = self.fAllLoan - fALLPayPrincipal;
        //每月应还利息=剩余本金×月利率=(贷款本金-已归还本金累计额)×月利率
        CGFloat fMInterest = fRemainderPrincipal*self.fRate;
        //每月月供额=(贷款本金÷还款月数)+(贷款本金-已归还本金累计额)×月利率
        CGFloat fMPayment = fMPrincipal + fMInterest;
        
        MonthPayBean *bean = [[MonthPayBean alloc] init];
        bean.iMonthNo = index;
        bean.fMPayment = fMPayment;
        bean.fMPrincipal = fMPrincipal;
        bean.fMInterest = fMInterest;
        bean.fRemainder = self.fAllLoan + fAllInterest - (fMPrincipal + fMInterest + fMPrincipal + fMInterest + fMReduce * index)*(index+1)/2;
        [self.mutarrMonth addObject:bean];
    }
}

@end
