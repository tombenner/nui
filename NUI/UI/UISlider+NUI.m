//
//  UISlider+NUI.m
//  NUIDemo
//
//  Created by Simon Moser @savage7 on 09/01/13.
//  Copyright (c) 2013 Simon Moser. All rights reserved.
//

#import "UISlider+NUI.h"

@implementation UISlider (NUI)

- (void)initNUI
{
    if (!self.nuiClass) {
        self.nuiClass = @"Slider";
    }
}

- (void)applyNUI
{
    // Styling shouldn't be applied to inherited classes, unless nuiClass is
    // explictly set
    if ([self class] == [UISlider class] || self.nuiClass) {
        [self initNUI];
        if (![self.nuiClass isEqualToString:@"none"]) {
            if ([self class] == [UISlider class]) {
                [NUIRenderer renderSlider:self withClass:self.nuiClass];
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
