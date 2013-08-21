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
}

+ (void)initUIBarButtonItem
{
    NSString *className = @"BarButton:BarButtonBack";
    Class uiClass = [UIBarButtonItem class];
    
    [self setTitleTextAttributesForClass:uiClass nuiClass:className suffix:nil state:UIControlStateNormal];
    [self setTitleTextAttributesForClass:uiClass nuiClass:className suffix:@"selected" state:UIControlStateSelected];
    [self setTitleTextAttributesForClass:uiClass nuiClass:className suffix:@"highlighted" state:UIControlStateHighlighted];

    if ([NUISettings hasProperty:@"background-tint-color" withClass:className]) {
        [[uiClass appearance] setTintColor:[NUISettings getColor:@"background-tint-color" withClass:className]];
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

+ (void)setTitleTextAttributesForClass:(Class)uiClass nuiClass:(NSString *)nuiClass suffix:(NSString *)suffix state:(UIControlState)controlState
{
    NSDictionary *textAttributes;
    if (suffix) {
        textAttributes = [NUIUtilities titleTextAttributesForClass:nuiClass withSuffix:suffix];
    } else {
        textAttributes = [NUIUtilities titleTextAttributesForClass:nuiClass];
    }
    
    if ([[textAttributes allKeys] count] > 0) {
        [[uiClass appearance] setTitleTextAttributes:textAttributes forState:controlState];
    }
}
@end
