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
    if (![self.nuiClass isEqualToString:@"none"]) {
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
    self.nuiIsApplied = [NSNumber numberWithBool:YES];
}

- (void)override_didMoveToWindow
{
    if (!self.nuiIsApplied) {
        [self applyNUI];
    }
    [self override_didMoveToWindow];
}

- (void)orientationDidChange:(NSNotification*)notification
{
    [NUIRenderer performSelector:@selector(sizeDidChangeForNavigationBar:) withObject:self afterDelay:0];
}

@end
