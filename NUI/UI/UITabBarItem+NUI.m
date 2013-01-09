//
//  UITabBarItem+NUI.m
//  NUIDemo
//
//  Created by Tom Benner on 12/9/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import "UITabBarItem+NUI.h"

@implementation UITabBarItem (NUI)

@dynamic nuiClass;

- (void)initNUI
{
    if (!self.nuiClass) {
        self.nuiClass = @"TabBarItem";
    }
}

- (void)applyNUI
{
    [self initNUI];
    if (![self.nuiClass isEqualToString:@"none"]) {
        [NUIRenderer renderTabBarItem:self withClass:self.nuiClass];
    }
    self.nuiIsApplied = [NSNumber numberWithBool:YES];
}

- (void)override_awakeFromNib
{
    if (!self.nuiIsApplied) {
        [self applyNUI];
    }
    [self override_awakeFromNib];
}

- (void)setNuiClass:(NSString*)value {
    objc_setAssociatedObject(self, "nuiClass", value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString*)nuiClass {
    return objc_getAssociatedObject(self, "nuiClass");
}

- (void)setNuiIsApplied:(NSNumber*)value {
    objc_setAssociatedObject(self, "nuiIsApplied", value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSNumber*)nuiIsApplied {
    return objc_getAssociatedObject(self, "nuiIsApplied");
}

@end
