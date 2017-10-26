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
#import "TaskView.h"

@interface GameMainViewController ()
@property (nonatomic, strong) UIButton *btnMainMenu;
@property (nonatomic, strong) UIButton *btnSettingMenu;
@property (nonatomic, strong) UIButton *btnGetTask;
@property (nonatomic, strong) ProgressBar *progressBar;
@property (nonatomic, strong) CountView *countView_Gold;
@property (nonatomic, strong) CountView *countView_Rystal;
@property (nonatomic, strong) CountView *countView_Essence;
@property (nonatomic, strong) TaskView *taskView_First;
@property (nonatomic, strong) TaskView *taskView_Second;
@property (nonatomic, strong) TaskView *taskView_Third;


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
    //主界面按钮
    self.btnMainMenu = [[UIButton alloc]initWithFrame:CGRectMake(-40, SCREEN_HEIGHT - 40, 80, 80)];
    [self.btnMainMenu addTarget:self action:@selector(Touch_btnMainMenu:) forControlEvents:UIControlEventTouchUpInside];
    self.btnMainMenu.layer.cornerRadius = 40;
    self.btnMainMenu.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.btnMainMenu];
    
    //搜寻任务按钮
    self.btnGetTask = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 80, 80)];
    [self.btnGetTask addTarget:self action:@selector(Touch_btnGetTask:) forControlEvents:UIControlEventTouchUpInside];
    self.btnGetTask.center = CGPointMake(self.view.centerX, SCREEN_HEIGHT - 40);
    self.btnGetTask.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.btnGetTask];
    
    //设置界面按钮
    self.btnSettingMenu = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-40, SCREEN_HEIGHT - 40, 80, 80)];
    [self.btnSettingMenu addTarget:self action:@selector(Touch_btnSettingMenu:) forControlEvents:UIControlEventTouchUpInside];
    self.btnSettingMenu.layer.cornerRadius = 40;
    self.btnSettingMenu.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.btnSettingMenu];
    
    [self initTopInfoView];
}

- (void)initTopInfoView
{
    //顶部信息栏底部
    UIView *vwBg = [[UIView alloc]initWithFrame:CGRectMake(0, STATE_HEIGHT, SCREEN_WIDTH, 88)];
    vwBg.backgroundColor = [UIColor grayColor];
    [self.view addSubview:vwBg];
    
    //头像
    UIImageView *imageLogo = [[UIImageView alloc]initWithFrame:CGRectMake(10, 14, 60, 60)];
    imageLogo.layer.cornerRadius = 30;
    imageLogo.backgroundColor = [UIColor greenColor];
    [vwBg addSubview:imageLogo];
    
    //名称
    UILabel *lblName = [[UILabel alloc]initWithFrame:CGRectMake(imageLogo.rightX + 10, 10, 140, 20)];
    lblName.text = @"sssssssssssssss";
    lblName.font = [UIFont systemFontOfSize:16];
    [vwBg addSubview:lblName];
    
    //等级
    UILabel *lblLevel = [[UILabel alloc]initWithFrame:CGRectMake(imageLogo.rightX + 10, lblName.bottomY+5, 60, 20)];
    lblLevel.text = @"hh.999";
    lblLevel.font = [UIFont systemFontOfSize:15];
    [vwBg addSubview:lblLevel];
    
    //经验条
    self.progressBar = [[ProgressBar alloc]initWithFrame:CGRectMake(lblLevel.rightX+10, lblLevel.centerY-2.5, SCREEN_WIDTH - lblLevel.rightX - 10 - 20, 5)];
    [vwBg addSubview:self.progressBar];
    
    //计算资源栏每个的宽度
    CGFloat width = (SCREEN_WIDTH - lblName.originX-10)/3;
    
    //金币
    self.countView_Gold = [[CountView alloc]initWithFrame:CGRectMake(lblName.originX, lblLevel.bottomY+5., width -10, 20) icon:nil backgroundImage:nil];
    [self.countView_Gold configCount:9012312222323];
    [vwBg addSubview:self.countView_Gold];
    
    //资源1
    self.countView_Rystal = [[CountView alloc]initWithFrame:CGRectMake(lblName.originX+width, lblLevel.bottomY+5., width -10, 20) icon:nil backgroundImage:nil];
    [self.countView_Rystal configCount:10123123];
    [vwBg addSubview:self.countView_Rystal];
    
    //资源2
    self.countView_Essence = [[CountView alloc]initWithFrame:CGRectMake(lblName.originX+width*2, lblLevel.bottomY+5., width -10, 20) icon:nil backgroundImage:nil];
    [self.countView_Essence configCount:75389];
    [vwBg addSubview:self.countView_Essence];
    
}

