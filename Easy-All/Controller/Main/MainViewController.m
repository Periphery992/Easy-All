//
//  MainViewController.m
//  Easy-All
//
//  Created by chensa on 2017/9/23.
//  Copyright © 2017年 chensa. All rights reserved.
//

#define cellID @"cellID"
#define headerID @"headerID"

#define TAG_CELL_TITLE 1000

#import "MainViewController.h"
#import "MainManager.h"

@interface MainViewController ()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UICollectionViewFlowLayout *customLayout;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Main";
    [self initView];
//    [self autoPush:@"HTTPTestViewController"];
    
}

- (void)autoPush:(NSString *)vcclass
{
    UIViewController *viewcontroller = nil;
    viewcontroller = [[NSClassFromString(vcclass) alloc]init];
    [self.navigationController pushViewController:viewcontroller animated:YES];
}

- (void)initView
{
    _customLayout = [[UICollectionViewFlowLayout alloc] init]; // 自定义的布局对象
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64) collectionViewLayout:_customLayout];
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:_collectionView];
    
    [_collectionView registerClass:[UICollectionViewCell class]  forCellWithReuseIdentifier:cellID];
    [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerID];
}


#pragma mark ---- UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return [[MainManager sharedInstance]getTypeCount];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [[MainManager sharedInstance]getToolsCountWithType:section];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [_collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    MainBean *bean = [[MainManager sharedInstance]getToolsWithIndexPath:indexPath];
    
    UILabel *lblTitle = [cell viewWithTag:TAG_CELL_TITLE];
    
    if (!lblTitle)
    {
        lblTitle = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH/4, 30)];
        lblTitle.center = CGPointMake(SCREEN_WIDTH/8, 55);
        lblTitle.textAlignment = NSTextAlignmentCenter;
        lblTitle.tag = TAG_CELL_TITLE;
        [cell.contentView addSubview:lblTitle];
    }
    lblTitle.text = bean.Name;
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *headerView = [_collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:headerID forIndexPath:indexPath];
    if(headerView == nil)
    {
        headerView = [[UICollectionReusableView alloc] init];
    }
    headerView.backgroundColor = [UIColor grayColor];
    
    
    UILabel *lblTitle = [headerView viewWithTag:TAG_CELL_TITLE];
    
    if (!lblTitle)
    {
        lblTitle = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH/4, 30)];
        [headerView addSubview:lblTitle];
    }
    lblTitle.text = [[MainManager sharedInstance]getTypeNameByIndex:indexPath.section];
    
    return headerView;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    MainBean *bean = [[MainManager sharedInstance]getToolsWithIndexPath:indexPath];
    
    UIViewController *viewcontroller = nil;
    viewcontroller = [[NSClassFromString(bean.Controller) alloc]init];
    [self.navigationController pushViewController:viewcontroller animated:YES];
}

#pragma mark ---- UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return (CGSize){(SCREEN_WIDTH-2.5)/4,110};
}


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0.5, 0.5, 0.5, 0.5);
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0.5f;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0.5f;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(SCREEN_WIDTH, 30);
}


@end
