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
    [self swizzleDidMoveToWindow:[UIBarButtonItem class]];
    [self swizzleDidMoveToWindow:[UIButton class]];
    [self swizzleDidMoveToWindow:[UILabel class]];
    [self swizzleDidMoveToWindow:[UINavigationBar class]];
    [self swizzleDidMoveToWindow:[UINavigationItem class]];
    [self swizzleDidMoveToWindow:[UIProgressView class]];
    [self swizzleDidMoveToWindow:[UISearchBar class]];
    [self swizzleDidMoveToWindow:[UISegmentedControl class]];
    [self swizzleDidMoveToWindow:[UISlider class]];
    [self swizzleDidMoveToWindow:[UISwitch class]];
    [self swizzleDidMoveToWindow:[UITabBar class]];
    [self swizzleDidMoveToWindow:[UITableViewCell class]];
    [self swizzleDidMoveToWindow:[UITextField class]];
    [self swizzleDidMoveToWindow:[UIToolbar class]];
    [self swizzleDidMoveToWindow:[UIControl class]];
    [self swizzleDidMoveToWindow:[UIView class]];

    // didMoveToWindow isn't called on UITabBarItems, so we need to use awakeFromNib instead.
    [self swizzleAwakeFromNib:[UITabBarItem class]];
    
    [self swizzle:[UITextField class] methodName:@"textRectForBounds:"];
    [self swizzle:[UITextField class] methodName:@"editingRectForBounds:"];
    [self swizzle:[UIWindow class] methodName:@"becomeKeyWindow"];
}

- (void)swizzleAwakeFromNib:(Class)class
{
    [self swizzle:class methodName:@"awakeFromNib"];
}

- (void)swizzleDidMoveToWindow:(Class)class
{
    [self swizzle:class methodName:@"didMoveToWindow"];
}

- (void)swizzle:(Class)class methodName:(NSString*)methodName
{
    SEL originalMethod = NSSelectorFromString(methodName);
    SEL newMethod = NSSelectorFromString([NSString stringWithFormat:@"%@%@", @"override_", methodName]);
    [self swizzle:class from:originalMethod to:newMethod];
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
