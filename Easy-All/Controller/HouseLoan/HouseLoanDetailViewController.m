
//
//  HouseLoanDetailViewController.m
//  Easy-All
//
//  Created by chensa on 2017/11/4.
//  Copyright © 2017年 chensa. All rights reserved.
//

#import "HouseLoanDetailViewController.h"
#import "HouseLoanManager.h"
#import "MoreTextCell.h"


@interface HouseLoanDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableview;

@end

@implementation HouseLoanDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStyleGrouped];
    self.tableview.dataSource = self;
    self.tableview.delegate = self;
    self.tableview.tableFooterView = [[UIView alloc]init];
    [self.view addSubview:self.tableview];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [[HouseLoanManager sharedInstance] getMonths]/12+1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 1;
    }
    return 12;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30.0f;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [NSString stringWithFormat:@"第%zi年",section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *moreTextCell = @"moreTextCell";
    MoreTextCell *cell = [tableView dequeueReusableCellWithIdentifier:moreTextCell];
    
    if (cell == nil)
    {
        cell = [[MoreTextCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:moreTextCell];
    }
    
    NSMutableArray *mutarrString = [[NSMutableArray alloc]init];
    
    if (indexPath.section == 0)
    {
        mutarrString = [NSMutableArray arrayWithObjects:@"月份",@"月供",@"月供本金",@"月供利息",@"剩余", nil];

        [cell configTextWithArrSting:mutarrString];
    }
    else
    {
//        NSInteger months = indexPath.section*12-12
//        MonthPayBean *bean =
//        mutarrString = []
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  
}




@end
