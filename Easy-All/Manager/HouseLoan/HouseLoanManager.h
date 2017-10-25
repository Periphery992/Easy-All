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
    HouseLoanTypeAC = 0,       //等额本息
    HouseLoanTypeACPL = 1,     //等额本金
};

typedef NS_ENUM(NSUInteger, HouseLoanCalculateWay) {
    HouseLoanCalculateWayTotalLoan = 0,     //贷款金额
    HouseLoanCalculateWayTotalHouse = 1,    //房屋总价
};

@interface HouseLoanManager : NSObject

+ (instancetype)sharedInstance;

/**
 配置还款方式

 @param houseLoanType 还款方式
 */
- (void)configHouseLoanType:(HouseLoanType)houseLoanType;

/**
 配置贷款金额计算方式

 @param houseLoadCalculateWay 贷款金额计算方式
 */
- (void)configHouseLoadCalculateWay:(HouseLoanCalculateWay)houseLoadCalculateWay;

/**
 配置贷款总金额或房屋总价

 @param allLoan 贷款总金额或房屋总价
 */
- (void)configIAllLoan:(NSInteger)allLoan;

/**
 配置贷款比例

 @param loanRate 贷款比例
 */
- (void)configLoanRate:(CGFloat)loanRate;

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
- (void)configDiscount:(CGFloat)discount;

/**
 计算还款

 @return 还款情况数组
 */
- (NSMutableArray *)getResult;

//获取枚举类型选项总数
- (NSInteger)getHouseLoadCellSectionCount;

- (NSInteger)getHouseLoadCellRowCountWithSeciton:(HouseLoanCellSection)section;

- (HouseLoanType)getHouseLoanType;

//获取贷款计算发送
- (HouseLoanCalculateWay)getHouseLoanCalculateWay;

//获取总利息
- (CGFloat)getAllInterest;

//获取贷款总额
- (CGFloat)getAllLoan;

- (CGFloat)getRate;

@end
