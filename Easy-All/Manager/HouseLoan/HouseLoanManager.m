//
//  HouseLoanManager.m
//  Easy-All
//
//  Created by chensa on 2017/9/26.
//  Copyright © 2017年 chensa. All rights reserved.
//

#import "HouseLoanManager.h"

@interface HouseLoanManager()
@property (nonatomic, assign) CGFloat fAllLoan;                                     //贷款总金额或房价总额
@property (nonatomic, assign) CGFloat fInterestRate;                                //利率
@property (nonatomic, assign) NSInteger iMonths;                                    //贷款期数（月）
@property (nonatomic, strong) NSMutableArray *mutarrMonth;                          //每月还款明细
@property (nonatomic, assign) HouseLoanType houseLoanType;                          //房贷类型
@property (nonatomic, assign) HouseLoanCalculateWay houseLoadCalculateWay;          //房贷计算方式
@property (nonatomic, assign) CGFloat fLoanRate;                                    //房贷比例
@property (nonatomic, assign) NSInteger iDiscount;                                  //房贷折扣
@property (nonatomic, assign) CGFloat fAllInterest;                                 //总利息

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
        
    }
    return self;
}

#pragma mark - setData
//配置房贷类型
- (void)configHouseLoanType:(HouseLoanType)houseLoanType
{
    self.houseLoanType = houseLoanType;
}

//配置房贷计算方式
- (void)configHouseLoadCalculateWay:(HouseLoanCalculateWay)houseLoadCalculateWay
{
    self.houseLoadCalculateWay = houseLoadCalculateWay;
}

//配置房贷总额或房价总额
- (void)configIAllLoan:(NSInteger)allLoan
{
    self.fAllLoan = allLoan*10000.0;
}

//配置房贷比例
- (void)configLoanRate:(CGFloat)loanRate
{
    self.fLoanRate = loanRate;
}

//配置贷款期数
- (void)configIMonth:(NSInteger)iMonths
{
    self.iMonths = iMonths;
}

//配置贷款利息
- (void)configInterestRate:(CGFloat)InterestRate
{
    self.fInterestRate = InterestRate/100/12;
}

//配置贷款折扣
- (void)configDiscount:(CGFloat)discount
{
    self.iDiscount = discount;
}

#pragma mark - getData
//计算结果
- (NSMutableArray *)getResult
{
    if(self.houseLoanType == HouseLoanTypeAC) //如果是等额本金
    {
        [self getAverageCapitalResult];
    }
    else if (self.houseLoanType == HouseLoanTypeACPL) //如果是等额本息
    {
        [self getAverageInterestResult];
    }
    
    return self.mutarrMonth;
}

