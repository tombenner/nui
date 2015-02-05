//
//  NUINavigationBarRenderer.m
//  NUIDemo
//
//  Created by Tom Benner on 11/24/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import "NUINavigationBarRenderer.h"

@implementation NUINavigationBarRenderer

+ (void)render:(UINavigationBar*)bar withClass:(NSString*)className
{
    if ([NUISettings hasProperty:@"bar-style" withClass:className]) {
        NSString *barStyle = [NUISettings get:@"bar-style" withClass:className];
        if ([barStyle isEqualToString:@"black"]) {
            [bar setBarStyle:UIBarStyleBlack];
        } else if ([barStyle isEqualToString:@"black-opaque"]) {
            [bar setBarStyle:UIBarStyleBlackOpaque];
        } else if ([barStyle isEqualToString:@"black-translucent"]) {
            [bar setBarStyle:UIBarStyleBlackTranslucent];
        } else if ([barStyle isEqualToString:@"default"]) {
            [bar setBarStyle:UIBarStyleDefault];
        } else {
            [bar setBarStyle:UIBarStyleDefault];
        }
    }
    
    if ([NUISettings hasProperty:@"translucent" withClass:className]) {
        BOOL translucent = [NUISettings getBoolean:@"translucent" withClass:className];
        [bar setTranslucent:translucent];
    }
    
    if ([bar respondsToSelector:@selector(setBarTintColor:)]) {
        if ([NUISettings hasProperty:@"bar-tint-color" withClass:className]) {
            [bar setBarTintColor:[NUISettings getColor:@"bar-tint-color" withClass:className]];
        }
    }
    
    if ([NUISettings hasProperty:@"background-tint-color" withClass:className]) {
        [bar setTintColor:[NUISettings getColor:@"background-tint-color" withClass:className]];
    }

    if ([NUISettings hasProperty:@"background-image" withClass:className]) {
        [bar setBackgroundImage:[NUISettings getImage:@"background-image" withClass:className] forBarMetrics:UIBarMetricsDefault];
    }
    if ([NUISettings hasProperty:@"shadow-image" withClass:className]) {
        [bar setShadowImage:[NUISettings getImage:@"shadow-image" withClass:className]];
    }

    NSString *property = @"title-vertical-offset";
    if ([NUISettings hasProperty:property withClass:className]) {
        float offset = [NUISettings getFloat:property withClass:className];
        [bar setTitleVerticalPositionAdjustment:offset forBarMetrics:UIBarMetricsDefault];
    }

    [self renderSizeDependentProperties:bar];

    NSDictionary *titleTextAttributes = [NUIUtilities titleTextAttributesForClass:className];

    if ([[titleTextAttributes allKeys] count] > 0) {
        bar.titleTextAttributes = titleTextAttributes;
    }
}

+ (void)sizeDidChange:(UINavigationBar*)bar
{
    [self renderSizeDependentProperties:bar];
}

+ (void)renderSizeDependentProperties:(UINavigationBar*)bar
{
    NSString *className = bar.nuiClass;

    if ([NUISettings hasProperty:@"background-color-top" withClass:className]) {
        CGRect frame = bar.bounds;
        UIImage *gradientImage = [NUIGraphics
                                  gradientImageWithTop:[NUISettings getColor:@"background-color-top" withClass:className]
                                  bottom:[NUISettings getColor:@"background-color-bottom" withClass:className]
                                  frame:frame];
        [bar setBackgroundImage:gradientImage forBarMetrics:UIBarMetricsDefault];
    } else if ([NUISettings hasProperty:@"background-color" withClass:className]) {
        CGRect frame = bar.bounds;
        UIImage *colorImage = [NUIGraphics colorImage:[NUISettings getColor:@"background-color" withClass:className] withFrame:frame];
        [bar setBackgroundImage:colorImage forBarMetrics:UIBarMetricsDefault];
    }
}

@end
