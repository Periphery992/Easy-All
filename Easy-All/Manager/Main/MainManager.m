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
        
    }
    return self;
}


#pragma mark - Date

- (NSMutableArray *)getMainList
{
    if (!self.mutarrMainList)
    {
        NSString *filePath = [[NSBundle mainBundle]pathForResource:@"MainList" ofType:@".plist"];
        NSMutableArray *mutarrPlist = [[NSMutableArray alloc] initWithContentsOfFile:filePath];
        self.mutarrMainList = [[NSMutableArray alloc]init];
        
        for (int i = 0; i < mutarrPlist.count; i++)
        {
            MainBean *bean = [[MainBean alloc]init];
            [bean setValuesForKeysWithDictionary:[mutarrPlist objectAtIndex:i]];
            [self.mutarrMainList addObject:bean];
        }
    }

    NSMutableArray *mutarrCopy = [[NSMutableArray alloc]init];
    for (int i = 0; i < self.mutarrMainList.count; i++)
    {
        MainBean *bean = [self.mutarrMainList objectAtIndex:i];
        [mutarrCopy addObject:[bean mutableCopy]];
    }
    
    return mutarrCopy;
}



@end
