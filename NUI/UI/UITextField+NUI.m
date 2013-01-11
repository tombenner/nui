//
//  UITextField+NUI.m
//  NUIDemo
//
//  Created by Tom Benner on 12/9/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import "UITextField+NUI.h"

@implementation UITextField (NUI)

- (void)initNUI
{
    if (!self.nuiClass) {
        self.nuiClass = @"TextField";
    }
}

- (void)applyNUI
{
    [self initNUI];
    if (![self.nuiClass isEqualToString:@"none"]) {
        [NUIRenderer renderTextField:self withClass:self.nuiClass];
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

// Padding apparently can't be modified during didMoveToWindow
- (CGRect)override_textRectForBounds:(CGRect)bounds {
    if ([NUISettings hasProperty:@"padding" withClass:self.nuiClass]) {
        UIEdgeInsets insets = [NUISettings getEdgeInsets:@"padding" withClass:self.nuiClass];
        return CGRectMake(bounds.origin.x + insets.left,
                          bounds.origin.y + insets.top,
                          bounds.size.width - (insets.left + insets.right),
                          bounds.size.height - (insets.top + insets.bottom));
    } else {
        return [self override_textRectForBounds:bounds];
    }
}

- (CGRect)override_editingRectForBounds:(CGRect)bounds {
    return [self textRectForBounds:bounds];
}

@end
