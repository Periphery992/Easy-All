//
//  MainBean.h
//  Easy-All
//
//  Created by chen on 26/09/2017.
//  Copyright © 2017 chensa. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, MainType) {
    ECMainSmallTools  = 0 ,
};


@interface MainBean : NSObject<NSCopying,NSMutableCopying>

@property (nonatomic, copy) NSString *Name;
@property (nonatomic, copy) NSString *Controller;
@property (nonatomic, assign) MainType Type;
@property (nonatomic, copy) NSString *iCon;


@end
