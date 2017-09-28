//
//  HouseLoadConfigViewController.m
//  Easy-All
//
//  Created by chensa on 2017/9/28.
//  Copyright © 2017年 chensa. All rights reserved.
//

#import "HouseLoanConfigViewController.h"
#import "RadioBoxCell.h"

@interface HouseLoanConfigViewController ()<UITableViewDelegate,UITableViewDataSource,RadioBoxCellDelegate>
@property (nonatomic, strong) UITableView *tableview;
@property (nonatomic, assign) BOOL bCalculateAllLoan;
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
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    if (indexPath.section == 0)
//    {
        NSString *RadioCell = @"RadioCell";
        RadioBoxCell *cell = [tableView dequeueReusableCellWithIdentifier:RadioCell];
        
        if (cell == nil)
        {
            cell = [[RadioBoxCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:RadioCell];
            cell.delegate = self;
        }
        [cell configHiddenAllRadioBox];
        
        
        if (indexPath.section == 0)
        {
            [cell configTitle:@"还款方式" font:nil color:nil];
            [cell configRadioFirstWithTitle:@"等额本金" font:nil color:nil];
            [cell configRadioSecondWithTitle:@"等额本息" font:nil color:nil];
        }
        else
        {
            [cell configTitle:@"计算方式" font:nil color:nil];
            [cell configRadioFirstWithTitle:@"房屋总价" font:nil color:nil];
            [cell configRadioSecondWithTitle:@"贷款总额" font:nil color:nil];
        }
        
        
        return cell;
//    }

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark - RadioBoxCellDelegate
- (void)radioBoxCell:(RadioBoxCell *)radioBoxCell indexOfSelected:(NSInteger)index
{
    NSIndexPath *indexPath = [self.tableview indexPathForCell:radioBoxCell];
    if (indexPath.row == 1)
    {
        self.bCalculateAllLoan = index==1?YES:NO;
    }
    
    
}

@end
