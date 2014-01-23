//
//  UIImageView+NUI.m
//  NUIDemo
//
//  Created by Hulk on 14-1-23.
//  Copyright (c) 2014年 Tom Benner. All rights reserved.
//

#import "UIImageView+NUI.h"

@implementation UIImageView (NUI)

- (void)initNUI
{
    if (!self.nuiClass) {
        self.nuiClass = @"ImageView";
    }
}
- (void)applyNUI
{
    if (([self isMemberOfClass:[UIImageView class]] &&
         [[self superview] isMemberOfClass:[UIView class]]) ||
        self.nuiClass)
    {
        [self initNUI];
        [NUIRenderer renderImageView:self withClass:self.nuiClass];
    }
    self.nuiApplied = YES;
}

- (void)override_awakeFromNib
{
    if (!self.isNUIApplied) {
        [self applyNUI];
    }
    [self override_awakeFromNib];
}

- (void)override_didMoveToWindow
{
    if (!self.isNUIApplied) {
        [self applyNUI];
    }
    [self override_didMoveToWindow];
}

@end
