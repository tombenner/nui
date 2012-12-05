//
//  NUITabBarRenderer.m
//  NUIDemo
//
//  Created by Tom Benner on 11/24/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import "NUITabBarRenderer.h"

@implementation NUITabBarRenderer

+ (void)render:(UITabBar*)bar withClass:(NSString*)class_name
{
    if ([NUISettings hasProperty:@"background-tint-color" withClass:class_name]) {
        [bar setTintColor:[NUISettings getColor:@"background-tint-color" withClass:class_name]];
    }
    
    if ([NUISettings hasProperty:@"background-image" withClass:class_name]) {
        [bar setBackgroundImage:[NUISettings getImage:@"background-image" withClass:class_name]];
    }
    
    NSDictionary *titleTextAttributes = [NUIUtilities titleTextAttributesForClass:class_name];
    
    for (UITabBarItem *item in bar.items) {
        if ([[titleTextAttributes allKeys] count] > 0) {
            [item setTitleTextAttributes:titleTextAttributes forState:UIControlStateNormal];
        }
        if ([NUISettings hasProperty:@"text-offset" withClass:class_name]) {
            [item setTitlePositionAdjustment:[NUISettings getOffset:@"text-offset" withClass:class_name]];
        }
    }
}

@end
