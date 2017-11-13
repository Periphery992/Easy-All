
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
    [self initView];
}

- (void)initView
{
    UIView *vwBG_Info = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 30)];
    vwBG_Info.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:vwBG_Info];
    
    NSMutableArray *mutarrString = [NSMutableArray arrayWithObjects:@"月份",@"月供",@"月供本金",@"月供利息",@"剩余", nil];
    
    CGFloat width = SCREEN_WIDTH/5;
    for (int i = 0; i < 5; i++)
    {
        UILabel *lblTitle = [[UILabel alloc]initWithFrame:CGRectMake(0+width*i, 0, width, 30)];
        lblTitle.tag = 10000+i;
        lblTitle.textAlignment = NSTextAlignmentCenter;
        lblTitle.text = [mutarrString objectAtIndex:i];
        [vwBG_Info addSubview:lblTitle];
    }
    
    self.tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 30, SCREEN_WIDTH, SCREEN_HEIGHT-64-30) style:UITableViewStylePlain];
    self.tableview.dataSource = self;
    self.tableview.delegate = self;
    self.tableview.tableFooterView = [[UIView alloc]init];
    [self.view addSubview:self.tableview];
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [[HouseLoanManager sharedInstance] getMonths]/12;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
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
    return [NSString stringWithFormat:@"第%zi年",section+1];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *moreTextCell = @"moreTextCell";
    MoreTextCell *cell = [tableView dequeueReusableCellWithIdentifier:moreTextCell];
    
    if (cell == nil)
    {
        cell = [[MoreTextCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:moreTextCell];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    NSMutableArray *mutarrString = [[NSMutableArray alloc]init];
    
    
    NSInteger months = indexPath.section*12+indexPath.row;
    MonthPayBean *bean = [[[HouseLoanManager sharedInstance]getResult] objectAtIndex:months];
    mutarrString = [NSMutableArray arrayWithObjects:[NSString stringWithFormat:@"%zi",indexPath.row+1],
                    [NSString stringWithFormat:@"%0.0f",bean.fMPayment],
                    [NSString stringWithFormat:@"%0.0f",bean.fMPrincipal],
                    [NSString stringWithFormat:@"%0.0f",bean.fMInterest],
                    [NSString stringWithFormat:@"%0.0f",bean.fRemainder],nil];
    
    [cell configTextWithArrSting:mutarrString];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  
}




@end
