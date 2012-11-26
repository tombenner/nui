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
    if ([NUISettings hasKey:@"BackgroundTintColor" withClass:class_name]) {
        [bar setTintColor:[NUISettings getColor:@"BackgroundTintColor" withClass:class_name]];
    }
    
    if ([NUISettings hasKey:@"BackgroundImage" withClass:class_name]) {
        [bar setBackgroundImage:[NUISettings getImage:@"BackgroundImage" withClass:class_name]];
    }
    
    NSDictionary *titleTextAttributes = [NUIUtilities titleTextAttributesForClass:class_name];
    
    for (UITabBarItem *item in bar.items) {
        if ([[titleTextAttributes allKeys] count] > 0) {
            [item setTitleTextAttributes:titleTextAttributes forState:UIControlStateNormal];
        }
        if ([NUISettings hasKey:@"TextOffset" withClass:class_name]) {
            [item setTitlePositionAdjustment:[NUISettings getOffset:@"TextOffset" withClass:class_name]];
        }
    }
}

@end
