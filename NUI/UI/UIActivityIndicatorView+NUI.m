//
//  UIActivityIndicatorView+NUI.m
//  Pods
//
//  Created by Gomez, Antonio on 22/04/2016.
//
//

#import "UIActivityIndicatorView+NUI.h"

@implementation UIActivityIndicatorView (NUI)

- (void)initNUI
{
    if (!self.nuiClass) {
        self.nuiClass = @"ActivityIndicator";
    }
}

- (void)applyNUI
{
    [self initNUI];
    if (![self.nuiClass isEqualToString:kNUIClassNone]) {
        [NUIRenderer renderActivityIndicator:self withClass:self.nuiClass];
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
