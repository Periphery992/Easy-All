//
//  HLFProgressHUD.h
//  fairy-kingdom
//
//  Created by chen on 31/10/2017.
//  Copyright © 2017 chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"

typedef enum : NSUInteger {
    HLFProgressHUDImageTypeError,
    HLFProgressHUDImageTypeSuccess,
    
} HLFProgressHUDImageType;


@interface HLFProgressHUD : NSObject
+ (instancetype)sharedInstance;

- (void)removeHUD;

- (void)showHUDWithTitle:(NSString *)title;

- (void)showHUDWithTitle:(NSString *)title toView:(UIView *)superview;

- (void)showSuccessWithTitle:(NSString *)title;

- (void)showErrorWithTitle:(NSString *)title;

- (void)showAutoHiddenStateWithTitle:(NSString *)title imageType:(HLFProgressHUDImageType)imagetype;

@end
