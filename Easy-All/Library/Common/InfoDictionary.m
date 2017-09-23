//
//  InfoDictionary.m
//  Easy-All
//
//  Created by chensa on 2017/9/23.
//  Copyright © 2017年 chensa. All rights reserved.
//

#import "InfoDictionary.h"
#include <UIKit/UIDevice.h>

@implementation InfoDictionary

#pragma mark - DeviceInfo
- (NSString *)getDeviceName
{
   return [UIDevice currentDevice].name;
}

- (NSString *)getDeivceModel
{
    return [UIDevice currentDevice].model;
}

- (NSString *)getDeivceLocalizedModel
{
    return [UIDevice currentDevice].localizedModel;
}

- (NSString *)getDeivceSystemName
{
    return [UIDevice currentDevice].systemName;
}
- (NSString *)getDeivceSystemVersion
{
    return [UIDevice currentDevice].systemVersion;
}



@end
