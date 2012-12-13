//
//  NUISwizzler.m
//  NUIDemo
//
//  Created by Tom Benner on 12/9/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import "NUISwizzler.h"

@implementation NUISwizzler

- (void)swizzleAll
{
    [self swizzleAwakeFromNib:[UIBarButtonItem class]];
    [self swizzleAwakeFromNib:[UIButton class]];
    [self swizzleAwakeFromNib:[UILabel class]];
    [self swizzleAwakeFromNib:[UINavigationBar class]];
    [self swizzleAwakeFromNib:[UINavigationItem class]];
    [self swizzleAwakeFromNib:[UISegmentedControl class]];
    [self swizzleAwakeFromNib:[UITabBar class]];
    [self swizzleAwakeFromNib:[UITableViewCell class]];
    [self swizzleAwakeFromNib:[UITabBarItem class]];
    [self swizzleAwakeFromNib:[UITextField class]];
    [self swizzleAwakeFromNib:[UIView class]];
}

- (void)swizzleAwakeFromNib:(Class)class
{
    [self swizzle:class from:@selector(awakeFromNib) to:@selector(override_awakeFromNib)];
}

- (void)swizzleDrawRect:(Class)class
{
    [self swizzle:class from:@selector(drawRect:) to:@selector(override_drawRect:)];
}

- (void)swizzle:(Class)class from:(SEL)original to:(SEL)new
{
    Method originalMethod = class_getInstanceMethod(class, original);
    Method newMethod = class_getInstanceMethod(class, new);
    if(class_addMethod(class, original, method_getImplementation(newMethod), method_getTypeEncoding(newMethod))) {
        class_replaceMethod(class, new, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, newMethod);
    }
}

@end
