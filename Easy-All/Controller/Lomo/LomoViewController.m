//
//  LomoViewController.m
//  Easy-All
//
//  Created by chen on 10/11/2017.
//  Copyright © 2017 chensa. All rights reserved.
//

#import "LomoViewController.h"
#import "ECAuthorized.h"

@interface LomoViewController ()

@end

@implementation LomoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[ECAuthorized sharedInstance]getAuthorizedWithType:ECAuthorizedTypePhotos result:^(BOOL success) {
        
        if (success)
        {
            [self initView];
        }
        
    }];
}

- (void)initView
{
    
}

@end
