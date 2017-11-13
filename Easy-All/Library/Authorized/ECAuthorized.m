//
//  ECAuthorized.m
//  EasyAccount
//
//  Created by chen on 2017/3/29.
//  Copyright © 2017年 chensa. All rights reserved.
//

#import "ECAuthorized.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <Photos/Photos.h>
#import <AVFoundation/AVCaptureDevice.h>
#import "InfoDictionary.h"



@interface ECAuthorized()<UIAlertViewDelegate>

@end

typedef void (^AuthorizedResult)(BOOL success);

@implementation ECAuthorized

+ (instancetype)sharedInstance
{
    static id _sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[[self class] alloc] init];
    });
    return _sharedInstance;
}

- (void)getAuthorizedWithType:(ECAuthorizedType)type result:(void(^)(BOOL success))result
{
    if (type == ECAuthorizedTypePhotos)
    {
        ECAuthorizedStatus status = [self checkAuthorizedPhotos];
        
        if (status == ECAuthorizedStatusNotDetermined)
        {
            [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
                if (status == PHAuthorizationStatusAuthorized)
                {
                    result(YES);
                }
            }];
        }
        else if (status == ECAuthorizedStatusRestricted)
        {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"很抱歉，您没有该权限，我们无法为您提供该项服务！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
            [alert show];
        }
        else if (status == ECAuthorizedStatusDenied)
        {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"您关闭了相册权限，是否前往设置开通该权限" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"设置",nil];
            alert.tag = 10000;
            [alert show];
        }
        else if (status == ECAuthorizedStatusAuthorized)
        {
            result(YES);
        }
    }
    else if (type == ECAuthorizedTypeCamera)
    {
//        ECAuthorizedStatus status = [self checkAuthorizedCarema];
    }
}

+ (ECAuthorizedStatus)checkAuthorizedWithType:(ECAuthorizedType)type
{
    ECAuthorized *authorized = [[ECAuthorized alloc]init];
    
    if (type == ECAuthorizedTypePhotos)
    {
        return [authorized checkAuthorizedPhotos];
    }
    else if (type == ECAuthorizedTypeCamera)
    {
        return [authorized checkAuthorizedCarema];
    }
    
    return ECAuthorizedStatusNoType;
}

- (ECAuthorizedStatus)checkAuthorizedPhotos
{
    if (IS_IOS10_OR_LATER) //iOS 10需要判断是否在Info.plist中添加权限
    {
        NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"Info" ofType:@"plist"];
        NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
        
        if(![data objectForKey:@"NSPhotoLibraryUsageDescription"])
        {
            DDLogVerbose(@"请前往Info.plist中添加照片授权");
            return ECAuthorizedStatusNoInfo;
        }
    }
    
    if (IS_IOS8_OR_LATER) //如果是iOS 8以后系统
    {
        PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
        
        if (status == PHAuthorizationStatusNotDetermined)
        {
            DDLogVerbose(@"还没进行过授权请求");
            return ECAuthorizedStatusNotDetermined;
        }
        else if (status == PHAuthorizationStatusRestricted)
        {
            DDLogVerbose(@"用户没有该能力");
            return ECAuthorizedStatusRestricted;
        }
        else if (status == PHAuthorizationStatusDenied)
        {
            DDLogVerbose(@"用户已禁用授权");
            return ECAuthorizedStatusDenied;
        }
        else
        {
            DDLogVerbose(@"用户已授权");
            return ECAuthorizedStatusAuthorized;
        }
    }
    else
    {
        ALAuthorizationStatus status = [ALAssetsLibrary authorizationStatus];
        
        if (status == ALAuthorizationStatusNotDetermined)
        {
            DDLogVerbose(@"还没进行过授权请求");
            return ECAuthorizedStatusNotDetermined;
        }
        else if (status == ALAuthorizationStatusRestricted)
        {
            DDLogVerbose(@"用户没有该能力");
            return ECAuthorizedStatusRestricted;
        }
        else if (status == ALAuthorizationStatusDenied)
        {
            DDLogVerbose(@"用户已禁用授权");
            return ECAuthorizedStatusDenied;
        }
        else
        {
            DDLogVerbose(@"用户已授权");
            return ECAuthorizedStatusAuthorized;
        }
    }
}

- (ECAuthorizedStatus)checkAuthorizedCarema
{
    if (IS_IOS10_OR_LATER) //iOS 10需要判断是否在Info.plist中添加权限
    {
        NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"Info" ofType:@"plist"];
        NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
        
        if(![data objectForKey:@"NSCameraUsageDescription"])
        {
            DDLogVerbose(@"请前往Info.plist中添加相机授权");
            return ECAuthorizedStatusNoInfo;
        }
    }
    
    AVAuthorizationStatus status =  [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    
    if (status == AVAuthorizationStatusNotDetermined)
    {
        DDLogVerbose(@"还没进行过授权请求");
        return ECAuthorizedStatusNotDetermined;
    }
    else if (status == AVAuthorizationStatusRestricted)
    {
        DDLogVerbose(@"用户没有该能力");
        return ECAuthorizedStatusRestricted;
    }
    else if (status == AVAuthorizationStatusDenied)
    {
        DDLogVerbose(@"用户已禁用授权");
        return ECAuthorizedStatusDenied;
    }
    else
    {
        DDLogVerbose(@"用户已授权");
        return ECAuthorizedStatusAuthorized;
    }
}

#pragma mark - AlertViewDelegate 
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag == 10000)
    {
        if (buttonIndex == 1)
        {
            [InfoDictionary gotoApplicationSetting];
        }
    }
}

@end
