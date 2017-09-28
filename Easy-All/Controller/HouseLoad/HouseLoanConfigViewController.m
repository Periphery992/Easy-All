//
//  HouseLoadConfigViewController.m
//  Easy-All
//
//  Created by chensa on 2017/9/28.
//  Copyright © 2017年 chensa. All rights reserved.
//

#import "HouseLoanConfigViewController.h"
#import "RadioButtonCell.h"

@interface HouseLoanConfigViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableview;
@end

@implementation HouseLoanConfigViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"House Loan";
    
    [self initView];
    
}

#pragma mark - UI

- (void)initView
{
    self.tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStyleGrouped];
    self.tableview.dataSource = self;
    self.tableview.delegate = self;
    self.tableview.tableFooterView = [[UIView alloc]init];
    [self.view addSubview:self.tableview];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        NSString *RadioCell = @"RadioCell";
        RadioButtonCell *cell = [tableView dequeueReusableCellWithIdentifier:RadioCell];
        
        if (cell == nil)
        {
            cell = [[RadioButtonCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:RadioCell];
        }
        [cell configHiddenAllRadioBox];
        
        
        if (indexPath.row == 0)
        {
            [cell configTitle:@"贷款方式" font:nil color:nil];
            [cell configRadioFirstWithTitle:@"等额本金" font:nil color:nil];
            [cell configRadioSecondWithTitle:@"等额本息" font:nil color:nil];
        }
        else
        {
            [cell configTitle:@"贷款方式" font:nil color:nil];
            [cell configRadioFirstWithTitle:@"等额本金" font:nil color:nil];
            [cell configRadioSecondWithTitle:@"等额本息" font:nil color:nil];
            [cell configRadioThirdWithTitle:@"1" font:nil color:nil];
        }
        
//        [cell configRadioThirdWithTitle:@"1" font:nil color:nil];
        
        
        return cell;
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}


@end
