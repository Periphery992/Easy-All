//
//  HouseLoanManager.m
//  Easy-All
//
//  Created by chensa on 2017/9/26.
//  Copyright © 2017年 chensa. All rights reserved.
//

#import "HouseLoanManager.h"
#import "UserDefaultsKey.h"

@interface HouseLoanManager()
@property (nonatomic, assign) HouseLoanType houseLoanType;                          //贷款类型
@property (nonatomic, assign) HouseLoanPaymentType houseLoanPaymentType;            //还贷方式
@property (nonatomic, assign) NSInteger fAllLoan;                                   //贷款总金额或房价总额
@property (nonatomic, assign) CGFloat fInterestRate;                                //利率
@property (nonatomic, assign) NSInteger iMonths;                                    //贷款期数（月）
@property (nonatomic, strong) NSMutableArray *mutarrMonth;                          //每月还款明细
@property (nonatomic, assign) HouseLoanType houseLoanType;                          //房贷类型
@property (nonatomic, assign) HouseLoanType houseLoanType;                          //贷款类型
@property (nonatomic, assign) HouseLoanPaymentType houseLoanPaymentType;            //还贷方式
@property (nonatomic, assign) HouseLoanCalculateWay houseLoadCalculateWay;          //房贷计算方式
@property (nonatomic, assign) NSInteger iAllLoan;                                   //贷款总金额
@property (nonatomic, assign) NSInteger iSYLoan;                                    //商业贷款金额
@property (nonatomic, assign) NSInteger iHousePrice;                                //房屋总价
@property (nonatomic, assign) NSInteger iLoanRate;                                  //房贷比例
@property (nonatomic, assign) NSInteger iMonths;                                    //贷款期数（月）
@property (nonatomic, assign) CGFloat fInterestRate;                                //利率
@property (nonatomic, assign) NSInteger iDiscount;                                  //房贷折扣
@property (nonatomic, assign) NSInteger iGJJLoan;                                   //公积金贷款金额
@property (nonatomic, assign) CGFloat fGJJRate;                                      //公积金贷款利率


@property (nonatomic, assign) CGFloat fAllInterest;                                 //总利息
@property (nonatomic, strong) NSMutableArray *mutarrMonth;                          //每月还款明细
@property (nonatomic, assign) CGFloat fReduce;                                      //每月递减

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
        self.houseLoadCalculateWay = HouseLoanCalculateWayTotalLoan;
        self.iLoanRate = 70;
    }
    return self;
}

#pragma mark - setData
//配置房贷类型
- (void)configHouseLoanType:(HouseLoanType)houseLoanType
{
    self.houseLoanType = houseLoanType;
}

//配置房贷类型
- (void)configHouseLoanPaymentType:(HouseLoanPaymentType)houseLoanPaymentType
{
    self.houseLoanPaymentType = houseLoanPaymentType;
}

//配置房贷计算方式
- (void)configHouseLoanCalculateWay:(HouseLoanCalculateWay)houseLoanCalculateWay
{
    self.houseLoadCalculateWay = houseLoanCalculateWay;
    if (self.houseLoadCalculateWay == HouseLoanCalculateWayTotalLoan&&self.iHousePrice > 0&&self.iLoanRate > 0)
    {
        [self configIAllLoan:self.iHousePrice*self.iLoanRate/100];
    }
}

//配置房贷总额
- (void)configIAllLoan:(NSInteger)allLoan
{
    self.iAllLoan = allLoan;
}

//配置房价总额
- (void)configIHousePrice:(NSInteger)housePrice
{
    self.iHousePrice = housePrice;
    [self configIAllLoan:self.iHousePrice*self.iLoanRate/100];
}

//配置房贷比例
- (void)configLoanRate:(NSInteger)loanRate
{
    self.iLoanRate = loanRate;
    [self configIAllLoan:self.iHousePrice*self.iLoanRate/100];
}

- (void)configSYLoan:(NSInteger)SYLoan
{
    self.iLoanRate = loanRate;
    [self configIAllLoan:self.iHousePrice*self.iLoanRate/100];
}

