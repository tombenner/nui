//
//  UINavigationBar+NUI.m
//  NUIDemo
//
//  Created by Tom Benner on 12/9/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import "UINavigationBar+NUI.h"

@implementation UINavigationBar (NUI)

- (void)initNUI
{
    if (!self.nuiClass) {
        self.nuiClass = @"NavigationBar";
    }
}

- (void)applyNUI
{
    [self initNUI];
    if (![self.nuiClass isEqualToString:kNUIClassNone]) {
        [NUIRenderer renderNavigationBar:self withClass:self.nuiClass];
        [NUIRenderer addOrientationDidChangeObserver:self];
        for (UINavigationItem *navigationItem in [self items]) {
            for (UIBarButtonItem *barButtonItem in [navigationItem leftBarButtonItems]) {
                [barButtonItem applyNUI];
            }
            for (UIBarButtonItem *barButtonItem in [navigationItem rightBarButtonItems]) {
                [barButtonItem applyNUI];
            }
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

- (void)override_dealloc {
    [NUIRenderer removeOrientationDidChangeObserver:self];
    [self override_dealloc];
}

- (void)orientationDidChange:(NSNotification*)notification
{
    [NUIRenderer performSelector:@selector(sizeDidChangeForNavigationBar:) withObject:self afterDelay:0];
}

@end
