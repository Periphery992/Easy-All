//
//  ApplicationInit.m
//  Easy-All
//
//  Created by chensa on 2017/9/24.
//  Copyright © 2017年 chensa. All rights reserved.
//

#import "ApplicationInit.h"

#define DDLoggFilePath         [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0]    //缓存文件路径文件夹 /Library/Caches/DDLogger
#define DDLoggerFileName         nil                //缓存文件名，nil则使用日期作为文件名.log做后缀
#define DDLoggerMaxCachesCounts  30                 //缓存内允许存在输出条数  30
#define DDLoggerMaxCachesSize    256                //缓存内允许存在输出大小  258 KB
#define DDLoggerMaxFileSize      1024 * 1024 * 50   //本地文件最大大小       50  MB
#define DDLoggerMaxFileAge       60 * 60 * 24 * 7   //本地文件最长保存期限    7   天
#define DDLoggeIsCatchException  YES                //是否捕捉奔溃日志       是

@interface ApplicationInit()<DDLogFileManager>


@end

@implementation ApplicationInit
static NSUInteger maximumNumberOfLogFiles = 10;
static unsigned long long logFilesDiskQuota = 100;


+ (ApplicationInit *)sharedInstance{
    static ApplicationInit *_sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[ApplicationInit alloc] init];
    });
    return _sharedInstance;
}

- (instancetype)init
{
    if (self = [super init])
    {
        
    }
    return self;
}

- (void)configDDLogger
{
    
 
    [DDLog addLogger:[[DDFileLogger alloc]init]];
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
}
@end
