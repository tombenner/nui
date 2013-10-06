//
//  UITableViewHeaderFooterView+NUI.m
//  NUIDemo
//
//  Created by Matthew Flint on 12 Aug 2013.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#ifdef __IPHONE_6_0 // iOS6 and later

#import "UITableViewHeaderFooterView+NUI.h"

@implementation UITableViewHeaderFooterView (NUI)

- (void)initNUI
{
    if (!self.nuiClass) {
        self.nuiClass = @"TableCellHeaderFooter";
    }
}

- (void)applyNUI
{
    [self initNUI];
    if (![self.nuiClass isEqualToString:@"none"]) {
        [NUIRenderer renderTableViewHeaderFooterView:self withClass:self.nuiClass];
        [NUIRenderer addOrientationDidChangeObserver:self];
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

- (void)override_dealloc {
    [NUIRenderer removeOrientationDidChangeObserver:self];
    [self override_dealloc];
}

- (void)orientationDidChange:(NSNotification*)notification
{
    [NUIRenderer performSelector:@selector(sizeDidChangeForTableViewHeaderFooterView:) withObject:self afterDelay:0];
}

@end

#endif
