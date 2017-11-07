//
//  HTTPTestViewController.m
//  Easy-All
//
//  Created by chen on 06/11/2017.
//  Copyright © 2017 chensa. All rights reserved.
//

#import "HTTPTestViewController.h"

@interface HTTPTestViewController ()
@property (nonatomic, strong) UITextView *txtvwHTTP;

@end

@implementation HTTPTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"HTTP Test";
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(Touch_RightItem)];
    self.navigationItem.rightBarButtonItem = item;
    
    self.txtvwHTTP = [[UITextView alloc]initWithFrame:CGRectMake(10, 15, SCREEN_WIDTH-20, 80)];
    self.txtvwHTTP.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:self.txtvwHTTP];
    
    NSString *strContect = [[NSUserDefaults standardUserDefaults]objectForKey:@"HTTPURL"];
    self.txtvwHTTP.text = strContect?strContect:@"http://39.108.216.0:8845/fairy";
    
}

- (void)Touch_RightItem
{
    [[NSUserDefaults standardUserDefaults]setObject:self.txtvwHTTP.text forKey:@"HTTPURL"];
    
    NSString *strContect = [NSString stringWithFormat:@"Fairy-Kindom://%@",self.txtvwHTTP.text];
    NSURL *url = [NSURL URLWithString:strContect];

    [[UIApplication sharedApplication] openURL:url];

}


@end
