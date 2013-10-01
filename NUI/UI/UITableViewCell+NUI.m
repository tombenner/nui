//
//  UITableViewCell+NUI.m
//  NUIDemo
//
//  Created by Tom Benner on 12/9/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import "UITableViewCell+NUI.h"

@implementation UITableViewCell (NUI)

- (void)initNUI
{
    if (!self.nuiClass) {
        self.nuiClass = @"TableCell";
    }
}

- (void)applyNUI
{
    [self initNUI];
    if (![self.nuiClass isEqualToString:kNUIClassNone]) {
        [NUIRenderer renderTableViewCell:self withClass:self.nuiClass];
        [NUIRenderer addOrientationDidChangeObserver:self];
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

- (void)override_dealloc {
    [NUIRenderer removeOrientationDidChangeObserver:self];
    [self override_dealloc];
}

- (void)orientationDidChange:(NSNotification*)notification
{
    [NUIRenderer performSelector:@selector(sizeDidChangeForTableViewCell:) withObject:self afterDelay:0];
}

@end
