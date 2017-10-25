//
//  GameMainViewController.m
//  Easy-All
//
//  Created by chensa on 2017/10/24.
//  Copyright © 2017年 chensa. All rights reserved.
//

#import "GameMainViewController.h"
#import "ProgressBar.h"


@interface GameMainViewController ()
@property (nonatomic, strong) UIButton *btnMainMenu;
@property (nonatomic, strong) UIButton *btnSettingMenu;
@property (nonatomic, strong) ProgressBar *progressBar;


@end

@implementation GameMainViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.hidden = YES;
    
    [self initView];
}

#pragma mark - UI
- (void)initView
{
    self.btnMainMenu = [[UIButton alloc]initWithFrame:CGRectMake(-40, SCREEN_HEIGHT - 40, 80, 80)];
    [self.btnMainMenu addTarget:self action:@selector(Touch_btnMainMenu:) forControlEvents:UIControlEventTouchUpInside];
    self.btnMainMenu.layer.cornerRadius = 40;
    self.btnMainMenu.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.btnMainMenu];
    
    self.btnSettingMenu = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-40, SCREEN_HEIGHT - 40, 80, 80)];
    [self.btnSettingMenu addTarget:self action:@selector(Touch_btnSettingMenu:) forControlEvents:UIControlEventTouchUpInside];
    self.btnSettingMenu.layer.cornerRadius = 40;
    self.btnSettingMenu.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.btnSettingMenu];
    
    [self initTopInfoView];
}

- (void)initTopInfoView
{
    UIView *vwBg = [[UIView alloc]initWithFrame:CGRectMake(0, STATE_HEIGHT, SCREEN_WIDTH, 88)];
    vwBg.backgroundColor = [UIColor grayColor];
    [self.view addSubview:vwBg];
    
    UIImageView *imageLogo = [[UIImageView alloc]initWithFrame:CGRectMake(10, 14, 60, 60)];
    imageLogo.layer.cornerRadius = 30;
    imageLogo.backgroundColor = [UIColor greenColor];
    [vwBg addSubview:imageLogo];
    
    UILabel *lblName = [[UILabel alloc]initWithFrame:CGRectMake(imageLogo.rightX + 10, 10, 120, 20)];
    lblName.text = @"sssssssssssssss";
    lblName.font = [UIFont systemFontOfSize:15];
    [vwBg addSubview:lblName];
    
    UILabel *lbLevel = [[UILabel alloc]initWithFrame:CGRectMake(imageLogo.rightX + 10, lblName.bottomY+10, 60, 20)];
    lbLevel.text = @"hh.999";
    lbLevel.font = [UIFont systemFontOfSize:15];
    [vwBg addSubview:lbLevel];
    
    self.progressBar = [[ProgressBar alloc]initWithFrame:CGRectMake(lbLevel.rightX+10, lbLevel.centerY-2.5, SCREEN_WIDTH - lbLevel.rightX - 10 - 20, 5)];
    [vwBg addSubview:self.progressBar];
    
    
    
}

#pragma mark - Event
- (void)Touch_btnMainMenu:(id)sender
{
    [UIView animateWithDuration:0.3 animations:^{
        
        self.btnMainMenu.center = self.btnMainMenu.centerX == 0?CGPointMake(40, SCREEN_HEIGHT - 40):CGPointMake(0, SCREEN_HEIGHT);
    }];
}

- (void)Touch_btnSettingMenu:(id)sender
{
    [UIView animateWithDuration:0.3 animations:^{
        
        self.btnSettingMenu.center = self.btnSettingMenu.centerX == SCREEN_WIDTH?CGPointMake(SCREEN_WIDTH-40, SCREEN_HEIGHT - 40):CGPointMake(SCREEN_WIDTH, SCREEN_HEIGHT);
    }];
}

@end
