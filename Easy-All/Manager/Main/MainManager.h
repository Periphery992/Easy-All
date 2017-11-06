//
//  MainManager.h
//  Easy-All
//
//  Created by chen on 26/09/2017.
//  Copyright © 2017 chensa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MainBean.h"

@interface MainManager : NSObject

+ (instancetype)sharedInstance;


/**
 获取主页列表数组
 获取深拷贝主页列表数组，直接修改后该数组内容无法真正改变数组内容，再下次调用该方法时更新
 @return 主页列表数组
 */
- (NSMutableArray *)getMainList;

- (NSInteger)getTypeCount;

- (NSString *)getTypeNameByIndex:(NSInteger)index;

- (NSInteger)getToolsCountWithType:(MainType)type;

- (MainBean *)getToolsWithIndexPath:(NSIndexPath*)indexPath;

@end
