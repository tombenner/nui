//
//  UIButton+NUI.m
//  NUIDemo
//
//  Created by Tom Benner on 12/8/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import "UIButton+NUI.h"

@implementation UIButton (NUI)

@dynamic nuiClass;
@dynamic nuiIsApplied;

- (void)initNUI
{
    if (!self.nuiClass) {
        self.nuiClass = @"Button";
    }
}

- (void)override_didMoveToWindow
{
    if (!self.nuiIsApplied) {
        [self initNUI];
        [self didMoveToWindowNUI];
        self.nuiIsApplied = [NSNumber numberWithBool:YES];
    }
    [self override_didMoveToWindow];
}

- (void)didMoveToWindowNUI
{
    if (![self.nuiClass isEqualToString:@"none"]) {
        if (![NSStringFromClass([self class]) isEqualToString:@"UINavigationButton"]) {
            [NUIRenderer renderButton:self withClass:self.nuiClass];
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
