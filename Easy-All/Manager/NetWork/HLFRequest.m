//
//  HLFRequest.m
//  fairy-kingdom
//
//  Created by chensa on 2017/10/30.
//Copyright © 2017年 chen. All rights reserved.
//

#import "HLFRequest.h"
#import "AFNetworking.h"
#import <objc/runtime.h>
#import "ResultBean.h"

#define Log_ResponseObject YES
#define Log_mutdicResponse YES

@implementation HLFRequest

- (void)requestResult:(void (^)(NSMutableDictionary *mutdicResponse))result
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];//请求
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json", @"text/json", @"text/javascript",nil];

    if ([self.method isEqualToString:HTTP_METHOD_GET])
    {
        [manager GET:self.Url
          parameters:[self getParameters]
            progress:nil
             success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                 
                 if (Log_ResponseObject)
                 {
                     DDLogVerbose(@"%@ responseObject:%@",NSStringFromClass([self class]),responseObject);
                 }
                 
                 NSMutableDictionary *mutdic = [self configDataWithResponseObject:responseObject];
                 
                 if (Log_mutdicResponse)
                 {
                     DDLogVerbose(@"%@ mutdicResponse:%@",NSStringFromClass([self class]),mutdic);
                 }
                 
                 result(mutdic);
             }
             failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                 
                 DDLogVerbose(@"%@:网络请求失败",NSStringFromClass([self class]));
                 
                 NSMutableDictionary *mutdic = [NSMutableDictionary dictionary];
                 
                 ResultBean *bean = [[ResultBean alloc]init];
                 bean.code = 100001;
                 
                 [mutdic setObject:bean forKey:@"result"];
                 
                 result(mutdic);
             }];
        
    }
    else if ([self.method isEqualToString:HTTP_METHOD_POST])
    {
        [manager POST:self.Url
           parameters:[self getParameters]
             progress:nil
              success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                  
                  if (Log_ResponseObject)
                  {
                      DDLogVerbose(@"%@ responseObject:%@",NSStringFromClass([self class]),responseObject);
                  }
                  
                  NSMutableDictionary *mutdic = [self configDataWithResponseObject:responseObject];
                  
                  if (Log_mutdicResponse)
                  {
                      DDLogVerbose(@"%@ mutdicResponse:%@",NSStringFromClass([self class]),mutdic);
                  }
                  
                  result(mutdic);
              }
              failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                  
                  DDLogVerbose(@"%@:网络请求失败",NSStringFromClass([self class]));
                  NSMutableDictionary *mutdic = [NSMutableDictionary dictionary];
                  
                  ResultBean *bean = [[ResultBean alloc]init];
                  bean.code = 100001;
                  
                  [mutdic setObject:bean forKey:@"result"];
                  result(mutdic);
              }];
    }
}

- (NSMutableDictionary *)getParameters
{
    NSMutableDictionary *mutarr = [[NSMutableDictionary alloc]init];
    
    unsigned int nCount = 0;
    objc_property_t *popertylist = class_copyPropertyList([self class],&nCount);
    for (int i = 0; i < nCount; i++)
    {
        objc_property_t property = popertylist[i];
        
        id key = [NSString stringWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
        id value = [self valueForKey:key];
        
        if ([key isEqualToString:@"Url"]||[key isEqualToString:@"method"]||[key isEqualToString:@"mutdicReponse"])
        {
            continue;
        }
        
        if (value)
        {
            [mutarr setObject:value forKey:key];
        }
        else
        {
            [mutarr setObject:@"" forKey:key];
        }
    }
    return mutarr;
}

- (void)configResultWithResponseObject:(id)responsObject
{
    self.mutdicReponse = [NSMutableDictionary dictionary];
    
    ResultBean *bean = [[ResultBean alloc]init];
    
    [bean setValuesForKeysWithDictionary:responsObject];
    
    [self.mutdicReponse setObject:bean forKey:@"result"];
    
}

- (NSMutableDictionary *)configDataWithResponseObject:(id)responsObject
{
    return self.mutdicReponse;
}

@end
