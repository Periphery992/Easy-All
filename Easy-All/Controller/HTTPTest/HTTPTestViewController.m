//
//  HTTPTestViewController.m
//  Easy-All
//
//  Created by chen on 06/11/2017.
//  Copyright © 2017 chensa. All rights reserved.
//

#import "HTTPTestViewController.h"

@interface HTTPTestViewController ()

@end

@implementation HTTPTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"HTTP Test";
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(Touch_RightItem)];
    self.navigationItem.rightBarButtonItem = item;
    
}

- (void)Touch_RightItem
{
    NSURL *url = [NSURL URLWithString:@"Fairy-Kindom://111111"];

    
    [[UIApplication sharedApplication] openURL:url];

}


@end
