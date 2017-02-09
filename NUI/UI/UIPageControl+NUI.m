//
//  UIPageControl+NUI.m
//  NUIDemo
//
//  Created by Yuichi Fujiki on 01/29/2016.
//  Copyright (c) 2016 Yuichi Fujiki. All rights reserved.
//

#import "UIPageControl+NUI.h"

@implementation UIPageControl (NUI)

- (void)initNUI
{
    if (!self.nuiClass) {
        self.nuiClass = @"PageControl";
    }
}

- (void)applyNUI
{
    [self initNUI];
    if (![self.nuiClass isEqualToString:kNUIClassNone]) {
        [NUIRenderer renderPageControl:self withClass:self.nuiClass];
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
