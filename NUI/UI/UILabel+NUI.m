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
    if (([self class] == [UILabel class] &&
        [[self superview] class] == [UIView class]) || self.nuiClass) {
        [self initNUI];
        if (![self.nuiClass isEqualToString:@"none"]) {
            [NUIRenderer renderLabel:self withClass:self.nuiClass];
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
