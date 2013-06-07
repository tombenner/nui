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
    if ([self nuiShouldBeApplied]) {
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

- (BOOL)nuiShouldBeApplied
{
    if (![self.nuiClass isEqualToString:@"none"]) {
        if (![[self superview] isKindOfClass:[UISearchBar class]]) {
            return YES;
        }
    }
    return NO;
}

// Padding apparently can't be modified during didMoveToWindow
- (CGRect)override_textRectForBounds:(CGRect)bounds {
    if ([self nuiShouldBeApplied] &&
        [NUISettings hasProperty:@"padding" withClass:self.nuiClass]) {
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

- (void)override_drawRect:(CGRect)rect {
    // draw if border style is none
    if ([self nuiShouldBeApplied] &&
        [NUISettings hasProperty:@"border" withClass:self.nuiClass] && [NUISettings getBorderStyle:@"border-style" withClass:self.nuiClass] == UITextBorderStyleNone) {
        UIEdgeInsets insets = [NUISettings getEdgeInsets:@"border" withClass:self.nuiClass];
        
        CGContextRef context = UIGraphicsGetCurrentContext();
        if ([NUISettings hasProperty:@"border-color" withClass:self.nuiClass])
            [[NUISettings getColor:@"border-color" withClass:self.nuiClass] setStroke];
        else
            [[UIColor blackColor] setStroke];
        
        // top border
        CGContextSetLineWidth(context, insets.top);
        CGContextMoveToPoint(context, rect.origin.x, rect.origin.y);
        CGContextAddLineToPoint(context, rect.origin.x + rect.size.width, rect.origin.y);
        CGContextStrokePath(context);
        
        // right border
        CGContextSetLineWidth(context, insets.right);
        CGContextMoveToPoint(context, rect.origin.x + rect.size.width, rect.origin.y);
        CGContextAddLineToPoint(context, rect.origin.x + rect.size.width, rect.size.height);
        CGContextStrokePath(context);
        
        // bottom border
        CGContextSetLineWidth(context, insets.bottom);
        CGContextMoveToPoint(context, rect.origin.x, rect.size.height);
        CGContextAddLineToPoint(context, rect.origin.x + rect.size.width, rect.size.height);
        CGContextStrokePath(context);
        
        // left border
        CGContextSetLineWidth(context, insets.left);
        CGContextMoveToPoint(context, rect.origin.x, rect.origin.y);
        CGContextAddLineToPoint(context, rect.origin.x, rect.size.height);
        CGContextStrokePath(context);
    }
}

@end
