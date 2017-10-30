//
//  BattleViewController.m
//  Easy-All
//
//  Created by chensa on 2017/10/29.
//  Copyright © 2017年 chensa. All rights reserved.
//

#import "BattleViewController.h"
#import "CharacterView.h"
#import "SkillView.h"
#import "StateView.h"

#define TAG_CV_ENEMYCENTER          10001   //角色块，中间敌人
#define TAG_CV_ENEMYLEFT            10002   //角色块，左边敌人
#define TAG_CV_ENEMYRIGHT           10003   //角色块，右边敌人

#define TAG_CV_PETCENTER            10004   //角色块，中间宠物
#define TAG_CV_PETLEFT              10005   //角色块，左边宠物
#define TAG_CV_PETRIGHT             10006   //角色块，右边宠物

#define TAG_STATE_ENEMY_CENTER      10007   //状态块，中间敌人
#define TAG_STATE_ENEMY_LEFT        10008   //状态块，左边敌人
#define TAG_STATE_ENEMY_RIGHT       10009   //状态块，右边敌人
#define TAG_STATE_PET_CENTER        10010   //状态块，中间宠物
#define TAG_STATE_PET_LEFT          10011   //状态块，左边宠物
#define TAG_STATE_PET_RIGHT         10012   //状态块，右边宠物

#define TAG_SKILL_FIRST             10013   //技能块1
#define TAG_SKILL_SECOND            10014   //技能块2
#define TAG_SKILL_THIRD             10015   //技能块3
#define TAG_SKILL_FOURTH            10016   //技能块4

@interface BattleViewController ()
@property (nonatomic, strong) CharacterView *CV_EnemyCenter;
@property (nonatomic, strong) CharacterView *CV_EnemyLeft;
@property (nonatomic, strong) CharacterView *CV_EnemyRight;
@property (nonatomic, strong) CharacterView *CV_PetCenter;
@property (nonatomic, strong) CharacterView *CV_PetLeft;
@property (nonatomic, strong) CharacterView *CV_PetRight;
@property (nonatomic, strong) SkillView *skill_Fitst;
@property (nonatomic, strong) SkillView *skill_Second;
@property (nonatomic, strong) SkillView *skill_Third;
@property (nonatomic, strong) SkillView *skill_Fourth;
@property (nonatomic, strong) StateView *SV_EnemyCenter;
@property (nonatomic, strong) StateView *SV_EnemyLeft;
@property (nonatomic, strong) StateView *SV_EnemyRight;
@property (nonatomic, strong) StateView *SV_PetCenter;
@property (nonatomic, strong) StateView *SV_PetLeft;
@property (nonatomic, strong) StateView *SV_PetRight;
@property (nonatomic, strong) dispatch_source_t timer;

@end

@implementation BattleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.hidden = YES;
    
    [self initEnemyView];
    [self initPetView];
    [self initSkillViewWithCount:3];
    [self initStateView];
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    //创建timer
    self.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(self.timer, DISPATCH_TIME_NOW, 5 * NSEC_PER_SEC, 1 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(self.timer, ^{
        
        
    });
    dispatch_resume(self.timer);
}

- (void)initEnemyView
{
    CGFloat width = (SCREEN_WIDTH - 30)/3;
    
    self.CV_EnemyLeft = [[CharacterView alloc]initWithFrame:CGRectMake(15, 0, width, width *1.2)];
    self.CV_EnemyLeft.bottomY = self.view.centerY - 40-10;
    self.CV_EnemyLeft.tag = TAG_CV_ENEMYLEFT;
    [self.view addSubview:self.CV_EnemyLeft];
    
    self.CV_EnemyCenter = [[CharacterView alloc]initWithFrame:CGRectMake(15+width, 0, width, width *1.2)];
    self.CV_EnemyCenter.bottomY = self.view.centerY - 40-10;
    self.CV_EnemyCenter.backgroundColor = [UIColor blueColor];
    self.CV_EnemyCenter.tag = TAG_CV_ENEMYCENTER;
    [self.view addSubview:self.CV_EnemyCenter];
    
    self.CV_EnemyRight = [[CharacterView alloc]initWithFrame:CGRectMake(15+width*2, 0, width, width *1.2)];
    self.CV_EnemyRight.bottomY = self.view.centerY - 40-10;
    self.CV_EnemyRight.tag = TAG_CV_ENEMYRIGHT;
    [self.view addSubview:self.CV_EnemyRight];
}

- (void)initPetView
{
    CGFloat width = (SCREEN_WIDTH - 30)/3;
    
    self.CV_PetLeft = [[CharacterView alloc]initWithFrame:CGRectMake(15, self.view.centerY + 0, width, width *1.2)];
    self.CV_PetLeft.tag = TAG_CV_PETLEFT;
    [self.view addSubview:self.CV_PetLeft];
    
    self.CV_PetCenter = [[CharacterView alloc]initWithFrame:CGRectMake(15+width, self.view.centerY + 0, width, width *1.2)];
    self.CV_PetCenter.backgroundColor = [UIColor blueColor];
    self.CV_PetCenter.tag = TAG_CV_PETCENTER;
    [self.view addSubview:self.CV_PetCenter];
    
    self.CV_PetRight = [[CharacterView alloc]initWithFrame:CGRectMake(15+width*2, self.view.centerY + 0, width, width *1.2)];
    self.CV_PetRight.tag = TAG_CV_PETRIGHT;
    [self.view addSubview:self.CV_PetRight];
}

