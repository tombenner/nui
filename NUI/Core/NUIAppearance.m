//
//  NUIAppearance.m
//  NUI
//
//  Created by Tom Benner on 11/21/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import "NUIAppearance.h"

@implementation NUIAppearance

+ (void)init
{
    [self initUINavigationBar];
    [self initUIBarButtonItem];
}

+ (void)initUINavigationBar
{
    
    NSString *ui_class_name = @"UINavigationBar";
    Class ui_class = [UINavigationBar class];
    
    NSDictionary *titleTextAttributes = [NUIUtilities titleTextAttributesForClass:ui_class_name];
    
    if ([[titleTextAttributes allKeys] count] > 0) {
        [[ui_class appearance] setTitleTextAttributes:titleTextAttributes];
    }
    
    if ([NUISettings hasProperty:@"background-image" withClass:ui_class_name]) {
        [[ui_class appearance] setBackgroundImage:[NUISettings getImage:@"background-image" withClass:ui_class_name] forBarMetrics:UIBarMetricsDefault];
    }
    
    if ([NUISettings hasProperty:@"background-tint-color" withClass:ui_class_name]) {
        [[ui_class appearance] setTintColor:[NUISettings getColor:@"background-tint-color" withClass:ui_class_name]];
    }
    
    if ([NUISettings hasProperty:@"background-color" withClass:ui_class_name]) {
        [[ui_class appearance] setBackgroundImage:[NUISettings getImageFromColor:@"background-color" withClass:ui_class_name] forBarMetrics:UIBarMetricsDefault];
    }
    
}

+ (void)initUIBarButtonItem
{
    
    NSString *ui_class_name = @"UIBarButtonItem";
    Class ui_class = [UIBarButtonItem class];
    
    NSDictionary *titleTextAttributes = [NUIUtilities titleTextAttributesForClass:ui_class_name];
    
    if ([[titleTextAttributes allKeys] count] > 0) {
        [[ui_class appearance] setTitleTextAttributes:titleTextAttributes forState:UIControlStateNormal];
    }
    
    if ([NUISettings hasProperty:@"background-color" withClass:ui_class_name]) {
        UIImage *backgroundColorImage = [NUIGraphics barButtonWithColor:[NUISettings getColor:@"background-color" withClass:ui_class_name]];
        [[UIBarButtonItem appearance] setBackgroundImage:backgroundColorImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    }
    
    if ([NUISettings hasProperty:@"background-tint-color" withClass:ui_class_name]) {
        [[ui_class appearance] setTintColor:[NUISettings getColor:@"background-tint-color" withClass:ui_class_name]];
    }
    
    if ([NUISettings hasProperty:@"background-image" withClass:ui_class_name]) {
        [[ui_class appearance] setBackgroundImage:[NUISettings getImage:@"background-image" withClass:ui_class_name] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    }
    
    NSString *ui_back_class_name = @"UIBackBarButtonItem";
    
    if ([NUISettings hasProperty:@"background-color" withClass:ui_back_class_name]) {
        UIImage *backBackgroundColorImage = [NUIGraphics backButtonWithColor:[NUISettings getColor:@"background-color" withClass:ui_back_class_name]];
        [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backBackgroundColorImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    } else if ([NUISettings hasProperty:@"background-color" withClass:ui_class_name]) {
        UIImage *backBackgroundColorImage = [NUIGraphics backButtonWithColor:[NUISettings getColor:@"background-color" withClass:ui_class_name]];
        [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backBackgroundColorImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    }
    
    if ([NUISettings hasProperty:@"background-image" withClass:ui_back_class_name]) {
        [[ui_class appearance] setBackButtonBackgroundImage:[NUISettings getImage:@"background-image" withClass:ui_back_class_name] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    }
    
}

@end
