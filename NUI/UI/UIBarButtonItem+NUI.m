//
//  UIBarButtonItem+NUI.m
//  NUIDemo
//
//  Created by Tom Benner on 12/9/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import "UIBarButtonItem+NUI.h"

@implementation UIBarButtonItem (NUI)

@dynamic nuiClass;

- (void)initNUI
{
    if (!self.nuiClass) {
        self.nuiClass = @"BarButton";
    }
}

- (void)applyNUI
{
    [self initNUI];
    if (![self.nuiClass isEqualToString:kNUIClassNone]) {
        [NUIRenderer renderBarButtonItem:self withClass:self.nuiClass];
    }
    self.nuiApplied = YES;
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
