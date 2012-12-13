//
//  UITableViewCell+NUI.m
//  NUIDemo
//
//  Created by Tom Benner on 12/9/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import "UITableViewCell+NUI.h"

@implementation UITableViewCell (NUI)

@dynamic nuiClass;

- (void)initNUI
{
    if (!self.nuiClass) {
        self.nuiClass = @"TableCell";
    }
}

- (void)override_awakeFromNib
{
    [self initNUI];
    [self awakeFromNibNUI];
    [self override_awakeFromNib];
}

- (void)awakeFromNibNUI
{
    if (![self.nuiClass isEqualToString:@"none"]) {
        [NUIRenderer renderTableViewCell:self withClass:self.nuiClass];
    }
}

- (void)setNuiClass:(NSString*)value {
    objc_setAssociatedObject(self, "nuiClass", value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString*)nuiClass {
    return objc_getAssociatedObject(self, "nuiClass");
}

@end