- (void)configSYLoan:(NSInteger)SYLoan
{
    self.iSYLoan = SYLoan;
}

//配置贷款期数
- (void)configIMonth:(NSInteger)iMonths
{
    self.iMonths = iMonths;
}

//配置贷款利息
- (void)configInterestRate:(CGFloat)InterestRate
{
    self.fInterestRate = InterestRate/100.0/12.0;
}

//配置贷款折扣
- (void)configDiscount:(NSInteger)discount
{
    self.iDiscount = discount;
}

- (void)configiGJJLoan:(NSInteger)GJJLoan
{
    self.iGJJLoan = GJJLoan;
}

- (void)configfGJJRate:(CGFloat)GJJRate
{
    self.fGJJRate = GJJRate;
}


#pragma mark - getData
//计算结果
- (NSMutableArray *)getResult
{
    if(self.houseLoanPaymentType == HouseLoanPaymentTypeAC) //如果是等额本金
    {
        [self getAverageCapitalResult];
    }
    else if (self.houseLoanPaymentType == HouseLoanPaymentTypeACPL) //如果是等额本息
    {
        [self getAverageInterestResult];
    }
    
    return self.mutarrMonth;
}

//等额本金
- (void)getAverageCapitalResult
{
    self.mutarrMonth = [[NSMutableArray alloc]init];
    
    CGFloat fALoan = self.iAllLoan*10000;
    CGFloat fAInterestRate = self.fInterestRate * (self.iDiscount==0?100:self.iDiscount)/100.0;
    
    //每月月供额=〔贷款本金×月利率×(1＋月利率)＾还款月数〕÷〔(1＋月利率)＾还款月数-1〕
    CGFloat fMPayment = (fALoan * fAInterestRate * pow(1 + fAInterestRate, self.iMonths))/(pow(1 + fAInterestRate, self.iMonths)-1);
    //总还款 = 还款月数 × 每月月供额
    CGFloat fAllPayment = self.iMonths * fMPayment;
    //总利息 = 总还款额 - 贷款本金
    self.fAllInterest = fAllPayment - fALoan;
    
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

//等额本息
- (void)getAverageInterestResult
{
    self.mutarrMonth = [[NSMutableArray alloc]init];
    
    CGFloat fALoan = self.iAllLoan*10000;
    CGFloat fAInterestRate = self.fInterestRate * (self.iDiscount==0?100:self.iDiscount)/100.0;
    
    //每月应还本金=贷款本金÷还款月数
    CGFloat fMPrincipal = fALoan/self.iMonths;
    //每月月供递减额=每月应还本金×月利率=贷款本金÷还款月数×月利率
    CGFloat fMReduce = fMPrincipal*fAInterestRate;
    self.fReduce = fMReduce;
    //总利息=〔(总贷款额÷还款月数+总贷款额×月利率)+总贷款额÷还款月数×(1+月利率)〕÷2×还款月数-总贷款额
    CGFloat fAllInterest = (fALoan/self.iMonths+fALoan*fAInterestRate+fALoan/self.iMonths*(1+fAInterestRate))/2*self.iMonths - fALoan;
    self.fAllInterest = fAllInterest;
    
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
- (HouseLoanPaymentType)getHouseLoanPaymentType
{
    return self.houseLoanPaymentType;
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
- (NSInteger)getAllLoan
{
    return self.iAllLoan;
}

//获取贷款利息
- (CGFloat)getRate
{
    return self.fInterestRate*12*self.iDiscount;
}

//获取贷款利息
- (CGFloat)getFirstPayment
{
    MonthPayBean *bean = [self.mutarrMonth objectAtIndex:0];
    
    return bean.fMPayment;
}

//获取贷款利息
- (NSInteger)getMonths
{
    return self.iMonths;
}

//配置房贷比例
- (NSInteger)getLoanRate
{
    return self.iLoanRate;
}

//配置房价总额
- (NSInteger)getHousePrice
{
    return self.iHousePrice;
}

//配置贷款折扣
- (NSInteger)getDiscount
{
    return self.iDiscount;
}

- (CGFloat)getReduce
{
    return self.fReduce;
}

@end
