//
//  UIView+AutoAccessID.m
//  Easy-All
//
//  Created by chen on 16/10/2017.
//  Copyright © 2017 chensa. All rights reserved.
//

#import "UIView+AutoAccessID.h"
#import <objc/runtime.h>

@implementation UIView (AutoAccessID)

+ (void)load
{
    [super load];
    
}

+ (void)replaceSelector:(SEL)originalSelector withNewSelector:(SEL)newSelector
{
    Method originalMethod = class_getInstanceMethod([self class], originalSelector);
    Method newMethod = class_getInstanceMethod([self class], newSelector);
    


}



//+ (void)load {
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        [self swizzleSelector:@selector(accessibilityIdentifier) withAnotherSelector:@selector(tb_accessibilityIdentifier)];
//        [self swizzleSelector:@selector(accessibilityLabel) withAnotherSelector:@selector(tb_accessibilityLabel)];
//    });
//}

//+ (void)swizzleSelector:(SEL)originalSelector withAnotherSelector:(SEL)swizzledSelector
//{
//    Class aClass = [self class];
//    
//    Method originalMethod = class_getInstanceMethod(aClass, originalSelector);
//    Method swizzledMethod = class_getInstanceMethod(aClass, swizzledSelector);
//
//    BOOL didAddMethod =
//    class_addMethod(aClass,
//                    originalSelector,
//                    method_getImplementation(swizzledMethod),
//                    method_getTypeEncoding(swizzledMethod));
//    
//    if (didAddMethod) {
//        class_replaceMethod(aClass,
//                            swizzledSelector,
//                            method_getImplementation(originalMethod),
//                            method_getTypeEncoding(originalMethod));
//    } else {
//        method_exchangeImplementations(originalMethod, swizzledMethod);
//    }
//}


- (void)setAccessibilityIdentifier:(NSString *)accessibilityIdentifier
{
    
}

- (void)addSubview:(UIView *)view
{
    
}

@end
