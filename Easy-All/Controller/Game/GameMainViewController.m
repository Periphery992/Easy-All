//
//  GameMainViewController.m
//  Easy-All
//
//  Created by chensa on 2017/10/24.
//  Copyright © 2017年 chensa. All rights reserved.
//

#import "GameMainViewController.h"
#import "ProgressBar.h"
#import "CountView.h"

@interface GameMainViewController ()
@property (nonatomic, strong) UIButton *btnMainMenu;
@property (nonatomic, strong) UIButton *btnSettingMenu;
@property (nonatomic, strong) ProgressBar *progressBar;
@property (nonatomic, strong) CountView *countView_Gold;
@property (nonatomic, strong) CountView *countView_Rystal;
@property (nonatomic, strong) CountView *countView_Essence;

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
    
    UILabel *lblName = [[UILabel alloc]initWithFrame:CGRectMake(imageLogo.rightX + 10, 10, 140, 20)];
    lblName.text = @"sssssssssssssss";
    lblName.font = [UIFont systemFontOfSize:16];
    [vwBg addSubview:lblName];
    
    UILabel *lblLevel = [[UILabel alloc]initWithFrame:CGRectMake(imageLogo.rightX + 10, lblName.bottomY+5, 60, 20)];
    lblLevel.text = @"hh.999";
    lblLevel.font = [UIFont systemFontOfSize:15];
    [vwBg addSubview:lblLevel];
    
    self.progressBar = [[ProgressBar alloc]initWithFrame:CGRectMake(lblLevel.rightX+10, lblLevel.centerY-2.5, SCREEN_WIDTH - lblLevel.rightX - 10 - 20, 5)];
    [vwBg addSubview:self.progressBar];
    
    CGFloat width = (SCREEN_WIDTH - lblName.originX-10)/3;
    
    self.countView_Gold = [[CountView alloc]initWithFrame:CGRectMake(lblName.originX, lblLevel.bottomY+5., width -10, 20) icon:nil backgroundImage:nil];
    [self.countView_Gold configCount:9012312222323];
    [vwBg addSubview:self.countView_Gold];
    
    self.countView_Rystal = [[CountView alloc]initWithFrame:CGRectMake(lblName.originX+width, lblLevel.bottomY+5., width -10, 20) icon:nil backgroundImage:nil];
    [self.countView_Rystal configCount:10123123];
    [vwBg addSubview:self.countView_Rystal];
    
    self.countView_Essence = [[CountView alloc]initWithFrame:CGRectMake(lblName.originX+width*2, lblLevel.bottomY+5., width -10, 20) icon:nil backgroundImage:nil];
    [self.countView_Essence configCount:75389];
    [vwBg addSubview:self.countView_Essence];
    
}

#pragma mark - Event
- (void)Touch_btnMainMenu:(id)sender
{
    [UIView animateWithDuration:0.3 animations:^{
        
        if (self.btnMainMenu.selected)
        {
            self.btnMainMenu.center = CGPointMake(0, SCREEN_HEIGHT);
            self.btnMainMenu.selected = NO;
        }
        else
        {
            self.btnMainMenu.center = CGPointMake(40, SCREEN_HEIGHT - 40);
            self.btnMainMenu.selected = YES;
            self.btnSettingMenu.selected = YES;
            [self Touch_btnSettingMenu:nil];
        }
    }];
}

- (void)Touch_btnSettingMenu:(id)sender
{
    [UIView animateWithDuration:0.3 animations:^{
        
        if (self.btnSettingMenu.selected)
        {
            self.btnSettingMenu.center = CGPointMake(SCREEN_WIDTH, SCREEN_HEIGHT);
            self.btnSettingMenu.selected = NO;
        }
        else
        {
            self.btnSettingMenu.center = CGPointMake(SCREEN_WIDTH-40, SCREEN_HEIGHT - 40);
            self.btnSettingMenu.selected = YES;
            self.btnMainMenu.selected = YES;
            [self Touch_btnMainMenu:nil];
        }
    }];
}

@end
