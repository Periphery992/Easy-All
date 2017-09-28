//
//  HouseLoadConfigViewController.h
//  Easy-All
//
//  Created by chensa on 2017/9/28.
//  Copyright © 2017年 chensa. All rights reserved.
//

#import "CommonViewController.h"

typedef NS_ENUM(NSUInteger, HouseLoanCellRow) {
    HouseLoanCellRowLoanType = 0,       //贷款方式
    HouseLoanCellRowCalculateWay = 1,   //贷款金额计算方式
    HouseLoanCellRowLoadAll = 2,        //贷款总额
    HouseLoanCellRowPaymentRatios = 3,  //首付比例

};

typedef NS_ENUM(NSUInteger, HouseLoanType) {
    <#MyEnumValueA#>,
    <#MyEnumValueB#>,
    <#MyEnumValueC#>,
};

@interface HouseLoanConfigViewController : CommonViewController

@end
