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
    
    NSDictionary *titleTextAttributes = [NUIUtilities titleTextAttributesForClass:className];
    
    if ([[titleTextAttributes allKeys] count] > 0) {
        [[uiClass appearance] setTitleTextAttributes:titleTextAttributes forState:UIControlStateNormal];
    }
    
    if ([NUISettings hasProperty:@"background-tint-color" withClass:className]) {
        [[uiClass appearance] setTintColor:[NUISettings getColor:@"background-tint-color" withClass:className]];
    }
    
    if ([NUISettings hasProperty:@"background-color" withClass:className] ||
               [NUISettings hasProperty:@"background-color-top" withClass:className]) {
        [[uiClass appearance] setBackButtonBackgroundImage:[NUIGraphics backButtonWithClass:className] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    }
    
    if ([NUISettings hasProperty:@"background-image" withClass:className]) {
        UIImage* image = [NUISettings getImage:@"background-image" withClass:className];
        if ([NUISettings hasProperty:@"background-image-insets" withClass:className]) {
            UIEdgeInsets insets = [NUISettings getEdgeInsets:@"background-image-insets" withClass:className];
            image = [image resizableImageWithCapInsets:insets];
        }
        [[uiClass appearance] setBackButtonBackgroundImage:image forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    }
    
}

@end
