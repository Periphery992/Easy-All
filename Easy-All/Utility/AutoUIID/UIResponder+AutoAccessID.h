//
//  UIResponder+AutoAccessID.h
//  Easy-All
//
//  Created by chen on 19/10/2017.
//  Copyright © 2017 chensa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIResponder (AutoAccessID)

- (NSString *)findNameWithInstance:(UIView *) instance;

@end
