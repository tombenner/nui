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

- (void)setNuiClass:(NSString*)value
{
    if (![value isEqualToString:@"none"]) {
        // Set class to none if view is in the exclude
        NSMutableArray *excludeViews = [NSMutableArray arrayWithArray:[[NUISettings get:@"exclude-views" withClass:value] componentsSeparatedByString:@","]];
        // Add global exclusions to the list
        [excludeViews addObjectsFromArray:[NUISettings getGlobalExclusions]];
        if (excludeViews.count) {
            if ([excludeViews containsObject:NSStringFromClass([self class])]) {
                value = @"none";
            }
        }
    }
    
    if (![value isEqualToString:@"none"]) {
        // Set class to none if any view superviews is in the exclude
        NSMutableArray *excludeSubviews = [NSMutableArray arrayWithArray:[[NUISettings get:@"exclude-subviews" withClass:value] componentsSeparatedByString:@","]];
        // Add global exclusions to the list
        [excludeSubviews addObjectsFromArray:[NUISettings getGlobalExclusions]];
        if (excludeSubviews.count) {
            UIView *superView = self;
            while (superView != nil) {
                if ([excludeSubviews containsObject:NSStringFromClass([superView class])]) {
                    value = @"none";
                    break;
                }
                superView = superView.superview;
            }
        }
    }
    
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
