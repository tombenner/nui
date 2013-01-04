//
//  UISwitch+NUI.m
//  NUIDemo
//
//  Created by Benjamin Clayton on 04/01/2013.
//  Copyright (c) 2013 Tom Benner. All rights reserved.
//

#import "UISwitch+NUI.h"

@implementation UISwitch (NUI)

@dynamic nuiClass;
@dynamic nuiIsApplied;

- (void)initNUI
{
    if (!self.nuiClass) {
        self.nuiClass = @"Switch";
    }
}

- (void)override_didMoveToWindow
{
    if (!self.nuiIsApplied) {
        // Styling shouldn't be applied to inherited classes
        if ([self class] == [UISwitch class]) {
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
        if ([self class] == [UISwitch class]) {
            [NUIRenderer renderSwitch:self withClass:self.nuiClass];
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
