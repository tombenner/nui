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
    
    if ([NUISettings hasProperty:@"background-color-top" withClass:class_name]) {
        CGRect frame = bar.bounds;
        frame.size.width *= 2;
        UIImage *gradient = [NUIGraphics
                             gradientImageWithTop:[NUISettings getColor:@"background-color-top" withClass:class_name]
                             withBottom:[NUISettings getColor:@"background-color-bottom" withClass:class_name]
                             withFrame:frame];
        
        UIImageView *gradientView = [[UIImageView alloc] initWithImage:gradient];
        [bar.subviews[0] insertSubview:gradientView atIndex:1];
    } else if ([NUISettings hasProperty:@"background-color" withClass:class_name]) {
        CGRect frame = bar.bounds;
        frame.size.width *= 2;
        UIImage *colorImage = [NUIGraphics colorImage:[NUISettings getColor:@"background-color" withClass:class_name] withFrame:frame];
        
        UIImageView *colorView = [[UIImageView alloc] initWithImage:colorImage];
        [bar.subviews[0] insertSubview:colorView atIndex:1];
    }
    
    NSDictionary *titleTextAttributes = [NUIUtilities titleTextAttributesForClass:class_name];
    
    if ([[titleTextAttributes allKeys] count] > 0) {
        bar.titleTextAttributes = titleTextAttributes;
    }
}

+ (void)render:(UINavigationBar*)bar onDrawRect:(CGRect)rect withClass:(NSString*)class_name
{
    if ([NUISettings hasProperty:@"background-color-top" withClass:class_name]) {
        CAGradientLayer *gradient = [NUIGraphics
                                     gradientLayerWithTop:[NUISettings getColor:@"background-color-top" withClass:class_name]
                                     withBottom:[NUISettings getColor:@"background-color-bottom" withClass:class_name]
                                     withFrame:bar.frame];
        [gradient renderInContext:UIGraphicsGetCurrentContext()];
    } else if ([NUISettings hasProperty:@"background-color" withClass:class_name]) {
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetFillColor(context, CGColorGetComponents([[NUISettings getColor:@"background-color" withClass:class_name] CGColor]));
        CGContextFillRect(context, rect);
    }
}

@end
