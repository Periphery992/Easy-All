//
//  HouseLoanManager.h
//  Easy-All
//
//  Created by chensa on 2017/9/26.
//  Copyright © 2017年 chensa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MonthPayBean.h"

typedef NS_ENUM(NSUInteger, HouseLoanCellSection) {
    HouseLoanCellSectionLoanType = 0,       //贷款方式
    HouseLoanCellSectionCalculateWay = 1,   //贷款金额计算方式
    HouseLoanCellSectionLoanAll = 2,        //贷款总额
    HouseLoanCellSectionHouseWorth = 3,     //房屋总价和首付比例
    HouseLoanCellSectionTime = 4,           //还款月数
    HouseLoanCellSectionInterestRate = 6,   //利率
    HouseLoanCellSectionDiscount = 7,       //折扣
    HouseLoanCellSectionEnd = 8,            //用于标记枚举类型总数
    
};

typedef NS_ENUM(NSUInteger, HouseLoanType) {
    HouseLoanTypeShangYe = 0,       //商业贷款
    HouseLoanTypeGongJiJin = 1,     //公积金贷款
    HouseLoanTypeZuHe = 2,          //组合贷款
};

typedef NS_ENUM(NSUInteger, HouseLoanPaymentType) {
    HouseLoanPaymentTypeAC = 0,       //等额本息
    HouseLoanPaymentTypeACPL = 1,     //等额本金
};

typedef NS_ENUM(NSUInteger, HouseLoanCalculateWay) {
    HouseLoanCalculateWayTotalLoan = 0,     //贷款金额
    HouseLoanCalculateWayTotalHouse = 1,    //房屋总价
};

@interface HouseLoanManager : NSObject

+ (instancetype)sharedInstance;

/**
 配置还款方式

 @param houseLoanPaymentType 还款方式
 */
- (void)configHouseLoanPaymentType:(HouseLoanPaymentType)houseLoanPaymentType;

/**
 配置贷款金额计算方式

 @param houseLoanCalculateWay 贷款金额计算方式
 */
- (void)configHouseLoanCalculateWay:(HouseLoanCalculateWay)houseLoanCalculateWay;

/**
 配置贷款总金额或房屋总价

 @param allLoan 贷款总金额
 */
- (void)configIAllLoan:(NSInteger)allLoan;

//配置房价总额
- (void)configIHousePrice:(NSInteger)housePrice;

/**
 配置贷款比例

 @param loanRate 贷款比例
 */
- (void)configLoanRate:(NSInteger)loanRate;

/**
 配置还款期数

 @param iMonths 还款期数（月）
 */
- (void)configIMonth:(NSInteger)iMonths;

/**
 配置利率

 @param InterestRate 利率
 */
- (void)configInterestRate:(CGFloat)InterestRate;

/**
 配置贷款折扣

 @param discount 贷款折扣
 */
- (void)configDiscount:(NSInteger)discount;

/**
 计算还款

 @return 还款情况数组
 */
- (NSMutableArray *)getResult;

//获取枚举类型选项总数
- (NSInteger)getHouseLoadCellSectionCount;

- (NSInteger)getHouseLoadCellRowCountWithSeciton:(HouseLoanCellSection)section;

- (HouseLoanPaymentType)getHouseLoanPaymentType;

//获取贷款计算发送
- (HouseLoanCalculateWay)getHouseLoanCalculateWay;

//获取总利息
- (CGFloat)getAllInterest;

//获取贷款总额
- (NSInteger)getAllLoan;

- (CGFloat)getRate;

- (CGFloat)getFirstPayment;

- (NSInteger)getMonths;

//配置房贷比例
- (NSInteger)getLoanRate;

//配置房价总额
- (NSInteger)getHousePrice;

//配置贷款折扣
- (NSInteger)getDiscount;

- (CGFloat)getReduce;

@end