//等额本金
- (void)getAverageCapitalResult
{
    self.mutarrMonth = [[NSMutableArray alloc]init];
    
    CGFloat fALoan = self.fAllLoan;
    CGFloat fAInterestRate = self.fInterestRate * (self.iDiscount==0?100:self.iDiscount)/100.0;
    
    if (self.houseLoadCalculateWay == HouseLoanCalculateWayTotalHouse)
    {
        fALoan = self.fAllLoan*self.fLoanRate;
    }
    
    //每月月供额=〔贷款本金×月利率×(1＋月利率)＾还款月数〕÷〔(1＋月利率)＾还款月数-1〕
    CGFloat fMPayment = (fALoan * fAInterestRate * pow(1 + fAInterestRate, self.iMonths))/(pow(1 + fAInterestRate, self.iMonths)-1);
    //总利息=还款月数×每月月供额-贷款本金
    CGFloat fAllPayment = self.iMonths * fMPayment;
    
    for (int index = 0; index < self.iMonths; index ++)
    {
        //每月应还利息=贷款本金×月利率×〔(1+月利率)^还款月数-(1+月利率)^(还款月序号-1)〕÷〔(1+月利率)^还款月数-1〕
        CGFloat fMInterest = fALoan * fAInterestRate * (pow(1 + fAInterestRate, self.iMonths)-pow(1 + fAInterestRate, index))/(pow(1 + fAInterestRate, self.iMonths)-1);
        //每月应还本金=贷款本金×月利率×(1+月利率)^(还款月序号-1)÷〔(1+月利率)^还款月数-1〕
        CGFloat fMPrincipal = fALoan * fAInterestRate*pow(1 + fAInterestRate, index)/(pow(1 + fAInterestRate, self.iMonths)-1);
        
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
    
    CGFloat fALoan = self.fAllLoan;
    CGFloat fAInterestRate = self.fInterestRate * (self.iDiscount==0?100:self.iDiscount)/100.0;
    
    if (self.houseLoadCalculateWay == HouseLoanCalculateWayTotalHouse)
    {
        fALoan = self.fAllLoan*self.fLoanRate;
    }
    
    //每月应还本金=贷款本金÷还款月数
    CGFloat fMPrincipal = fALoan/self.iMonths;
    //每月月供递减额=每月应还本金×月利率=贷款本金÷还款月数×月利率
    CGFloat fMReduce = fMPrincipal*fAInterestRate;
    //总利息=〔(总贷款额÷还款月数+总贷款额×月利率)+总贷款额÷还款月数×(1+月利率)〕÷2×还款月数-总贷款额
    CGFloat fAllInterest = (fALoan/self.iMonths+fALoan*fAInterestRate+fALoan/self.iMonths*(1+fAInterestRate))/2*self.iMonths - fALoan;
    
    for (int index = 0; index < self.iMonths; index ++)
    {
        //已归还本金
        CGFloat fALLPayPrincipal = index*fMPrincipal;
        //剩余本金
        CGFloat fRemainderPrincipal = fALoan - fALLPayPrincipal;
        //每月应还利息=剩余本金×月利率=(贷款本金-已归还本金累计额)×月利率
        CGFloat fMInterest = fRemainderPrincipal*fAInterestRate;
        //每月月供额=(贷款本金÷还款月数)+(贷款本金-已归还本金累计额)×月利率
        CGFloat fMPayment = fMPrincipal + fMInterest;
        
        MonthPayBean *bean = [[MonthPayBean alloc] init];
        bean.iMonthNo = index;
        bean.fMPayment = fMPayment;
        bean.fMPrincipal = fMPrincipal;
        bean.fMInterest = fMInterest;
        bean.fRemainder = fALoan + fAllInterest - (fMPrincipal + fMInterest + fMPrincipal + fMInterest + fMReduce * index)*(index+1)/2;
        [self.mutarrMonth addObject:bean];
    }
}

//获取枚举类型选项总数，即section数
- (NSInteger)getHouseLoadCellSectionCount
{
    return HouseLoanCellSectionEnd;
}

//获取每个section的row数
- (NSInteger)getHouseLoadCellRowCountWithSeciton:(HouseLoanCellSection)section
{
    if (section == HouseLoanCellSectionLoanType
        || section == HouseLoanCellSectionCalculateWay
        || section == HouseLoanCellSectionTime
        || section == HouseLoanCellSectionInterestRate
        || section == HouseLoanCellSectionDiscount)
    {
        return 1;
    }
    else if (section == HouseLoanCellSectionLoanAll && self.houseLoadCalculateWay == HouseLoanCalculateWayTotalLoan)
    {
        return 1;
    }
    else if (section == HouseLoanCellSectionHouseWorth && self.houseLoadCalculateWay == HouseLoanCalculateWayTotalHouse)
    {
        return 2;
    }
    
    if (section == HouseLoanCellSectionEnd)
    {
        return 1;
    }
    
    return 0;
}

//获取贷款类型
- (HouseLoanType)getHouseLoanType
{
    return self.houseLoanType;
}

//获取贷款计算发送
- (HouseLoanCalculateWay)getHouseLoanCalculateWay
{
    return self.houseLoadCalculateWay;
}

//获取总利息
- (CGFloat)getAllInterest
{
    return self.fAllInterest;
}

//获取贷款总额
- (CGFloat)getAllLoan
{
    if (self.houseLoadCalculateWay == HouseLoanCalculateWayTotalHouse)
    {
        return self.fAllLoan*self.fLoanRate;
    }
    else
    {
        return  self.fAllLoan;
    }
}

//获取贷款利息
- (CGFloat)getRate
{
    return self.fLoanRate;
}

@end
