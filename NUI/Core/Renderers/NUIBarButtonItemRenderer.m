//
//  NUIBarButtonItemRenderer.m
//  NUIDemo
//
//  Created by Tom Benner on 11/24/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import "NUIBarButtonItemRenderer.h"

@implementation NUIBarButtonItemRenderer

+ (void)render:(UIBarButtonItem*)item withClass:(NSString*)class_name
{   
    
    if ([NUISettings hasKey:@"BackgroundImage" withClass:class_name]) {
        [item setBackgroundImage:[NUISettings getImage:@"BackgroundImage" withClass:class_name] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    }
    
    if ([NUISettings hasKey:@"BackgroundTintColor" withClass:class_name]) {
        [item setTintColor:[NUISettings getColor:@"BackgroundTintColor" withClass:class_name]];
    }
    if ([NUISettings hasKey:@"BackgroundColor" withClass:class_name]) {
        UIImage *backgroundColorImage = [NUIGraphics barButtonWithColor:[NUISettings getColor:@"BackgroundColor" withClass:class_name]];
        [item setBackgroundImage:backgroundColorImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    }
    
    NSDictionary *titleTextAttributes = [NUIUtilities titleTextAttributesForClass:class_name];
    
    if ([[titleTextAttributes allKeys] count] > 0) {
        [item setTitleTextAttributes:titleTextAttributes forState:UIControlStateNormal];
    }
    
}

@end
