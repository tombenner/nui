//
//  UILabel+NUI.m
//  NUIDemo
//
//  Created by Tom Benner on 12/9/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import "UILabel+NUI.h"

@implementation UILabel (NUI)

@dynamic nuiClass;

- (void)initNUI
{
    if (!self.nuiClass) {
        self.nuiClass = @"Label";
    }
}

- (void)override_awakeFromNib
{
    // Styling shouldn't be applied to inherited classes or to labels within other views
    // (e.g. UITableViewCellContentView)
    if ([self class] == [UILabel class] &&
        [[self superview] class] == [UIView class]) {
        [self initNUI];
        [self awakeFromNibNUI];
    }
    [self override_awakeFromNib];
}

- (void)awakeFromNibNUI
{
    if (![self.nuiClass isEqualToString:@"none"]) {
        [NUIRenderer renderLabel:self withClass:self.nuiClass];
    }
}

- (void)setNuiClass:(NSString*)value {
    objc_setAssociatedObject(self, "nuiClass", value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString*)nuiClass {
    return objc_getAssociatedObject(self, "nuiClass");
}

@end
