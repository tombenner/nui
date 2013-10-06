//
//  UITabBar+NUI.m
//  NUIDemo
//
//  Created by Tom Benner on 12/9/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import "UITabBar+NUI.h"

@implementation UITabBar (NUI)

- (void)initNUI
{
    if (!self.nuiClass) {
        self.nuiClass = @"TabBar";
    }
}

- (void)applyNUI
{
    [self initNUI];
    if (![self.nuiClass isEqualToString:kNUIClassNone]) {
        [NUIRenderer renderTabBar:self withClass:self.nuiClass];
        [NUIRenderer addOrientationDidChangeObserver:self];
    }
    self.nuiApplied = YES;
}

- (void)override_didMoveToWindow
{
    if (!self.isNUIApplied) {
        [self applyNUI];
        
        if ([self respondsToSelector:@selector(NUI_customRender)]) {
            [self performSelector:@selector(NUI_customRender)];
        }
    }
    [self override_didMoveToWindow];
}

- (void)override_dealloc {
    [NUIRenderer removeOrientationDidChangeObserver:self];
    [self override_dealloc];
}

- (void)orientationDidChange:(NSNotification*)notification
{
    [NUIRenderer performSelector:@selector(sizeDidChangeForTabBar:) withObject:self afterDelay:0];
}

@end
