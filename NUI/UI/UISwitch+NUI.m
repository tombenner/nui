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
    if ([self class] == [UISwitch class] || self.nuiClass) {
        [self initNUI];
        if (![self.nuiClass isEqualToString:@"none"]) {
            if ([self class] == [UISwitch class]) {
                [NUIRenderer renderSwitch:self withClass:self.nuiClass];
            }
        }
    }
    self.nuiIsApplied = [NSNumber numberWithBool:YES];
}

- (void)override_didMoveToWindow
{
    if (!self.nuiIsApplied) {
        [self applyNUI];
    }
    [self override_didMoveToWindow];
}

@end
