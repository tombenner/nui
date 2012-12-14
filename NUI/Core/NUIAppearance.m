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
    
    NSString *uiClassName = @"UINavigationBar";
    Class uiClass = [UINavigationBar class];
    
    NSDictionary *titleTextAttributes = [NUIUtilities titleTextAttributesForClass:uiClassName];
    
    if ([[titleTextAttributes allKeys] count] > 0) {
        [[uiClass appearance] setTitleTextAttributes:titleTextAttributes];
    }
    
    if ([NUISettings hasProperty:@"background-image" withClass:uiClassName]) {
        [[uiClass appearance] setBackgroundImage:[NUISettings getImage:@"background-image" withClass:uiClassName] forBarMetrics:UIBarMetricsDefault];
    }
    
    if ([NUISettings hasProperty:@"background-tint-color" withClass:uiClassName]) {
        [[uiClass appearance] setTintColor:[NUISettings getColor:@"background-tint-color" withClass:uiClassName]];
    }
    
    if ([NUISettings hasProperty:@"background-color" withClass:uiClassName]) {
        [[uiClass appearance] setBackgroundImage:[NUISettings getImageFromColor:@"background-color" withClass:uiClassName] forBarMetrics:UIBarMetricsDefault];
    }
    
}

+ (void)initUIBarButtonItem
{
    
    NSString *uiClassName = @"UIBarButtonItem";
    Class uiClass = [UIBarButtonItem class];
    
    NSDictionary *titleTextAttributes = [NUIUtilities titleTextAttributesForClass:uiClassName];
    
    if ([[titleTextAttributes allKeys] count] > 0) {
        [[uiClass appearance] setTitleTextAttributes:titleTextAttributes forState:UIControlStateNormal];
    }
    
    if ([NUISettings hasProperty:@"background-color" withClass:uiClassName]) {
        UIImage *backgroundColorImage = [NUIGraphics barButtonWithColor:[NUISettings getColor:@"background-color" withClass:uiClassName]];
        [[UIBarButtonItem appearance] setBackgroundImage:backgroundColorImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    }
    
    if ([NUISettings hasProperty:@"background-tint-color" withClass:uiClassName]) {
        [[uiClass appearance] setTintColor:[NUISettings getColor:@"background-tint-color" withClass:uiClassName]];
    }
    
    if ([NUISettings hasProperty:@"background-image" withClass:uiClassName]) {
        [[uiClass appearance] setBackgroundImage:[NUISettings getImage:@"background-image" withClass:uiClassName] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    }
    
    NSString *uiBackClassName = @"UIBackBarButtonItem";
    
    if ([NUISettings hasProperty:@"background-color" withClass:uiBackClassName]) {
        UIImage *backBackgroundColorImage = [NUIGraphics backButtonWithColor:[NUISettings getColor:@"background-color" withClass:uiBackClassName]];
        [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backBackgroundColorImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    } else if ([NUISettings hasProperty:@"background-color" withClass:uiClassName]) {
        UIImage *backBackgroundColorImage = [NUIGraphics backButtonWithColor:[NUISettings getColor:@"background-color" withClass:uiClassName]];
        [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backBackgroundColorImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    }
    
    if ([NUISettings hasProperty:@"background-image" withClass:uiBackClassName]) {
        [[uiClass appearance] setBackButtonBackgroundImage:[NUISettings getImage:@"background-image" withClass:uiBackClassName] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    }
    
}

@end
