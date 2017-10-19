//
//  MainViewController.m
//  Easy-All
//
//  Created by chensa on 2017/9/23.
//  Copyright © 2017年 chensa. All rights reserved.
//

#import "MainViewController.h"
#import "DeviceInfoViewController.h"
#import "HouseLoanConfigViewController.h"
#import "MainManager.h"
#import "InfoDictionary.h"
#import "HouseLoanManager.h"
#import "AutoUIIDTestViewController.h"


@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Main";
//    DeviceInfoViewController *controller = [[DeviceInfoViewController alloc]init];
//    [self.navigationController pushViewController:controller animated:YES];
//    HouseLoanConfigViewController *controller = [[HouseLoanConfigViewController alloc]init];
//    [self.navigationController pushViewController:controller animated:YES];
//    [HouseLoanManager sharedInstance];
    AutoUIIDTestViewController *controller = [[AutoUIIDTestViewController alloc]init];
    [self.navigationController pushViewController:controller animated:YES];
    
}



@end
