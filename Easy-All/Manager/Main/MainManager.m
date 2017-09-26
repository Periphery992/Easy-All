//
//  MainManager.m
//  Easy-All
//
//  Created by chen on 26/09/2017.
//  Copyright © 2017 chensa. All rights reserved.
//

#define CLASSNAME @"MainManager"

#import "MainManager.h"

@interface MainManager()

@end

@implementation MainManager

+ (instancetype)sharedInstance{
    
    static id _sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[NSClassFromString(CLASSNAME) alloc] init];
    });
    return _sharedInstance;
}


@end
