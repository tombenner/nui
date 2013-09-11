//
//  UILabel+NUI.m
//  NUIDemo
//
//  Created by Tom Benner on 12/9/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import "UILabel+NUI.h"

@implementation UILabel (NUI)

- (void)initNUI
{
    if (!self.nuiClass) {
        self.nuiClass = @"Label";
    }
}

- (void)applyNUI
{
    // Styling shouldn't be applied to inherited classes or to labels within other views
    // (e.g. UITableViewCellContentView), unless nuiClass is explictly set
    if (([self isMemberOfClass:[UILabel class]] &&
        [[self superview] isMemberOfClass:[UIView class]]) ||
        self.nuiClass)
    {
        [self initNUI];
        if (![self.nuiClass isEqualToString:kNUIClassNone]) {
            [NUIRenderer renderLabel:self withClass:self.nuiClass];
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
