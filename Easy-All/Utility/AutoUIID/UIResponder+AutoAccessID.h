//
//  UIResponder+AutoAccessID.h
//  Easy-All
//
//  Created by chen on 19/10/2017.
//  Copyright © 2017 chensa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIResponder (UIAutoTest)

- (NSString *)findNameWithInstance:(UIView *) instance;

- (UITableView *)findTableView;

@end
