//
//  NUITabBarRenderer.m
//  NUIDemo
//
//  Created by Tom Benner on 11/24/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import "NUITabBarRenderer.h"

@implementation NUITabBarRenderer

+ (void)render:(UITabBar*)bar withClass:(NSString*)class_name
{
    if ([NUISettings hasProperty:@"background-tint-color" withClass:class_name]) {
        [bar setTintColor:[NUISettings getColor:@"background-tint-color" withClass:class_name]];
    }
    
    if ([NUISettings hasProperty:@"background-image" withClass:class_name]) {
        [bar setBackgroundImage:[NUISettings getImage:@"background-image" withClass:class_name]];
    }
    
    if ([NUISettings hasProperty:@"background-color-top" withClass:class_name]) {
        CGRect frame = bar.bounds;
        frame.size.width *= 2;
        CAGradientLayer *gradient = [NUIGraphics
                                     gradientLayerWithTop:[NUISettings getColor:@"background-color-top" withClass:class_name]
                                     withBottom:[NUISettings getColor:@"background-color-bottom" withClass:class_name]
                                     withFrame:frame];
        int index = [bar.layer.sublayers count] == 1 ? 0 : 1;
        [bar.layer insertSublayer:gradient atIndex:index];
    } else if ([NUISettings hasProperty:@"background-color" withClass:class_name]) {
        CGRect frame = bar.bounds;
        frame.size.width *= 2;
        UIImage *colorImage = [NUIGraphics colorImage:[NUISettings getColor:@"background-color" withClass:class_name] withFrame:frame];
        
        UIImageView *colorView = [[UIImageView alloc] initWithImage:colorImage];
        [bar insertSubview:colorView atIndex:1];
    }
}

@end
