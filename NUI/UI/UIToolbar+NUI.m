//
//  NUIToolbarRenderer.m
//  NUIDemo
//
//  Created by Simon Moser @savage7 on 09/01/13.
//  Copyright (c) 2013 Simon Moser. All rights reserved.
//

#import "UIToolbar+NUI.h"

@implementation UIToolbar (NUI)

- (void)initNUI
{
    if (!self.nuiClass) {
        self.nuiClass = @"Toolbar";
    }
}

- (void)applyNUI
{
    [self initNUI];
    if (![self.nuiClass isEqualToString:kNUIClassNone]) {
        [NUIRenderer renderToolbar:self withClass:self.nuiClass];
        
        for (UIBarButtonItem *barButtonItem in [self items]) {
            [barButtonItem applyNUI];
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
