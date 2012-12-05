//
//  NUISegmentedControlRenderer.m
//  NUIDemo
//
//  Created by Tom Benner on 11/24/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import "NUISegmentedControlRenderer.h"

@implementation NUISegmentedControlRenderer

+ (void)render:(UISegmentedControl*)control withClass:(NSString*)class_name
{
    // UISegmentedControlStyleBar is necessary for some of the settings below to take effect
    control.segmentedControlStyle = UISegmentedControlStyleBar;
    
    // Set background color
    if ([NUISettings hasProperty:@"background-color" withClass:class_name]) {
        [control setBackgroundColor:[NUISettings getColor:@"background-color" withClass:class_name]];
    }
    // Set background tint color
    if ([NUISettings hasProperty:@"background-tint-color" withClass:class_name]) {
        [control setTintColor:[NUISettings getColor:@"background-tint-color" withClass:class_name]];
    }
    
    NSDictionary *titleTextAttributes = [NUIUtilities titleTextAttributesForClass:class_name];
    
    if ([[titleTextAttributes allKeys] count] > 0) {
        [control setTitleTextAttributes:titleTextAttributes forState:UIControlStateNormal];
    }
}

@end
