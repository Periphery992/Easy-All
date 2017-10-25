//
//  ProgressBar.h
//  Easy-All
//
//  Created by chen on 25/10/2017.
//  Copyright © 2017 chensa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProgressBar : UIView

- (void)configProgressWithfNow:(float)fNow fTotal:(float)fTotal animated:(BOOL)animated;

- (void)configProgressWithfNow:(float)fNow animated:(BOOL)animated;

- (void)configProgressWithfRate:(float)fRate animated:(BOOL)animated;

- (void)configBackgroundColor:(UIColor *)color;

- (void)configProgressColor:(UIColor *)color;

@end
