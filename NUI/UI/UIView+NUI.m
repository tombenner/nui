//
//  UIView+NUI.m
//  NUIDemo
//
//  Created by Tom Benner on 12/9/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import "UIView+NUI.h"

@implementation UIView (NUI)

@dynamic nuiClass;

- (void)initNUI
{
    if (!self.nuiClass) {
        self.nuiClass = @"View";
    }
}

- (void)override_didMoveToWindow
{
    if (!self.nuiIsApplied) {
        // Styling shouldn't be applied to inherited classes
        if ([self class] == [UIView class]) {
            [self initNUI];
            [self didMoveToWindowNUI];
        }
        self.nuiIsApplied = [NSNumber numberWithBool:YES];
    }
    [self override_didMoveToWindow];
}

- (void)didMoveToWindowNUI
{
    if (![self.nuiClass isEqualToString:@"none"]) {
        if ([self class] == [UIView class] &&
            [[self superview] class] != [UINavigationBar class]) {
            [NUIRenderer renderView:self withClass:self.nuiClass];
        }
    }
}

- (void)setNuiClass:(NSString*)value {
    objc_setAssociatedObject(self, "nuiClass", value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString*)nuiClass {
    return objc_getAssociatedObject(self, "nuiClass");
}

- (void)setNuiIsApplied:(NSNumber*)value {
    objc_setAssociatedObject(self, "nuiIsApplied", value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSNumber*)nuiIsApplied {
    return objc_getAssociatedObject(self, "nuiIsApplied");
}

@end
