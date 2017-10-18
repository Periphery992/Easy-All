//
//  AutoUIIDTestViewController.m
//  Easy-All
//
//  Created by chen on 17/10/2017.
//  Copyright © 2017 chensa. All rights reserved.
//

#import "AutoUIIDTestViewController.h"

@interface AutoUIIDTestViewController ()
@property (nonatomic,strong) UIView *vwTest2;

@end

@implementation AutoUIIDTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIView *vwtest1 = [[UIView alloc]initWithFrame:CGRectMake(0, 60, 100, 100)];
    vwtest1.backgroundColor = [UIColor redColor];
    [self.view addSubview:vwtest1];
    
    
    
    
}


@end
