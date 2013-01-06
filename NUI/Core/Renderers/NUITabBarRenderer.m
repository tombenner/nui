//
//  NUITabBarRenderer.m
//  NUIDemo
//
//  Created by Tom Benner on 11/24/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import "NUITabBarRenderer.h"

@implementation NUITabBarRenderer

+ (void)render:(UITabBar*)bar withClass:(NSString*)className
{
    if ([NUISettings hasProperty:@"background-tint-color" withClass:className]) {
        [bar setTintColor:[NUISettings getColor:@"background-tint-color" withClass:className]];
    }
    
    if ([NUISettings hasProperty:@"background-image" withClass:className]) {
        [bar setBackgroundImage:[NUISettings getImage:@"background-image" withClass:className]];
    }
    
    int backgroundLayerIndex = [bar.layer.sublayers count] == 1 ? 0 : 1;
    if ([NUISettings hasProperty:@"background-color-top" withClass:className]) {
        CGRect frame = bar.bounds;
        frame.size.width *= 2;
        CAGradientLayer *gradient = [NUIGraphics
                                     gradientLayerWithTop:[NUISettings getColor:@"background-color-top" withClass:className]
                                     bottom:[NUISettings getColor:@"background-color-bottom" withClass:className]
                                     frame:frame];
        if (bar.nuiIsApplied) {
            [[bar.layer.sublayers objectAtIndex:backgroundLayerIndex] removeFromSuperlayer];
        }
        [bar.layer insertSublayer:gradient atIndex:backgroundLayerIndex];
    } else if ([NUISettings hasProperty:@"background-color" withClass:className]) {
        CGRect frame = bar.bounds;
        frame.size.width *= 2;
        UIImage *colorImage = [NUIGraphics colorImage:[NUISettings getColor:@"background-color" withClass:className] withFrame:frame];
        CALayer *colorLayer = [NUIGraphics uiImageToCALayer:colorImage];
        if (bar.nuiIsApplied) {
            [[bar.layer.sublayers objectAtIndex:backgroundLayerIndex] removeFromSuperlayer];
        }
        [bar.layer insertSublayer:colorLayer atIndex:backgroundLayerIndex];
    }
    
    // Apply UITabBarItem's background-image-selected property to bar.selectionIndicatorImage
    if ([[bar items] count] > 0) {
        UITabBarItem *firstItem = [[bar items] objectAtIndex:0];
        NSArray *firstItemClasses = [firstItem.nuiClass componentsSeparatedByString: @":"];
        for (NSString *itemClass in firstItemClasses) {
            if ([NUISettings hasProperty:@"background-image-selected" withClass:itemClass]) {
                [bar setSelectionIndicatorImage:[NUISettings getImage:@"background-image-selected" withClass:itemClass]];
            }
        }
    }
}

@end
