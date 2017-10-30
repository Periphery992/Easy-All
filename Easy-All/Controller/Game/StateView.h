//
//  StateView.h
//  Easy-All
//
//  Created by chensa on 2017/10/29.
//  Copyright © 2017年 chensa. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    CharacterViewProgressPositionTop,
    CharacterViewProgressPositionBottom,
} CharacterViewProgressPosition;

@interface StateView : UIView

- (void)configProgressBarPosition:(CharacterViewProgressPosition)position;

@end
