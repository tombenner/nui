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

- (void)initNUI
{
    if (!self.nuiClass) {
        self.nuiClass = @"Button";
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
        [NUIRenderer renderButton:self withClass:self.nuiClass];
    }
}

- (void)setNuiClass:(NSString*)value {
    objc_setAssociatedObject(self, "nuiClass", value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString*)nuiClass {
    return objc_getAssociatedObject(self, "nuiClass");
}

@end
