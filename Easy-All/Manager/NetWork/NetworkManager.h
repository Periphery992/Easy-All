//
//  NetworkManager.h
//  fairy-kingdom
//
//  Created by chensa on 2017/10/30.
//Copyright © 2017年 chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkManager : NSObject

+ (instancetype)sharedInstance;

#pragma mark - Login/Register
//- (void)requestCheckIDCardWithCardno:(NSString *)cardno
//                              result:(void (^)(NSMutableDictionary *mutdicResponse))result;
//
//- (void)requestLoginWithAccount:(NSString *)account
//                       password:(NSString *)password
//                         result:(void (^)(NSMutableDictionary *mutdicResponse))result;
//
//- (void)requestRegisterWithAccount:(NSString *)account
//                          password:(NSString *)password
//                            result:(void (^)(NSMutableDictionary *mutdicResponse))result;
//
//- (void)requestQuickRegisterWithResult:(void (^)(NSMutableDictionary *mutdicResponse))result;
@end
