//
//  NUITableViewHeaderFooterViewRenderer.m
//  NUIDemo
//
//  Created by Matthew Flint on 12 Aug 2013.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#ifdef __IPHONE_6_0 // iOS6 and later

#import "NUITableViewHeaderFooterViewRenderer.h"

@implementation NUITableViewHeaderFooterViewRenderer

+ (void)render:(UITableViewHeaderFooterView*)view withClass:(NSString*)className
{
    [self renderSizeDependentProperties:view];

    // Set the labels' background colors to clearColor by default, so they don't show a white
    // background on top of the cell background color
    if (view.textLabel != nil) {
        [view.textLabel setBackgroundColor:[UIColor clearColor]];
        // Set Font
        [NUIRenderer renderLabel:view.textLabel withClass:className];
    }

    if (view.detailTextLabel != nil) {
        [view.detailTextLabel setBackgroundColor:[UIColor clearColor]];
        // Set font
        [NUIRenderer renderLabel:view.detailTextLabel withClass:className withSuffix:@"Detail"];
    }

}

+ (void)sizeDidChange:(UITableViewHeaderFooterView*)view
{
    [self renderSizeDependentProperties:view];
}

+ (void)renderSizeDependentProperties:(UITableViewHeaderFooterView*)view
{
    NSString *className = view.nuiClass;

    // Set background color
    if ([NUISettings hasProperty:@"background-color" withClass:className]) {
        UIImage *colorImage = [NUISettings getImageFromColor:@"background-color" withClass:className];
        view.backgroundView = [[UIImageView alloc] initWithImage:colorImage];
    }

    // Set background gradient
    if ([NUISettings hasProperty:@"background-color-top" withClass:className]) {
        UIImage *gradientImage = [NUIGraphics
                gradientImageWithTop:[NUISettings getColor:@"background-color-top" withClass:className]
                              bottom:[NUISettings getColor:@"background-color-bottom" withClass:className]
                               frame:view.bounds];
        view.backgroundView = [[UIImageView alloc] initWithImage:gradientImage];
    }
}

@end

#endif
