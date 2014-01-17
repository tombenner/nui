//
//  NUISegmentedControlRenderer.m
//  NUIDemo
//
//  Created by Tom Benner on 11/24/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import "NUISegmentedControlRenderer.h"

@implementation NUISegmentedControlRenderer

+ (void)render:(UISegmentedControl*)control withClass:(NSString*)className
{
    if ([NUISettings hasProperty:@"background-image" withClass:className]) {
        if ([NUISettings hasProperty:@"background-image" withClass:className]) {
            [control setBackgroundImage:[NUISettings getImage:@"background-image" withClass:className] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        }
        if ([NUISettings hasProperty:@"background-image-selected" withClass:className]) {
            [control setBackgroundImage:[NUISettings getImage:@"background-image-selected" withClass:className] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
        }
    } else if ([NUISettings hasProperty:@"background-color" withClass:className] ||
               [NUISettings hasProperty:@"border-color" withClass:className]) {
        CALayer *layer = [NUIGraphics roundedRectLayerWithClass:className];
        UIImage *normalImage = [NUIGraphics roundedRectImageWithClass:className layer:layer];
        
        if ([NUISettings hasProperty:@"background-color-selected" withClass:className]) {
            [layer setBackgroundColor:[[NUISettings getColor:@"background-color-selected" withClass:className] CGColor]];
        }
        UIImage *selectedImage = [NUIGraphics roundedRectImageWithClass:className layer:layer];
        [control setBackgroundImage:normalImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        [control setBackgroundImage:selectedImage forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
        if ([NUISettings hasProperty:@"border-color" withClass:className]) {
            [control setDividerImage:[NUISettings getImageFromColor:@"border-color" withClass:className] forLeftSegmentState:UIControlStateNormal rightSegmentState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        }
    }
    
    // Set divider image or divider color
    if ([NUISettings hasProperty:@"divider-image" withClass:className]) {
        [control setDividerImage:[NUISettings getImage:@"divider-image" withClass:className] forLeftSegmentState:UIControlStateNormal rightSegmentState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    } else if ([NUISettings hasProperty:@"divider-color" withClass:className]) {
        [control setDividerImage:[NUISettings getImageFromColor:@"divider-color" withClass:className] forLeftSegmentState:UIControlStateNormal rightSegmentState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    }
    
    // Set background tint color
    if ([NUISettings hasProperty:@"background-tint-color" withClass:className]) {
#if __IPHONE_OS_VERSION_MIN_REQUIRED < 70000
        // UISegmentedControlStyleBar is necessary for setTintColor to take effect
        control.segmentedControlStyle = UISegmentedControlStyleBar;
#endif
        [control setTintColor:[NUISettings getColor:@"background-tint-color" withClass:className]];
    }
    
    NSDictionary *titleTextAttributes = [NUIUtilities titleTextAttributesForClass:className];
    
    if ([[titleTextAttributes allKeys] count] > 0) {
        [control setTitleTextAttributes:titleTextAttributes forState:UIControlStateNormal];
    }
    
    NSDictionary *selectedSegmentAttributeOverrides = [NUIUtilities titleTextAttributesForClass:className withSuffix:@"selected"];
    if ([[selectedSegmentAttributeOverrides allKeys] count] > 0) {
        NSMutableDictionary *selectedTitleTextAttributes = [titleTextAttributes mutableCopy];
        [selectedTitleTextAttributes addEntriesFromDictionary:selectedSegmentAttributeOverrides];
        [control setTitleTextAttributes:[selectedTitleTextAttributes copy] forState:UIControlStateSelected];
    }
}

@end
