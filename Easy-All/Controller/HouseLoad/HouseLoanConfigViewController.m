//
//  HouseLoadConfigViewController.m
//  Easy-All
//
//  Created by chensa on 2017/9/28.
//  Copyright © 2017年 chensa. All rights reserved.
//

#import "HouseLoanConfigViewController.h"
#import "HouseLoanManager.h"
#import "RadioBoxCell.h"
#import "InputBoxCell.h"

@interface HouseLoanConfigViewController ()<UITableViewDelegate,UITableViewDataSource,RadioBoxCellDelegate,InputBoxCellDelegate>
@property (nonatomic, strong) UITableView *tableview;
@property (nonatomic, assign) BOOL bCalculateAllLoan;
@property (nonatomic, strong) NSMutableArray *mutarrMonth;
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
    self.tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStylePlain];
    self.tableview.dataSource = self;
    self.tableview.delegate = self;
    self.tableview.tableFooterView = [[UIView alloc]init];
    [self.view addSubview:self.tableview];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [[HouseLoanManager sharedInstance] getHouseLoadCellSectionCount]+1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[HouseLoanManager sharedInstance] getHouseLoadCellRowCountWithSeciton:section];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == HouseLoanCellSectionLoanType ||
        indexPath.section == HouseLoanCellSectionCalculateWay)
    {
        NSString *radioCell = @"radioCell";
        RadioBoxCell *cell = [tableView dequeueReusableCellWithIdentifier:radioCell];
        
        if (cell == nil)
        {
            cell = [[RadioBoxCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:radioCell];
            cell.delegate = self;
        }
        [cell configHiddenAllRadioBox];
        
        
        if (indexPath.section == HouseLoanCellSectionLoanType)
        {
            [cell configTitle:@"还款方式" font:nil color:nil];
            [cell configRadioFirstWithTitle:@"等额本金" font:nil color:nil isSelected:NO];
            [cell configRadioSecondWithTitle:@"等额本息" font:nil color:nil isSelected:NO];
            [cell configSelectedWithIndex:[[HouseLoanManager sharedInstance]getHouseLoanType]];
        }
        else if (indexPath.section == HouseLoanCellSectionCalculateWay)
        {
            [cell configTitle:@"计算方式" font:nil color:nil];
            [cell configRadioFirstWithTitle:@"贷款总额" font:nil color:nil isSelected:NO];
            [cell configRadioSecondWithTitle:@"房屋总价" font:nil color:nil isSelected:NO];
            [cell configSelectedWithIndex:[[HouseLoanManager sharedInstance]getHouseLoanCalculateWay]];
        }
        
        
        return cell;
    }
    else if (indexPath.section == HouseLoanCellSectionLoanAll
             || indexPath.section == HouseLoanCellSectionHouseWorth
             || indexPath.section == HouseLoanCellSectionTime
             || indexPath.section == HouseLoanCellSectionInterestRate
             || indexPath.section == HouseLoanCellSectionDiscount)
    {
        static NSString *inputCell = @"inputCell";
        InputBoxCell *cell = [tableView dequeueReusableCellWithIdentifier:inputCell];
        
        if (cell == nil)
        {
            cell = [[InputBoxCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:inputCell];
            cell.delegate = self;
        }
        
        [cell configUnit:nil font:nil color:nil];
        
        if (indexPath.section == HouseLoanCellSectionLoanAll)
        {
            [cell configTitle:@"贷款总额" font:nil color:nil];
            [cell configUnit:@"万" font:nil color:nil];
            [cell configInputViewWithTextColor:nil textFont:nil keyboardType:UIKeyboardTypeNumberPad];
        }
        else if (indexPath.section == HouseLoanCellSectionHouseWorth)
        {
            [cell configInputViewWithTextColor:nil textFont:nil keyboardType:UIKeyboardTypeNumberPad];
            if (indexPath.row == 0)
            {
                [cell configTitle:@"房屋总价" font:nil color:nil];
                [cell configUnit:@"万" font:nil color:nil];
            }
            else if (indexPath.row == 1)
            {
                [cell configTitle:@"首付比例" font:nil color:nil];
                [cell configUnit:@"%" font:nil color:nil];
            }
        }
        else if (indexPath.section == HouseLoanCellSectionTime)
        {
            [cell configTitle:@"贷款年限" font:nil color:nil];
            [cell configUnit:@"月" font:nil color:nil];
        }
        else if (indexPath.section == HouseLoanCellSectionInterestRate)
        {
            [cell configTitle:@"贷款利率" font:nil color:nil];
            [cell configUnit:@"%" font:nil color:nil];
        }
        else if (indexPath.section == HouseLoanCellSectionDiscount)
        {
            [cell configTitle:@"贷款折扣" font:nil color:nil];
            [cell configUnit:@"%" font:nil color:nil];
        }
        
        return cell;
    }
    else
    {
        NSString *CommonCell = @"CommonCell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CommonCell];
        
        if (cell == nil)
        {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CommonCell];
        }
        cell.textLabel.text = @"计算";
        
        return cell;
    }
    

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == HouseLoanCellSectionEnd)
    {
        self.mutarrMonth = [[NSMutableArray alloc]init];
        [self.mutarrMonth addObjectsFromArray:[[HouseLoanManager sharedInstance]getResult]];
    }
}

#pragma mark - RadioBoxCellDelegate
- (void)radioBoxCell:(RadioBoxCell *)radioBoxCell indexOfSelected:(NSInteger)index
{
    NSIndexPath *indexPath = [self.tableview indexPathForCell:radioBoxCell];
    if (indexPath.section == HouseLoanCellSectionLoanType)
    {
        [[HouseLoanManager sharedInstance]configHouseLoanType:index];
    }
    if (indexPath.section == HouseLoanCellSectionCalculateWay)
    {
        [[HouseLoanManager sharedInstance]configHouseLoadCalculateWay:index];
    }
    [self.tableview reloadData];
}

#pragma mark - InputBoxCellDelegate
- (void)inputBoxCell:(InputBoxCell *)inputBoxCell textFieldChanged:(NSString *)text
{
    NSIndexPath *indexPath = [self.tableview indexPathForCell:inputBoxCell];
    
    if (indexPath.section == HouseLoanCellSectionLoanAll)
    {
        [[HouseLoanManager sharedInstance]configIAllLoan:[text integerValue]];
    }
    else if (indexPath.section == HouseLoanCellSectionHouseWorth)
    {
        if (indexPath.row == 0)
        {
            [[HouseLoanManager sharedInstance]configIAllLoan:[text integerValue]];
        }
        else if (indexPath.row == 1)
        {
            [[HouseLoanManager sharedInstance]configLoanRate:[text integerValue]];
        }
    }
    else if (indexPath.section == HouseLoanCellSectionTime)
    {
        [[HouseLoanManager sharedInstance]configIMonth:[text integerValue]];
    }
    else if (indexPath.section == HouseLoanCellSectionInterestRate)
    {
        [[HouseLoanManager sharedInstance]configInterestRate:[text integerValue]];
    }
    else if (indexPath.section == HouseLoanCellSectionDiscount)
    {
        [[HouseLoanManager sharedInstance]configDiscount:[text integerValue]];
    }
}

@end
