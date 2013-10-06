//
//  UIButton+NUI.m
//  NUIDemo
//
//  Created by Tom Benner on 12/8/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import "UIButton+NUI.h"

@implementation UIButton (NUI)

- (void)initNUI
{
    if (!self.nuiClass) {
        self.nuiClass = @"Button";
    }
}

- (void)applyNUI
{
    [self initNUI];
    BOOL forceRender = NO;
    NSString *selfClass = NSStringFromClass([self class]);
    NSString *superviewClass = NSStringFromClass([[self superview] class]);
    NSArray *bypassedClasses = [NSArray arrayWithObjects:@"UINavigationButton", nil];
    NSArray *bypassedSuperviewClasses = [NSArray arrayWithObjects:
                                         @"UICalloutBar",
                                         @"UISearchBarTextField",
                                         @"UIToolbarTextButton",
                                         nil];
    // By default, render UINavigationButtons in UISearchBar as BarButtons
    if ([selfClass isEqualToString:@"UINavigationButton"] &&
        [superviewClass isEqualToString:@"UISearchBar"]) {
        if ([self.nuiClass isEqualToString:@"Button"]) {
            self.nuiClass = @"BarButton:SearchBarButton";
        }
        forceRender = YES;
    }
    if (![self.nuiClass isEqualToString:kNUIClassNone]) {
        if ((![bypassedClasses containsObject:selfClass] &&
            ![bypassedSuperviewClasses containsObject:superviewClass]) ||
            forceRender) {
            [NUIRenderer renderButton:self withClass:self.nuiClass];
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
