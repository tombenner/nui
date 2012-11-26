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
    
    if ([NUISettings hasKey:@"BackgroundImage" withClass:ui_class_name]) {
        [[ui_class appearance] setBackgroundImage:[NUISettings getImage:@"BackgroundImage" withClass:ui_class_name] forBarMetrics:UIBarMetricsDefault];
    }
    
    if ([NUISettings hasKey:@"BackgroundTintColor" withClass:ui_class_name]) {
        [[ui_class appearance] setTintColor:[NUISettings getColor:@"BackgroundTintColor" withClass:ui_class_name]];
    }
    
    if ([NUISettings hasKey:@"BackgroundColor" withClass:ui_class_name]) {
        [[ui_class appearance] setBackgroundImage:[NUISettings getImageFromColor:@"BackgroundColor" withClass:ui_class_name] forBarMetrics:UIBarMetricsDefault];
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
    
    if ([NUISettings hasKey:@"BackgroundColor" withClass:ui_class_name]) {
        UIImage *backgroundColorImage = [NUIGraphics barButtonWithColor:[NUISettings getColor:@"BackgroundColor" withClass:ui_class_name]];
        [[UIBarButtonItem appearance] setBackgroundImage:backgroundColorImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    }
    
    if ([NUISettings hasKey:@"BackgroundTintColor" withClass:ui_class_name]) {
        [[ui_class appearance] setTintColor:[NUISettings getColor:@"BackgroundTintColor" withClass:ui_class_name]];
    }
    
    if ([NUISettings hasKey:@"BackgroundImage" withClass:ui_class_name]) {
        [[ui_class appearance] setBackgroundImage:[NUISettings getImage:@"BackgroundImage" withClass:ui_class_name] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    }
    
    if ([NUISettings hasKey:@"BackBackgroundColor" withClass:ui_class_name]) {
        UIImage *backBackgroundColorImage = [NUIGraphics backButtonWithColor:[NUISettings getColor:@"BackBackgroundColor" withClass:ui_class_name]];
        [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backBackgroundColorImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    } else if ([NUISettings hasKey:@"BackgroundColor" withClass:ui_class_name]) {
        UIImage *backBackgroundColorImage = [NUIGraphics backButtonWithColor:[NUISettings getColor:@"BackgroundColor" withClass:ui_class_name]];
        [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backBackgroundColorImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    }
    
    if ([NUISettings hasKey:@"BackBackgroundImage" withClass:ui_class_name]) {
        [[ui_class appearance] setBackButtonBackgroundImage:[NUISettings getImage:@"BackBackgroundImage" withClass:ui_class_name] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    }
    
}

@end
