//
//  NUINavigationBarRenderer.m
//  NUIDemo
//
//  Created by Tom Benner on 11/24/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import "NUINavigationBarRenderer.h"

@implementation NUINavigationBarRenderer

+ (void)render:(UINavigationBar*)bar withClass:(NSString*)class_name
{
    if ([NUISettings hasProperty:@"background-tint-color" withClass:class_name]) {
        [bar setTintColor:[NUISettings getColor:@"background-tint-color" withClass:class_name]];
    }
    
    if ([NUISettings hasProperty:@"background-image" withClass:class_name]) {
        [bar setBackgroundImage:[NUISettings getImage:@"background-image" withClass:class_name] forBarMetrics:UIBarMetricsDefault];
    }
    
    NSDictionary *titleTextAttributes = [NUIUtilities titleTextAttributesForClass:class_name];
    
    if ([[titleTextAttributes allKeys] count] > 0) {
        bar.titleTextAttributes = titleTextAttributes;
    }
}

@end