#pragma mark - Event
//主界面按钮点击
- (void)Touch_btnMainMenu:(id)sender
{
    [UIView animateWithDuration:0.3 animations:^{
        
        
        if (self.btnMainMenu.selected)
        {   //如果主界面在展开状态，缩回界面
            self.btnMainMenu.center = CGPointMake(0, SCREEN_HEIGHT);
            self.btnMainMenu.selected = NO;
        }
        else
        {   //如果主界面在隐藏状态，展开界面
            self.btnMainMenu.center = CGPointMake(40, SCREEN_HEIGHT - 40);
            self.btnMainMenu.selected = YES;
            //设置界面不论是怎么状态，都执行缩回操作
            self.btnSettingMenu.selected = YES;
            [self Touch_btnSettingMenu:nil];
        }
    }];
}

//设置界面按钮点击
- (void)Touch_btnSettingMenu:(id)sender
{
    [UIView animateWithDuration:0.3 animations:^{
        
        if (self.btnSettingMenu.selected)
        {   //如果设置界面在展开状态，缩回界面
            self.btnSettingMenu.center = CGPointMake(SCREEN_WIDTH, SCREEN_HEIGHT);
            self.btnSettingMenu.selected = NO;
        }
        else
        {   //如果设置界面在隐藏状态，展开界面
            self.btnSettingMenu.center = CGPointMake(SCREEN_WIDTH-40, SCREEN_HEIGHT - 40);
            self.btnSettingMenu.selected = YES;
            //主界面不论是怎么状态，都执行缩回操作
            self.btnMainMenu.selected = YES;
            [self Touch_btnMainMenu:nil];
        }
    }];
}

- (void)Touch_btnGetTask:(id)sender
{
    self.taskView_First = [[TaskView alloc]initWithFrame:CGRectMake(0, 0, 80, 120)];
    [self.view addSubview:self.taskView_First];
    self.taskView_First.center = CGPointMake(self.view.centerX, SCREEN_HEIGHT-self.taskView_First.height/2);
    
    CGFloat width = (SCREEN_WIDTH-20)/3;
    
    [UIView animateWithDuration:0.3 animations:^{
        self.taskView_First.center = CGPointMake(10+width/2, SCREEN_HEIGHT/2);
    }];
    
    self.taskView_Second = [[TaskView alloc]initWithFrame:CGRectMake(0, 0, 80, 120)];
    [self.view addSubview:self.taskView_Second];
    self.taskView_Second.center = CGPointMake(self.view.centerX, SCREEN_HEIGHT-self.taskView_Second.height/2);
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:0.3 animations:^{
            self.taskView_Second.center = CGPointMake(10+width/2+width, SCREEN_HEIGHT/2);
        }];
    });

    
    self.taskView_Third = [[TaskView alloc]initWithFrame:CGRectMake(0, 0, 80, 120)];
    [self.view addSubview:self.taskView_Third];
    self.taskView_Third.center = CGPointMake(self.view.centerX, SCREEN_HEIGHT-self.taskView_Third.height/2);
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:0.3 animations:^{
            self.taskView_Third.center = CGPointMake(10+width/2+width*2, SCREEN_HEIGHT/2);
        }];
    });
    
}

@end
