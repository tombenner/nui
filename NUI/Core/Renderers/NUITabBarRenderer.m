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
        UIImage* image = [NUISettings getImage:@"background-image" withClass:className];
        if ([NUISettings hasProperty:@"background-image-insets" withClass:className]) {
            UIEdgeInsets insets = [NUISettings getEdgeInsets:@"background-image-insets" withClass:className];
            image = [image resizableImageWithCapInsets:insets];
        }
        [bar setBackgroundImage:image];
    }
    
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
    
    // Apply UITabBarItem's background-image-selected property to bar.selectionIndicatorImage
    if ([[bar items] count] > 0) {
        UITabBarItem *firstItem = [[bar items] objectAtIndex:0];
        NSArray *firstItemClasses = [firstItem.nuiClass componentsSeparatedByString: @":"];
        for (NSString *itemClass in firstItemClasses) {
            if ([NUISettings hasProperty:@"background-image-selected" withClass:itemClass]) {
                UIImage* image = [NUISettings getImage:@"background-image-selected" withClass:className];
                if ([NUISettings hasProperty:@"background-image-selected-insets" withClass:className]) {
                    UIEdgeInsets insets = [NUISettings getEdgeInsets:@"background-image-selected-insets" withClass:className];
                    image = [image resizableImageWithCapInsets:insets];
                }
                [bar setSelectionIndicatorImage:image];
            }
        }
    }
}

@end
