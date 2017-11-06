//
//  HLFProgressHUD.m
//  fairy-kingdom
//
//  Created by chen on 31/10/2017.
//  Copyright © 2017 chen. All rights reserved.
//

#import "HLFProgressHUD.h"

#define TAG_AutoHiddenTime  1.0

@interface HLFProgressHUD()
@property (nonatomic, strong) MBProgressHUD *hud;

@end

@implementation HLFProgressHUD

+ (instancetype)sharedInstance{
    
    static id _sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[[self class] alloc] init];
    });
    return _sharedInstance;
}

//异常加载状态
- (void)removeHUD
{
    if (self.hud)
    {
        [self.hud hideAnimated:YES];
    }
}

//显示加载状态和文字
- (void)showHUDWithTitle:(NSString *)title
{
    [self removeHUD];
    self.hud = [MBProgressHUD showHUDAddedTo:[[UIApplication sharedApplication]keyWindow] animated:YES];
    self.hud.label.text = title;
    self.hud.backgroundView.color = UIColorFromRGB(0x000000, 0.5f);

}

//在指定视图上显示加载状态和文字
- (void)showHUDWithTitle:(NSString *)title toView:(UIView *)superview
{
    [self removeHUD];
    self.hud = [MBProgressHUD showHUDAddedTo:superview animated:YES];
    self.hud.label.text = title;
    self.hud.backgroundView.color = UIColorFromRGB(0x000000, 0.5f);

}

//显示自动消失的成功状态和文字
- (void)showSuccessWithTitle:(NSString *)title
{
    [self showAutoHiddenStateWithTitle:title imageType:HLFProgressHUDImageTypeSuccess];
}

//显示自动消失的失败状态和文字
- (void)showErrorWithTitle:(NSString *)title
{
    [self showAutoHiddenStateWithTitle:title imageType:HLFProgressHUDImageTypeError];
}

//显示自动隐藏的文字和状态图片
- (void)showAutoHiddenStateWithTitle:(NSString *)title imageType:(HLFProgressHUDImageType)imagetype
{
    [self removeHUD];
   
    self.hud = [MBProgressHUD showHUDAddedTo:[[UIApplication sharedApplication]keyWindow] animated:YES];
    self.hud.mode = MBProgressHUDModeCustomView;
    self.hud.label.text = title;
    self.hud.backgroundView.color = UIColorFromRGB(0x000000, 0.5f);
    
    UIImageView *imgvw = nil;
    if (imagetype == HLFProgressHUDImageTypeError)
    {
         imgvw = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Progress_error"]];
    }
    else if (imagetype == HLFProgressHUDImageTypeSuccess)
    {
        imgvw = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Progress_success"]];

    }
    self.hud.customView = imgvw;
    [self.hud hideAnimated:YES afterDelay:TAG_AutoHiddenTime];
}



@end
