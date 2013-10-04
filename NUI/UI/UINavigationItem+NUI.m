//
//  UINavigationItem+NUI.m
//  NUIDemo
//
//  Created by Tom Benner on 12/9/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import "UINavigationItem+NUI.h"

@implementation UINavigationItem (NUI)

@dynamic nuiClass;

- (void)initNUI
{
    if (!self.nuiClass) {
        self.nuiClass = @"NavigationItem";
    }
}

- (void)applyNUI
{
    [self initNUI];
    if (![self.nuiClass isEqualToString:kNUIClassNone]) {
        [NUIRenderer renderNavigationItem:self withClass:self.nuiClass];
    }
    self.nuiApplied = YES;
}

- (void)override_didMoveToWindow
{
    if (!self.isNUIApplied) {
        [self applyNUI];
    }
    [self override_didMoveToWindow];
}

- (void)setNuiClass:(NSString*)value {
    objc_setAssociatedObject(self, kNUIAssociatedClassKey, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString*)nuiClass {
    return objc_getAssociatedObject(self, kNUIAssociatedClassKey);
}

- (void)setNuiApplied:(BOOL)value {
    
    objc_setAssociatedObject(self, kNUIAssociatedAppliedFlagKey, [NSNumber numberWithBool:value], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

- (BOOL)isNUIApplied {
    NSNumber *nuiAppliedFlagNumber = objc_getAssociatedObject(self, kNUIAssociatedAppliedFlagKey);
    
    return [nuiAppliedFlagNumber boolValue];
}

@end
