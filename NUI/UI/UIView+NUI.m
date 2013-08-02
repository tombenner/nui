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
@dynamic nuiIsExcluded;

- (void)initNUI
{
    if (!self.nuiClass) {
        self.nuiClass = @"View";
    }
}

- (void)applyNUI
{
    // Styling shouldn't be applied to inherited classes, unless nuiClass is explictly set
    if (([self class] == [UIView class] && [[self superview] class] != [UINavigationBar class]) || self.nuiClass) {
        [self initNUI];
        if (![self.nuiClass isEqualToString:@"none"]) {
            [NUIRenderer renderView:self withClass:self.nuiClass];
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

- (void)setNuiClass:(NSString*)value {
	BOOL isCurrentClassExplicitlyExcluded = NO;
	for (NSString *class in [NUISettings getExclusions]) {
		if ([self isKindOfClass:NSClassFromString(class)]) {
			isCurrentClassExplicitlyExcluded = YES;
			break;
		}
	}
	BOOL isCurrentClassImplicitlyExcluded = (self.superview != nil && self.superview.nuiIsExcluded);
	if (isCurrentClassExplicitlyExcluded || isCurrentClassImplicitlyExcluded) {
		objc_setAssociatedObject(self, "nuiClass", @"none", OBJC_ASSOCIATION_RETAIN_NONATOMIC);
		self.nuiIsExcluded = YES;
	} else {
		objc_setAssociatedObject(self, "nuiClass", value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
	}
}

- (NSString*)nuiClass {
    return objc_getAssociatedObject(self, "nuiClass");
}

- (void)setNuiIsExcluded:(BOOL)nuiIsExcluded {
	objc_setAssociatedObject(self, "nuiIsExcluded", [NSNumber numberWithBool:nuiIsExcluded], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)nuiIsExcluded {
	return [objc_getAssociatedObject(self, "nuiIsExcluded") boolValue];
}

- (void)setNuiIsApplied:(NSNumber*)value {
    objc_setAssociatedObject(self, "nuiIsApplied", value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSNumber*)nuiIsApplied {
    return objc_getAssociatedObject(self, "nuiIsApplied");
}

@end
