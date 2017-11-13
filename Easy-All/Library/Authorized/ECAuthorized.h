//
//  ECAuthorized.h
//  EasyAccount
//
//  Created by chen on 2017/3/29.
//  Copyright © 2017年 chensa. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, ECAuthorizedType) {
    ECAuthorizedTypePhotos,         //检查相册权限
    ECAuthorizedTypeCamera,         //检查相机权限
    ECAuthorizedTypeNotification,   //检查通知权限
};

typedef NS_ENUM(NSUInteger, ECAuthorizedStatus) {
    ECAuthorizedStatusNotDetermined,  //还没进行过授权请求
    ECAuthorizedStatusRestricted,     //用户没有该能力
    ECAuthorizedStatusDenied,         //用户禁止使用
    ECAuthorizedStatusAuthorized,     //用户已授权
    ECAuthorizedStatusNoInfo,         //开发者没有在Info.plist里添加权限
    ECAuthorizedStatusNoType,         //没有这种类型的权限可以请求
};



@interface ECAuthorized : NSObject
+ (instancetype)sharedInstance;
/**
 检查权限

 @param type 权限类型
 @return 权限状态
 */
+ (ECAuthorizedStatus)checkAuthorizedWithType:(ECAuthorizedType)type;

- (void)getAuthorizedWithType:(ECAuthorizedType)type result:(void(^)(BOOL success))result;

@end
