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
            [self transformText];
        }
    }
    self.nuiApplied = YES;
}

- (void)transformText
{
    if (![NUIRenderer needsTextTransformWithClass:self.nuiClass])
        return;
    
    [self transformTitleForState:UIControlStateNormal];
    [self transformTitleForState:UIControlStateSelected];
    [self transformTitleForState:UIControlStateHighlighted];
    [self transformTitleForState:UIControlStateDisabled];
}

- (void)transformTitleForState:(UIControlState)state
{
    if ((NSFoundationVersionNumber >= NSFoundationVersionNumber_iOS_6_0)) {
        NSAttributedString *attributedTitle = [self attributedTitleForState:state];
        
        if (attributedTitle)
            [self setAttributedTitle:attributedTitle forState:state];
        else
            [self setTitle:[self titleForState:state] forState:state];
    } else {
        [self setTitle:[self titleForState:state] forState:state];
    }
}

- (void)override_didMoveToWindow
{
    if (!self.isNUIApplied) {
        [self applyNUI];
    }
    [self override_didMoveToWindow];
}

- (void)override_setTitle:(NSString *)title forState:(UIControlState)state
{
    NSString *transformedTitle = title;
    
    if (title && self.nuiClass && ![self.nuiClass isEqualToString:kNUIClassNone])
        transformedTitle = [NUIRenderer transformText:title withClass:self.nuiClass];
    
    [self override_setTitle:transformedTitle forState:state];
}

- (void)override_setAttributedTitle:(NSAttributedString *)title forState:(UIControlState)state
{
    NSAttributedString *transformedTitle = title;
    
    if (title && self.nuiClass && ![self.nuiClass isEqualToString:kNUIClassNone])
        transformedTitle = [NUIRenderer transformAttributedText:title withClass:self.nuiClass];
    
    [self override_setAttributedTitle:transformedTitle forState:state];
}

@end
