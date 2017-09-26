//
//  ApplicationInit.m
//  Easy-All
//
//  Created by chensa on 2017/9/24.
//  Copyright © 2017年 chensa. All rights reserved.
//

#import "ApplicationInit.h"
#import "HLFDDLogFormatter.h"

//#define DDLoggFilePath         [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0]    //缓存文件路径文件夹 /Library/Caches/DDLogger
//#define DDLoggerFileName         nil                //缓存文件名，nil则使用日期作为文件名.log做后缀
//#define DDLoggerMaxCachesCounts  30                 //缓存内允许存在输出条数  30
//#define DDLoggerMaxCachesSize    256                //缓存内允许存在输出大小  258 KB
//#define DDLoggerMaxFileSize      1024 * 1024 * 50   //本地文件最大大小       50  MB
//#define DDLoggerMaxFileAge       60 * 60 * 24 * 7   //本地文件最长保存期限    7   天
//#define DDLoggeIsCatchException  YES                //是否捕捉奔溃日志       是

@interface ApplicationInit()


@end

@implementation ApplicationInit
//static NSUInteger maximumNumberOfLogFiles = 10;
//static unsigned long long logFilesDiskQuota = 100;


+ (instancetype)sharedInstance{
    
    static id _sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[NSClassFromString(@"ApplicationInit") alloc] init];
    });
    return _sharedInstance;
}

- (instancetype)init
{
    if (self = [super init])
    {
        [self configDDLog];
    }
    return self;
}


//配置DDLog
- (void)configDDLog
{
    DDFileLogger *fileLogger = [[DDFileLogger alloc]init];  //文件输出日志
    DDTTYLogger *ttyLogger = [DDTTYLogger sharedInstance];  //控制台输出日志
    
    HLFDDLogFormatter *logFormatter = [[HLFDDLogFormatter alloc]init];  //日志格式
    fileLogger.logFormatter = logFormatter;
    ttyLogger.logFormatter = logFormatter;
    
    [DDLog addLogger:fileLogger];
    [DDLog addLogger:ttyLogger];
}
@end
