//
//  NUITabBarItemRenderer.m
//  NUIDemo
//
//  Created by Tom Benner on 12/9/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import "NUITabBarItemRenderer.h"

@implementation NUITabBarItemRenderer

+ (void)render:(UITabBarItem*)item withClass:(NSString*)className
{   
    NSDictionary *titleTextAttributes = [NUIUtilities titleTextAttributesForClass:className];
    
    if ([[titleTextAttributes allKeys] count] > 0) {
        [item setTitleTextAttributes:titleTextAttributes forState:UIControlStateNormal];
    }

    if ([NUISettings hasProperty:@"text-offset" withClass:className]) {
        [item setTitlePositionAdjustment:[NUISettings getOffset:@"text-offset" withClass:className]];
    }

    if ([NUISettings hasProperty:@"image-insets" withClass:className]) {
        [item setImageInsets:[NUISettings getEdgeInsets:@"image-insets" withClass:className]];
    }

    if ([NUISettings hasProperty:@"finished-image" withClass:className]) {
        UIImage *unselectedFinishedImage = [NUISettings getImage:@"finished-image" withClass:className];
        UIImage *selectedFinishedImage = unselectedFinishedImage;

        if ([NUISettings hasProperty:@"finished-image" withClass:className]) {
            selectedFinishedImage = [NUISettings getImage:@"finished-image-selected" withClass:className];
        }

        [item setFinishedSelectedImage:selectedFinishedImage withFinishedUnselectedImage:unselectedFinishedImage];
    }

}

@end
