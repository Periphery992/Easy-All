//
//  UIView+AutoAccessID.m
//  Easy-All
//
//  Created by chen on 16/10/2017.
//  Copyright © 2017 chensa. All rights reserved.
//

#import "UIView+AutoAccessID.h"
#import "UIResponder+AutoAccessID.h"
#import <objc/runtime.h>

#define TAG_ID @"id_"

@implementation UIView (AutoAccessID)

+ (void)load
{
    [super load];
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self replaceSelector:@selector(addSubview:) withNewSelector:@selector(hc_addSubview:)];
    });
    
}

+ (void)replaceSelector:(SEL)originalSelector withNewSelector:(SEL)newSelector
{
    Method originalMethod = class_getInstanceMethod([self class], originalSelector);
    Method newMethod = class_getInstanceMethod([self class], newSelector);
    
    Class aClass = [self class];
    
    BOOL didAddMethod =
    class_addMethod(aClass,
                    originalSelector,
                    method_getImplementation(newMethod),
                    method_getTypeEncoding(newMethod));
    
    if (didAddMethod) {
        class_replaceMethod(aClass,
                            newSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, newMethod);
    }


}

- (void)hc_addSubview:(UIView *)view
{
    [self hc_addSubview:view];
    view.accessibilityIdentifier = [NSString stringWithFormat:@"%@%@",TAG_ID,[self findNameWithInstance:view]];
}



@end
