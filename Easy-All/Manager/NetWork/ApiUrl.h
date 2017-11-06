
//
//  ApiUrl.h
//  fairy-kingdom
//
//  Created by chen on 31/10/2017.
//  Copyright © 2017 chen. All rights reserved.
//

#ifndef ApiUrl_h
#define ApiUrl_h

#define HTTP_URL @"http://39.108.216.0:8845/fairy"

#pragma mark - Api_URL
#define Api_URL_CheckIDCard @"http://apis.juhe.cn/idcard/index"

#define Api_URL_Login  [NSString stringWithFormat:@"%@%@",HTTP_URL,@"/user/login"];
#define Api_URL_Register  [NSString stringWithFormat:@"%@%@",HTTP_URL,@"/user/register"];
#define Api_URL_QuickRegister  [NSString stringWithFormat:@"%@%@",HTTP_URL,@"/user/quickRegister"];

#endif /* ApiUrl_h */
