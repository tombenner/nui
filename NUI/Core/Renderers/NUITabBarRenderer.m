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
    NSString * property = @"background-image";
    if ([NUISettings hasProperty:property withClass:className]) {
        [bar setBackgroundImage:[NUISettings getImage:property withClass:className]];
    }
    
    property = @"selected-image";
    if ([NUISettings hasProperty:property withClass:className]) {
        [bar setSelectionIndicatorImage:[NUISettings getImage:property withClass:className]];
    }
    
    property = @"selected-image-tint-color";
    if ([NUISettings hasProperty:property withClass:className]) {
        [bar setTintColor:[NUISettings getColor:property withClass:className]];
    }
    
    [self renderSizeDependentProperties:bar];
    
    // Apply UITabBarItem's background-image-selected property to bar.selectionIndicatorImage
    property = @"background-image-selected";
    if ([[bar items] count] > 0) {
        UITabBarItem *firstItem = [[bar items] objectAtIndex:0];
        NSArray *firstItemClasses = [firstItem.nuiClass componentsSeparatedByString: @":"];
        for (NSString *itemClass in firstItemClasses) {
            if ([NUISettings hasProperty:property withClass:itemClass]) {
                [bar setSelectionIndicatorImage:[NUISettings getImage:property withClass:itemClass]];
            }
        }
    }
    
    property = @"background-tint-color";
    if ([NUISettings hasProperty:property withClass:className]) {
        [bar setTintColor:[NUISettings getColor:property withClass:className]];
    }
    
    property = @"bar-tint-color";
    if ([NUISettings hasProperty:property withClass:className]) {
        [bar setBarTintColor:[NUISettings getColor:property withClass:className]];
    }

    property = @"background-color";
    if ([NUISettings hasProperty:property withClass:className]) {
        [bar setBackgroundColor:[NUISettings getColor:property withClass:className]];
    }
}

+ (void)sizeDidChange:(UITabBar*)bar
{
    [self renderSizeDependentProperties:bar];
}

+ (void)renderSizeDependentProperties:(UITabBar*)bar
{
    NSString *className = bar.nuiClass;
    
    if ([NUISettings hasProperty:@"background-color-top" withClass:className]) {
        CGRect frame = bar.bounds;
        UIImage *gradientImage = [NUIGraphics
                                  gradientImageWithTop:[NUISettings getColor:@"background-color-top" withClass:className]
                                  bottom:[NUISettings getColor:@"background-color-bottom" withClass:className]
                                  frame:frame];
        [bar setBackgroundImage:gradientImage];
    } else if ([NUISettings hasProperty:@"background-color" withClass:className]) {
        CGRect frame = bar.bounds;
        UIImage *colorImage = [NUIGraphics colorImage:[NUISettings getColor:@"background-color" withClass:className] withFrame:frame];
        [bar setBackgroundImage:colorImage];
    }
}

@end
