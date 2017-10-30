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
@property (nonatomic, strong) UIButton *btnCancel;


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
    self.btnGetTask.hidden = YES;
    self.btnGetTask.alpha = 0;
    
    if (!self.btnCancel)
    {
        self.btnCancel = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 80, 30)];
        self.btnCancel.backgroundColor = [UIColor blueColor];
        self.btnCancel.center = CGPointMake(self.view.centerX, SCREEN_HEIGHT - 70);
        [self.btnCancel addTarget:self action:@selector(Touch_btnCancel:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:self.btnCancel];
    }
    self.btnCancel.hidden = NO;
    
    //第一任务卡
    [self showTaskView:self.taskView_First index:0];
    
    //第二任务卡
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self showTaskView:self.taskView_Second index:1];
    });
    
    //第三任务卡
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self showTaskView:self.taskView_Third index:2];
    });
}

- (void)Touch_btnCancel:(id)sender
{
    self.btnCancel.hidden = YES;
    self.btnGetTask.hidden = NO;
    
    [UIView animateWithDuration:0.5 animations:^{
        self.taskView_First.alpha = 0;
        self.taskView_Second.alpha = 0;
        self.taskView_Third.alpha = 0;
        self.btnGetTask.alpha = 1;
    }];
}

- (void)showTaskView:(TaskView *)taskView index:(NSInteger)index
{
    CGFloat width = (SCREEN_WIDTH-20)/3;
    
    if (!taskView)
    {
        taskView = [[TaskView alloc]initWithFrame:CGRectMake(0, 0, width-10, (width-10)*1.5)];
        [self.view addSubview:taskView];
    }
    taskView.center = CGPointMake(self.view.centerX, SCREEN_HEIGHT-taskView.height/2);
    taskView.hidden = NO;
    taskView.alpha = 1;
    
    [UIView animateWithDuration:0.3 animations:^{
        taskView.center = CGPointMake(10+width/2+width*index, SCREEN_HEIGHT/2);
    }];
    
    if (index == 0)
    {
        self.taskView_First = taskView;
    }
    else if (index == 1)
    {
        self.taskView_Second = taskView;
    }
    else if (index == 2)
    {
        self.taskView_Third = taskView;
    }
    
}


@end