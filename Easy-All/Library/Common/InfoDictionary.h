//
//  InfoDictionary.h
//  Easy-All
//
//  Created by chensa on 2017/9/23.
//  Copyright © 2017年 chensa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InfoDictionary : NSObject


#pragma mark - DeviceInfo
/**
 获取设备名称

 @return 设备名称
 */
+ (NSString *)getDeviceName;

/**
 获取设备Model
 
 @return 设备Model
 */
+ (NSString *)getDeivceModel;

/**
 获取设备名称
 
 @return 设备名称
 */
+ (NSString *)getDeivceLocalizedModel;

/**
 获取系统名称
 
 @return 系统名称
 */
+ (NSString *)getDeivceSystemName;

/**
 获取系统版本
 
 @return 系统版本
 */
+ (NSString *)getDeivceSystemVersion;

/**
 获取系统UUID
 
 @return 系统UUID
 */
+ (NSString *)getDeivceUUID;

/**
 获取设备类型
 
 @return 设备类型
 */
+ (NSString *)getDeivceType;

#pragma mark - Application Info
/**
 获取应用名称
 
 @return 应用名称
 */
+ (NSString *)getAppName;

/**
 获取应用版本
 
 @return 应用版本
 */
+ (NSString *)getAppVersion;

/**
 获取应用BundleID
 
 @return 应用BundleID
 */
+ (NSString *)getAppBundleVersion;

    
#pragma mark - Date

/**
 获取NSInteger类型当前时间戳
 由于NSInteger类型，在32位设备上最多用到2038/1/19 11:14:7
 @return NSInteger类型当前时间戳
 */
+ (NSInteger)getNowTimestamp;

#pragma mark - getScreenImage

/**
 获取屏幕截图

 @param save 是否保存到相册
 @return 屏幕截图
 */
+ (UIImage *)getScreenshotImageWithSave:(BOOL)save;

#pragma mark - Other

/**
 前往应用设置页面
 */
+ (void)gotoApplicationSetting;
@end
