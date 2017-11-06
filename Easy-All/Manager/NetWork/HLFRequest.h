//
//  HLFRequest.h
//  fairy-kingdom
//
//  Created by chensa on 2017/10/30.
//Copyright © 2017年 chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ApiUrl.h"

#define HTTP_METHOD_POST @"POST"
#define HTTP_METHOD_GET @"GET"

@interface HLFRequest : NSObject
@property (nonatomic, strong) NSString *Url;
@property (nonatomic, copy) NSString *method;
@property (nonatomic, strong) NSMutableDictionary *mutdicReponse;


- (void)requestResult:(void (^)(NSMutableDictionary *mutdicResponse))result;

- (void)configResultWithResponseObject:(id)responsObject;

- (NSMutableDictionary *)configDataWithResponseObject:(id)responsObject;

@end


