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


@interface MainBean : NSObject

@property (nonatomic, copy) NSString *strName;
@property (nonatomic, copy) NSString *strController;
@property (nonatomic, assign) MainType mainType;



@end
