
//
//  CommonViewController.m
//  Common
//
//  Created by chen on 2017/1/3.
//  Copyright © 2017年 chen. All rights reserved.
//

#import "CommonViewController.h"
#import "UIImage+Color.h"

@interface CommonViewController ()
@property (nonatomic, weak) UIButton *leftBarButton;
@property (nonatomic, assign) BackType backType;


@end

@implementation CommonViewController

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    NSLog(@"%@ appear",[NSString stringWithUTF8String:object_getClassName(self)]); //打印viewcontroller出现
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    NSLog(@"%@ Disappear",[NSString stringWithUTF8String:object_getClassName(self)]); //打印viewcontroller消失
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColorFromRGB(0xF0F0F0, 1.0f);//设置背景颜色

    [self initNavigationController];
}

#pragma mark - navigationController
//配置navigationController的属性
- (void)initNavigationController
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        self.navigationController.navigationBar.titleTextAttributes = [[NSMutableDictionary alloc]initWithObjectsAndKeys:UIColorFromRGB(WhiteColor, 1.0f),NSForegroundColorAttributeName,nil]; //设置标题颜色
        self.navigationController.navigationBar.tintColor = UIColorFromRGB(WhiteColor, 1.0f);//设置按钮颜色
        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor blackColor] CGSize:CGSizeMake(SCREEN_WIDTH, 64)] forBarMetrics:UIBarMetricsDefault];//设置navigation颜色
    });

    //navgationbar 左侧返回按钮
    UIButton *leftBarButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
    [leftBarButton setImage:[UIImage imageNamed:@"Nav_Back"] forState:UIControlStateNormal];
    [leftBarButton addTarget:self action:@selector(touchBtn_Back:) forControlEvents:UIControlEventTouchUpInside];
    leftBarButton.hidden = YES;
    [self.navigationController.navigationBar addSubview:leftBarButton];
    self.leftBarButton = leftBarButton;
}

#pragma mark - UI
- (void)isShowBackButton:(BOOL)isShow backType:(BackType)backtype
{
    //根据要求隐藏或显示返回按钮
    self.leftBarButton.hidden = !isShow;
    self.backType = backtype;
}

#pragma mark - Events
//返回按钮点击事件
- (void)touchBtn_Back:(id)sender
{
    if (self.backType == BackTypePop) //返回上一页
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
    else if (self.backType == BackTypePopToRootView) //返回根页面
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
    else if (self.backType == BackTypeDismiss) //页面消失
    {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

#pragma mark - StatusBar
//设置状态栏的显示或隐藏
- (void)setStatusBarHidden:(BOOL)hidden
{
    _statusBarHidden = hidden;
    [self setNeedsStatusBarAppearanceUpdate];
}

- (BOOL)prefersStatusBarHidden
{
    return self.statusBarHidden;
}

//设置状态栏的样式
- (void)setStatusBarStyle:(UIStatusBarStyle)statusBarStyle
{
    _statusBarStyle = statusBarStyle;
    [UIApplication sharedApplication].statusBarStyle = _statusBarStyle;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
