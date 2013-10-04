//
//  UISwitch+NUI.m
//  NUIDemo
//
//  Created by Benjamin Clayton on 04/01/2013.
//  Copyright (c) 2013 Tom Benner. All rights reserved.
//

#import "UISwitch+NUI.h"

@implementation UISwitch (NUI)

- (void)initNUI
{
    if (!self.nuiClass) {
        self.nuiClass = @"Switch";
    }
}

- (void)applyNUI
{
    // Styling shouldn't be applied to inherited classes, unless nuiClass is
    // explictly set
    if ([self isMemberOfClass:[UISwitch class]] || self.nuiClass) {
        [self initNUI];
        if (![self.nuiClass isEqualToString:kNUIClassNone]) {
            [NUIRenderer renderSwitch:self withClass:self.nuiClass];
        }
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

@end
