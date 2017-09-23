//
//  UIColorDefine.h
//  Common
//
//  Created by chen on 2017/1/3.
//  Copyright © 2017年 chen. All rights reserved.
//

#ifndef UIColorDefine_h
#define UIColorDefine_h

//常用颜色的16进制
#pragma mark - Common Color
#define RedColor    0xFF0000
#define GreenColor  0x00FF00
#define BlueColor   0x0000FF
#define WhiteColor  0xFFFFFF
#define BlackColor  0x000000

/**
  使用16进制RGB值和透明度便捷创建一个UIColor

 @param rgbValue 16进制的rgb值 如0x000000  (黑色)
 @param alp 透明度 0.0f-1.0f
 @return 返回一个UIColor对象
 */
#define UIColorFromRGB(rgbValue, alp)	[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 \
                                                        green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0 \
                                                        blue:((float)(rgbValue & 0xFF)) / 255.0 \
                                                        alpha:alp]


#endif /* UIColorDefine_h */


