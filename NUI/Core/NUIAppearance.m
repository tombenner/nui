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
    [self initUIBarButtonItem];
    [self initUIPageControl];
}

+ (void)initUIBarButtonItem
{
    NSString *className = IS_PRE_IOS7 ? @"BarButton_iOS6:BarButtonBack_iOS6" : @"BarButton:BarButtonBack";
    Class uiClass = [UIBarButtonItem class];
    
    NSDictionary *titleTextAttributes = [NUIUtilities titleTextAttributesForClass:className];
    NSDictionary *titleTextAttributesHighlighted = [NUIUtilities titleTextAttributesHighlightedForClass:className];
    
    if ([[titleTextAttributes allKeys] count] > 0) {
        [[uiClass appearance] setTitleTextAttributes:titleTextAttributes forState:UIControlStateNormal];
    }
    
    if ([[titleTextAttributesHighlighted allKeys] count] > 0) {
        [[uiClass appearance] setTitleTextAttributes:titleTextAttributesHighlighted forState:UIControlStateHighlighted];
    }
    
    if ([NUISettings hasProperty:@"background-tint-color" withClass:className]) {
        [[uiClass appearance] setTintColor:[NUISettings getColor:@"background-tint-color" withClass:className]];
    }
    
    if ([NUISettings hasProperty:@"tint-color" withClass:className]) {
        [[uiClass appearance] setTintColor:[NUISettings getColor:@"tint-color" withClass:className]];
    }
    
    if ([NUISettings hasProperty:@"background-color" withClass:className] ||
               [NUISettings hasProperty:@"background-color-top" withClass:className]) {
        [[uiClass appearance] setBackButtonBackgroundImage:[NUIGraphics backButtonWithClass:className] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    }
    
    if ([NUISettings hasProperty:@"background-image" withClass:className]) {
        [[uiClass appearance] setBackButtonBackgroundImage:[NUISettings getImage:@"background-image" withClass:className] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    }
    if ([NUISettings hasProperty:@"background-image-selected" withClass:className]) {
        [[uiClass appearance] setBackButtonBackgroundImage:[NUISettings getImage:@"background-image-selected" withClass:className] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    }
    if ([NUISettings hasProperty:@"background-image-highlighted" withClass:className]) {
        [[uiClass appearance] setBackButtonBackgroundImage:[NUISettings getImage:@"background-image-highlighted" withClass:className] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
    }
    if ([NUISettings hasProperty:@"background-image-disabled" withClass:className]) {
        [[uiClass appearance] setBackButtonBackgroundImage:[NUISettings getImage:@"background-image-disabled" withClass:className] forState:UIControlStateDisabled barMetrics:UIBarMetricsDefault];
    }
}

+ (void)initUIPageControl
{
    NSString *className = @"UIPageControl";
    Class uiClass = [UIPageControl class];
    
    if ([NUISettings hasProperty:@"tint-color" withClass:className]) {
        [[uiClass appearance] setPageIndicatorTintColor:[NUISettings getColor:@"tint-color" withClass:className]];
    }
    
    if ([NUISettings hasProperty:@"current-tint-color" withClass:className]) {
        [[uiClass appearance] setCurrentPageIndicatorTintColor:[NUISettings getColor:@"current-tint-color" withClass:className]];
    }
}

@end
