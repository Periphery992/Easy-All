//
//  MainViewController.m
//  Easy-All
//
//  Created by chensa on 2017/9/23.
//  Copyright © 2017年 chensa. All rights reserved.
//

#import "MainViewController.h"
#import "DeviceInfoViewController.h"
#import "MainManager.h"


@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    DeviceInfoViewController *controller = [[DeviceInfoViewController alloc]init];
//    [self.navigationController pushViewController:controller animated:YES];
    NSMutableArray *mutarr =  [[MainManager sharedInstance] getMainList];
    MainBean *bean = [mutarr objectAtIndex:0];
    
    bean.Name = @"1";
    
    
    NSMutableArray *mutarr2 =  [[MainManager sharedInstance] getMainList];
    
    NSLog(@"1");
}




@end
