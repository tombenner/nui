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
    if (![self.nuiClass isEqualToString:@"none"]) {
        [NUIRenderer renderWindow:self withClass:self.nuiClass];
    }
    self.nuiIsApplied = [NSNumber numberWithBool:YES];
}

- (void)override_becomeKeyWindow
{
    if (!self.nuiIsApplied) {
        [self applyNUI];
    }
    [self override_becomeKeyWindow];
}

@end
