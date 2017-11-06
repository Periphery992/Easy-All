//
//  MainManager.m
//  Easy-All
//
//  Created by chen on 26/09/2017.
//  Copyright © 2017 chensa. All rights reserved.
//

#import "MainManager.h"

@interface MainManager()
@property (nonatomic, strong) NSMutableArray *mutarrMainList;
@property (nonatomic, strong) NSDictionary *dicMainList;

@end

@implementation MainManager

+ (instancetype)sharedInstance{
    
    static id _sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[[self class] alloc] init];
    });
    return _sharedInstance;
}

- (instancetype)init
{
    if (self = [super init])
    {
        NSString *filePath = [[NSBundle mainBundle]pathForResource:@"MainList" ofType:@".plist"];
        NSMutableArray *mutarrPlist = [[NSMutableArray alloc] initWithContentsOfFile:filePath];
        self.mutarrMainList = [[NSMutableArray alloc]init];
        self.dicMainList = [[NSMutableDictionary alloc]init];
        
        for (int i = 0; i < mutarrPlist.count; i++)
        {
            MainBean *bean = [[MainBean alloc]init];
            [bean setValuesForKeysWithDictionary:[mutarrPlist objectAtIndex:i]];
            [self.mutarrMainList addObject:bean];
            
            
            
            NSMutableArray *mutarr = [[NSMutableArray alloc]init];
            if ([self.dicMainList objectForKey:[NSString stringWithFormat:@"%zi",bean.Type]])
            {
                mutarr = [self.dicMainList objectForKey:[NSString stringWithFormat:@"%zi",bean.Type]];
            }
            [mutarr addObject:bean];
            [self.dicMainList setValue:mutarr forKey:[NSString stringWithFormat:@"%zi",bean.Type]];
        }
    }
    return self;
}


#pragma mark - Date

- (NSMutableArray *)getMainList
{
    return self.mutarrMainList;
}

- (NSInteger)getTypeCount
{
    return MainTypeEnd;
}

- (NSString *)getTypeNameByIndex:(NSInteger)index
{
    if (index == MainTypeSmallTools)
    {
        return @"小工具";
    }
    else if (index == MainTypePrivateTools)
    {
        return @"私有工具";
    }
    
    return @"其他";
}

- (NSInteger)getToolsCountWithType:(MainType)type
{
    NSMutableArray *mutarr = [self.dicMainList objectForKey:[NSString stringWithFormat:@"%zi",type]];
    
    if (!mutarr)
    {
        return 0;
    }

    return mutarr.count;
}

- (MainBean *)getToolsWithIndexPath:(NSIndexPath*)indexPath
{
    NSMutableArray *mutarr = [self.dicMainList objectForKey:[NSString stringWithFormat:@"%zi",indexPath.section]];
    
    return [mutarr objectAtIndex:indexPath.row];
}

@end