- (void)initStateView
{
    self.SV_EnemyCenter = [[StateView alloc]initWithFrame:CGRectMake(self.CV_EnemyCenter.originX, 0, self.CV_EnemyCenter.width, 40)];
    self.SV_EnemyCenter.bottomY = self.CV_EnemyCenter.originY - 10;
    [self.SV_EnemyCenter configProgressBarPosition:CharacterViewProgressPositionBottom];
    [self.view addSubview:self.SV_EnemyCenter];
    
    self.SV_EnemyLeft = [[StateView alloc]initWithFrame:CGRectMake(self.CV_EnemyLeft.originX, 0, self.CV_EnemyLeft.width, 40)];
    self.SV_EnemyLeft.bottomY = self.CV_EnemyLeft.originY - 10;
    [self.SV_EnemyLeft configProgressBarPosition:CharacterViewProgressPositionBottom];
    [self.view addSubview:self.SV_EnemyLeft];
    
    
    self.SV_EnemyRight = [[StateView alloc]initWithFrame:CGRectMake(self.CV_EnemyRight.originX, 0, self.CV_EnemyRight.width, 40)];
    self.SV_EnemyRight.bottomY = self.CV_EnemyRight.originY - 10;
    [self.SV_EnemyRight configProgressBarPosition:CharacterViewProgressPositionBottom];
    [self.view addSubview:self.SV_EnemyRight];
    
    
    self.SV_PetCenter = [[StateView alloc]initWithFrame:CGRectMake(self.CV_PetCenter.originX, self.CV_PetCenter.bottomY + 10, self.CV_PetCenter.width, 40)];
    [self.SV_PetCenter configProgressBarPosition:CharacterViewProgressPositionTop];
    [self.view addSubview:self.SV_PetCenter];
    
    
    self.SV_PetLeft = [[StateView alloc]initWithFrame:CGRectMake(self.CV_PetLeft.originX, self.CV_PetLeft.bottomY + 10, self.CV_PetLeft.width, 40)];
    [self.SV_PetLeft configProgressBarPosition:CharacterViewProgressPositionTop];
    [self.view addSubview:self.SV_PetLeft];
    
    self.SV_PetRight = [[StateView alloc]initWithFrame:CGRectMake(self.CV_EnemyRight.originX, self.CV_PetRight.bottomY + 10, self.CV_EnemyRight.width, 40)];
    [self.SV_PetRight configProgressBarPosition:CharacterViewProgressPositionTop];
    [self.view addSubview:self.SV_PetRight];
}

- (void)initSkillViewWithCount:(NSInteger)count
{
    CGFloat originX = self.view.centerX - 60*count/2.0;
    
    if (count > 0)
    {
        if (!self.skill_Fitst)
        {
            self.skill_Fitst = [[SkillView alloc]init];
            self.skill_Fitst.backgroundColor = [UIColor redColor];
            self.skill_Fitst.tag = TAG_SKILL_FIRST;
            [self.view addSubview:self.skill_Fitst];
        }
        self.skill_Fitst.frame = CGRectMake(originX, SCREEN_HEIGHT - 60, 60, 60);
        self.skill_Fitst.hidden = NO;
    }
    else
    {
        self.skill_Fitst.hidden = YES;
    }
    
    if (count > 1)
    {
        if (!self.skill_Second)
        {
            self.skill_Second = [[SkillView alloc]init];
            self.skill_Second.backgroundColor = [UIColor yellowColor];
            self.skill_Second.tag = TAG_SKILL_SECOND;
            [self.view addSubview:self.skill_Second];
        }
        self.skill_Second.frame = CGRectMake(originX+60, SCREEN_HEIGHT - 60, 60, 60);
        self.skill_Second.hidden = NO;
    }
    else
    {
        self.skill_Second.hidden = YES;
    }
    
    if (count > 2)
    {
        if (!self.skill_Third)
        {
            self.skill_Third = [[SkillView alloc]init];
            self.skill_Third.backgroundColor = [UIColor redColor];
            self.skill_Third.tag = TAG_SKILL_THIRD;
            [self.view addSubview:self.skill_Third];
        }
        self.skill_Third.frame = CGRectMake(originX+120, SCREEN_HEIGHT - 60, 60, 60);
        self.skill_Third.hidden = NO;
    }
    else
    {
        self.skill_Third.hidden = YES;
    }
    
    if (count > 3)
    {
        if (!self.skill_Fourth)
        {
            self.skill_Fourth = [[SkillView alloc]init];
            self.skill_Fourth.backgroundColor = [UIColor yellowColor];
            self.skill_Fourth.tag = TAG_SKILL_FOURTH;
            [self.view addSubview:self.skill_Fourth];
        }
        self.skill_Fourth.frame = CGRectMake(originX+180, SCREEN_HEIGHT - 60, 60, 60);
        self.skill_Fourth.hidden = NO;
    }
    else
    {
        self.skill_Fourth.hidden = YES;
    }
    
}

- (void)attackWithAttacker:(CharacterView *)CV_Attacker defender:(CharacterView*)CV_Defender
{
    CGPoint originCenter = CV_Attacker.center;
    
    [self.view bringSubviewToFront:CV_Attacker];
    
    [UIView animateWithDuration:1.0 animations:^{
        CV_Attacker.center = CV_Defender.center;
    }];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:1.0 animations:^{
            CV_Attacker.center = originCenter;
        }];
    });
}


@end
