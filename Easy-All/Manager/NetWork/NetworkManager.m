//
//  NetworkManager.m
//  fairy-kingdom
//
//  Created by chensa on 2017/10/30.
//Copyright © 2017年 chen. All rights reserved.
//

#import "NetworkManager.h"
#import "requestList.h"


@interface NetworkManager ()

@end

@implementation NetworkManager

+ (instancetype)sharedInstance{
    
    static id _sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[[self class] alloc] init];
    });
    return _sharedInstance;
    
}

//#pragma mark - Login/Register
//- (void)requestLoginWithAccount:(NSString *)account
//                       password:(NSString *)password
//                         result:(void (^)(NSMutableDictionary *mutdicResponse))result
//{
//    LoginRequest *request = [[LoginRequest alloc]init];
//    request.account = account;
//    request.password = password;
//    
//    [request requestResult:result];
//}
//
//- (void)requestRegisterWithAccount:(NSString *)account
//                          password:(NSString *)password
//                            result:(void (^)(NSMutableDictionary *mutdicResponse))result
//{
//    RegisterRequest *request = [[RegisterRequest alloc]init];
//    request.account = account;
//    request.password = password;
//    
//    [request requestResult:result];
//}
//
//- (void)requestQuickRegisterWithResult:(void (^)(NSMutableDictionary *mutdicResponse))result
//{
//    QuickRegisterRequest *request = [[QuickRegisterRequest alloc]init];
//    
//    [request requestResult:result];
//}
//
//#pragma mark - Other
//- (void)requestCheckIDCardWithCardno:(NSString *)cardno
//                              result:(void (^)(NSMutableDictionary *mutdicResponse))result
//{
//    CheckIDCardRequest *request = [[CheckIDCardRequest alloc]init];
//    request.cardno = cardno;
//    
//    [request requestResult:result];
//}

@end
