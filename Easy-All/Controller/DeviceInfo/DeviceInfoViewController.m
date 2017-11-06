//
//  DeviceInfoViewController.m
//  Easy-All
//
//  Created by chen on 25/09/2017.
//  Copyright © 2017 chensa. All rights reserved.
//

#import "DeviceInfoViewController.h"
#import "InfoDictionary.h"

@interface DeviceInfoViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableview;
@property (nonatomic, strong) NSMutableArray *mutarrTitle;
@property (nonatomic, strong) NSMutableArray *mutarrContent;

@end

@implementation DeviceInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Device Info";
    [self getData];
    [self initView];
}


#pragma mark - Data

- (void)getData
{
    self.mutarrTitle = [[NSMutableArray alloc]init];
    self.mutarrContent = [[NSMutableArray alloc]init];
    
    [self.mutarrTitle addObject:@"DeviceName"];
    [self.mutarrTitle addObject:@"DeivceModel"];
    [self.mutarrTitle addObject:@"DeivceLocalizedModel"];
    [self.mutarrTitle addObject:@"DeivceSystemName"];
    [self.mutarrTitle addObject:@"DeivceSystemVersion"];
    [self.mutarrTitle addObject:@"DeivceUUID"];
    [self.mutarrTitle addObject:@"DeivceType"];
    
    for (int i = 0; i < self.mutarrTitle.count; i++)
    {
        NSString *strMethod = [NSString stringWithFormat:@"get%@",self.mutarrTitle[i]];
        [self.mutarrContent addObject:[InfoDictionary performSelector:NSSelectorFromString(strMethod)]];
    }
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

#pragma mark - TableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.mutarrTitle.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CommonCell = @"CommonCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CommonCell];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CommonCell];
    }
    
    cell.textLabel.text = [self.mutarrTitle objectAtIndex:indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    cell.detailTextLabel.text = [self.mutarrContent objectAtIndex:indexPath.row];
    cell.detailTextLabel.adjustsFontSizeToFitWidth = YES;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    pasteboard.string = [self.mutarrContent objectAtIndex:indexPath.row];
}



@end
