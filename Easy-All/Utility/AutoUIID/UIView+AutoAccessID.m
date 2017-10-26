//
//  UIView+AutoAccessID.m
//  Easy-All
//
//  Created by chen on 16/10/2017.
//  Copyright © 2017 chensa. All rights reserved.
//

#import "UIView+AutoAccessID.h"
#import "UIResponder+AutoAccessID.h"
#import <objc/runtime.h>
#define IDTAG   @"Aid_"

@implementation UIView (UIAutoTest)
#if DEBUG

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleSelector:@selector(accessibilityIdentifier) withAnotherSelector:@selector(tb_accessibilityIdentifier)];
        [self swizzleSelector:@selector(accessibilityLabel) withAnotherSelector:@selector(tb_accessibilityLabel)];
    });
}
#endif
+ (void)swizzleSelector:(SEL)originalSelector withAnotherSelector:(SEL)swizzledSelector
{
    Class aClass = [self class];
    
    Method originalMethod = class_getInstanceMethod(aClass, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(aClass, swizzledSelector);
    
    BOOL didAddMethod =
    class_addMethod(aClass,
                    originalSelector,
                    method_getImplementation(swizzledMethod),
                    method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethod) {
        class_replaceMethod(aClass,
                            swizzledSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

#pragma mark - Method Swizzling

- (NSString *)tb_accessibilityIdentifier
{
    NSString *accessibilityIdentifier = [self tb_accessibilityIdentifier];
    if (accessibilityIdentifier.length > 0 && [[accessibilityIdentifier substringToIndex:IDTAG.length] isEqualToString:IDTAG]) {
        return accessibilityIdentifier;
    }
    else if ([accessibilityIdentifier isEqualToString:@"null"]) {
        accessibilityIdentifier = @"";
    }
    
    NSString *labelStr = [self.superview findNameWithInstance:self];
    
    if (labelStr && ![labelStr isEqualToString:@""]) {
        labelStr = [NSString stringWithFormat:@"%@%@",IDTAG,labelStr];
    }
    else {
        if ([self isKindOfClass:[UILabel class]]) {//UILabel 使用 text
            labelStr = [NSString stringWithFormat:@"%@lbl_%@",IDTAG,((UILabel *)self).text?:@""];
        }
        else if ([self isKindOfClass:[UIImageView class]]) {//UIImageView 使用 image 的 imageName
            labelStr = [NSString stringWithFormat:@"%@%@",IDTAG,((UIImageView *)self).image.accessibilityIdentifier?:[NSString stringWithFormat:@"image%ld",(long)((UIImageView *)self).tag]];
        }
        else if ([self isKindOfClass:[UIButton class]]) {//UIButton 使用 button 的 text 和 image
            UIButton *btn = (UIButton *)self;
            
            NSLog(@"accccc3 :  %@",((UIButton *)self).imageView.image.accessibilityIdentifier);
            
            if (((UIButton *)self).titleLabel.text&&((UIButton *)self).titleLabel.text.length> 0)
            {
                labelStr = [NSString stringWithFormat:@"%@btn_%@",IDTAG,((UIButton *)self).titleLabel.text];
            }
            else if (((UIButton *)self).imageView.image.accessibilityIdentifier&&((UIButton *)self).imageView.image.accessibilityIdentifier.length > 0)
            {
                
                labelStr = [NSString stringWithFormat:@"%@btn_%@",IDTAG,((UIButton *)self).imageView.image.accessibilityIdentifier];
            }
        }
        else if ([NSStringFromClass([self class]) isEqualToString:@"UITabBarButton"]) //UITabBarButton 使用label的文字
        {
            //从UITabBarButton的成员变量里寻找_label
            unsigned int numIvars = 0;
            NSString *key=nil;
            Ivar lblivar = nil;
            Ivar * ivars = class_copyIvarList([self class], &numIvars);
            for(int i = 0; i < numIvars; i++) {
                Ivar thisIvar = ivars[i];
                const char *type = ivar_getTypeEncoding(thisIvar);
                NSString *stringType =  [NSString stringWithCString:type encoding:NSUTF8StringEncoding];
                if (![stringType hasPrefix:@"@"]) {
                    continue;
                }
                
                key = [NSString stringWithUTF8String:ivar_getName(thisIvar)];
                if ([key isEqualToString:@"_label"])
                {
                    lblivar = thisIvar;
                    break;
                }
            }
            free(ivars);
            
            //获取对应的label对象
            UILabel *label = object_getIvar(self, lblivar);
            labelStr = [NSString stringWithFormat:@"%@%@",IDTAG,label.text];
        }
        else if (accessibilityIdentifier) {// 已有 label，则在此基础上再次添加更多信息
            
            labelStr = [NSString stringWithFormat:@"%@%@",IDTAG,accessibilityIdentifier];
            
        }
        
        if ([self isKindOfClass:[UIButton class]]) {
            self.accessibilityValue = [NSString stringWithFormat:@"%@btn_%@",IDTAG,((UIButton *)self).currentBackgroundImage.accessibilityIdentifier?:@""];
        }
        
        if (!labelStr||labelStr.length == 0)
        {
            labelStr = [NSString stringWithFormat:@"%@%@",IDTAG,NSStringFromClass([self class])];
        }
    }
    if ([labelStr isEqualToString:IDTAG] || [labelStr isEqualToString:[NSString stringWithFormat:@"%@null",IDTAG ]]) {
        labelStr = @"";
    }
    [self setAccessibilityIdentifier:labelStr];
    return labelStr;
}

- (NSString *)tb_accessibilityLabel
{
    if ([self isKindOfClass:[UIImageView class]]) {//UIImageView 特殊处理
        NSString *name = [self.superview findNameWithInstance:self];
        if (name) {
            self.accessibilityIdentifier = [NSString stringWithFormat:@"%@%@",IDTAG,name];
        }
        else {
            self.accessibilityIdentifier = [NSString stringWithFormat:@"%@%@",IDTAG,((UIImageView *)self).image.accessibilityIdentifier?:[NSString stringWithFormat:@"image%ld",(long)((UIImageView *)self).tag]];
        }
    }
    if ([self isKindOfClass:[UITableViewCell class]]) {//UITableViewCell 特殊处理
        UITableView *tableview = [self findTableView];
        NSIndexPath *indexPath = [tableview indexPathForCell:(UITableViewCell *)self];
        self.accessibilityIdentifier = [NSString stringWithFormat:@"%@%@_%zi_%zi",IDTAG,((UITableViewCell *)self).reuseIdentifier,indexPath.section,indexPath.row];
    }
    return [self tb_accessibilityLabel];
}


@end
