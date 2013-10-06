//
//  UISlider+NUI.m
//  NUIDemo
//
//  Created by Simon Moser @savage7 on 09/01/13.
//  Copyright (c) 2013 Simon Moser. All rights reserved.
//

#import "UISlider+NUI.h"

@implementation UISlider (NUI)

- (void)initNUI
{
    if (!self.nuiClass) {
        self.nuiClass = @"Slider";
    }
}

- (void)applyNUI
{
    // Styling shouldn't be applied to inherited classes, unless nuiClass is
    // explictly set
    if ([self isMemberOfClass:[UISlider class]] || self.nuiClass) {
        
        [self initNUI];
        if (![self.nuiClass isEqualToString:kNUIClassNone]) {
            [NUIRenderer renderSlider:self withClass:self.nuiClass];
        }
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

@end
