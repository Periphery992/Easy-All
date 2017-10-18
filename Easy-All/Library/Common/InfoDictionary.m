//
//  InfoDictionary.m
//  Easy-All
//
//  Created by chensa on 2017/9/23.
//  Copyright © 2017年 chensa. All rights reserved.
//

#import "InfoDictionary.h"
#include <UIKit/UIDevice.h>
#import <sys/utsname.h>


static const BOOL isAutoPrint = YES; //获取时自动打印

@implementation InfoDictionary

#pragma mark - Common
+ (NSString *)returnAndPrint:(NSString *)string
{
    if (isAutoPrint) //需要自动打印
    {
        DDLogVerbose(@"%@",string);
    }
    return string;
}

#pragma mark - Device Info
//获取设备名称
+ (NSString *)getDeviceName
{
    return [InfoDictionary returnAndPrint:[UIDevice currentDevice].name];
}

//获取设备Model
+ (NSString *)getDeivceModel
{
    return [InfoDictionary returnAndPrint:[UIDevice currentDevice].model];
}

//获取本地化设备Model
+ (NSString *)getDeivceLocalizedModel
{
    return [InfoDictionary returnAndPrint:[UIDevice currentDevice].localizedModel];
}

//获取系统名称
+ (NSString *)getDeivceSystemName
{
    return [InfoDictionary returnAndPrint:[UIDevice currentDevice].systemName];
}

//获取系统版本
+ (NSString *)getDeivceSystemVersion
{
    return [InfoDictionary returnAndPrint:[UIDevice currentDevice].systemVersion];
}

//获取设备UUID
+ (NSString *)getDeivceUUID
{
    return [InfoDictionary returnAndPrint:[[[UIDevice currentDevice] identifierForVendor] UUIDString]];
}

//获取设备类型
+ (NSString *)getDeivceType
{
    struct utsname systemInfo;
    
    uname(&systemInfo);
    
    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSASCIIStringEncoding];
    
    if ([platform isEqualToString:@"iPhone1,1"]) return @"iPhone 2G";
    
    if ([platform isEqualToString:@"iPhone1,2"]) return @"iPhone 3G";
    
    if ([platform isEqualToString:@"iPhone2,1"]) return @"iPhone 3GS";
    
    if ([platform isEqualToString:@"iPhone3,1"]) return @"iPhone 4";
    
    if ([platform isEqualToString:@"iPhone3,2"]) return @"iPhone 4";
    
    if ([platform isEqualToString:@"iPhone3,3"]) return @"iPhone 4";
    
    if ([platform isEqualToString:@"iPhone4,1"]) return @"iPhone 4S";
    
    if ([platform isEqualToString:@"iPhone5,1"]) return @"iPhone 5";
    
    if ([platform isEqualToString:@"iPhone5,2"]) return @"iPhone 5";
    
    if ([platform isEqualToString:@"iPhone5,3"]) return @"iPhone 5c";
    
    if ([platform isEqualToString:@"iPhone5,4"]) return @"iPhone 5c";
    
    if ([platform isEqualToString:@"iPhone6,1"]) return @"iPhone 5s";
    
    if ([platform isEqualToString:@"iPhone6,2"]) return @"iPhone 5s";
    
    if ([platform isEqualToString:@"iPhone7,1"]) return @"iPhone 6 Plus";
    
    if ([platform isEqualToString:@"iPhone7,2"]) return @"iPhone 6";
    
    if ([platform isEqualToString:@"iPhone8,1"]) return @"iPhone 6s";
    
    if ([platform isEqualToString:@"iPhone8,2"]) return @"iPhone 6s Plus";
    
    if ([platform isEqualToString:@"iPhone8,4"]) return @"iPhone SE";
    
    if ([platform isEqualToString:@"iPhone9,1"]) return @"iPhone 7";
    
    if ([platform isEqualToString:@"iPhone9,2"]) return @"iPhone 7 Plus";
    
    if ([platform isEqualToString:@"iPod1,1"])   return @"iPod Touch 1G";
    
    if ([platform isEqualToString:@"iPod2,1"])   return @"iPod Touch 2G";
    
    if ([platform isEqualToString:@"iPod3,1"])   return @"iPod Touch 3G";
    
    if ([platform isEqualToString:@"iPod4,1"])   return @"iPod Touch 4G";
    
    if ([platform isEqualToString:@"iPod5,1"])   return @"iPod Touch 5G";
    
    if ([platform isEqualToString:@"iPad1,1"])   return @"iPad 1G";
    
    if ([platform isEqualToString:@"iPad2,1"])   return @"iPad 2";
    
    if ([platform isEqualToString:@"iPad2,2"])   return @"iPad 2";
    
    if ([platform isEqualToString:@"iPad2,3"])   return @"iPad 2";
    
    if ([platform isEqualToString:@"iPad2,4"])   return @"iPad 2";
    
    if ([platform isEqualToString:@"iPad2,5"])   return @"iPad Mini 1G";
    
    if ([platform isEqualToString:@"iPad2,6"])   return @"iPad Mini 1G";
    
    if ([platform isEqualToString:@"iPad2,7"])   return @"iPad Mini 1G";
    
    if ([platform isEqualToString:@"iPad3,1"])   return @"iPad 3";
    
    if ([platform isEqualToString:@"iPad3,2"])   return @"iPad 3";
    
    if ([platform isEqualToString:@"iPad3,3"])   return @"iPad 3";
    
    if ([platform isEqualToString:@"iPad3,4"])   return @"iPad 4";
    
    if ([platform isEqualToString:@"iPad3,5"])   return @"iPad 4";
    
    if ([platform isEqualToString:@"iPad3,6"])   return @"iPad 4";
    
    if ([platform isEqualToString:@"iPad4,1"])   return @"iPad Air";
    
    if ([platform isEqualToString:@"iPad4,2"])   return @"iPad Air";
    
    if ([platform isEqualToString:@"iPad4,3"])   return @"iPad Air";
    
    if ([platform isEqualToString:@"iPad4,4"])   return @"iPad Mini 2G";
    
    if ([platform isEqualToString:@"iPad4,5"])   return @"iPad Mini 2G";
    
    if ([platform isEqualToString:@"iPad4,6"])   return @"iPad Mini 2G";
    
    if ([platform isEqualToString:@"i386"])      return @"iPhone Simulator";
    
    if ([platform isEqualToString:@"x86_64"])    return @"iPhone Simulator";
    
    return platform;
    
}


#pragma mark - Application Info
//获取应用名称
+ (NSString *)getAppName
{
    return [InfoDictionary returnAndPrint:[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"]];
}

//获取应用版本
+ (NSString *)getAppVersion
{
    return [InfoDictionary returnAndPrint:[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]];
}

//获取应用BundleID
+ (NSString *)getAppBundleVersion
{
    return [InfoDictionary returnAndPrint:[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]];
}

#pragma mark - Date
//最多用到2038/1/19 11:14:7
+ (NSInteger)getNowTimestamp
{
    NSTimeInterval a = [[NSDate date] timeIntervalSince1970];
    NSString *timeString = [NSString stringWithFormat:@"%0.0f", a];
    
    return [timeString integerValue];
}


@end
