//
//  UIWindow+NUI.m
//
//  Created by Julien Phalip on 01/27/13.
//  Copyright (c) 2013 Julien Phalip. All rights reserved.
//

#import "UIWindow+NUI.h"

@implementation UIWindow (NUI)

- (void)initNUI
{
    if (!self.nuiClass) {
        self.nuiClass = @"Window";
    }
}

- (void)applyNUI
{
    [self initNUI];
    if (![self.nuiClass isEqualToString:kNUIClassNone]) {
        [NUIRenderer renderWindow:self withClass:self.nuiClass];
    }
    self.nuiApplied = YES;
}

- (void)override_becomeKeyWindow
{
    if (!self.isNUIApplied) {
        [self applyNUI];
    }
    [self override_becomeKeyWindow];
}

@end
