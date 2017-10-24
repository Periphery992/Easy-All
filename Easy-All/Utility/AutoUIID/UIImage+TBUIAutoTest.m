//
//  UIImage+TBUIAutoTest.m
//  Tribe
//
//  Created by 杨萧玉 on 16/3/4.
//  Copyright © 2016年 杨萧玉. All rights reserved.
//

#import "UIImage+TBUIAutoTest.h"
#import <objc/runtime.h>

@implementation UIImage (TBUIAutoTest)
+ (void)load
{

        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            Class aClass = object_getClass((id)self);
            
            SEL originalSelector = @selector(imageNamed:);
            SEL swizzledSelector = @selector(hc_imageNamed:);
            
            Method originalMethod = class_getClassMethod(aClass, originalSelector);
            Method swizzledMethod = class_getClassMethod(aClass, swizzledSelector);
            
            BOOL didAddMethod =
            class_addMethod(aClass,
                            originalSelector,
                            method_getImplementation(swizzledMethod),
                            method_getTypeEncoding(swizzledMethod));
            
            if (didAddMethod) {
                class_replaceMethod(aClass,
                                    swizzledSelector,
                                    method_getImplementation(originalMethod),
                                    method_getTypeEncoding(originalMethod));
            } else {
                method_exchangeImplementations(originalMethod, swizzledMethod);
            }
        });
    
}

#pragma mark - Method Swizzling

+ (UIImage *)hc_imageNamed:(NSString *)imageName{
    UIImage *image = [UIImage hc_imageNamed:imageName];
    image.accessibilityIdentifier = imageName;
    return image;
}
@end
