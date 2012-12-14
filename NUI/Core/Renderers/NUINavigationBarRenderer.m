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
    if ([NUISettings hasProperty:@"background-tint-color" withClass:className]) {
        [bar setTintColor:[NUISettings getColor:@"background-tint-color" withClass:className]];
    }
    
    if ([NUISettings hasProperty:@"background-image" withClass:className]) {
        [bar setBackgroundImage:[NUISettings getImage:@"background-image" withClass:className] forBarMetrics:UIBarMetricsDefault];
    }
    
    if ([NUISettings hasProperty:@"background-color-top" withClass:className]) {
        CGRect frame = bar.bounds;
        frame.size.width *= 2;
        UIImage *gradient = [NUIGraphics
                             gradientImageWithTop:[NUISettings getColor:@"background-color-top" withClass:className]
                             bottom:[NUISettings getColor:@"background-color-bottom" withClass:className]
                             frame:frame];
        
        UIImageView *gradientView = [[UIImageView alloc] initWithImage:gradient];
        [bar.subviews[0] insertSubview:gradientView atIndex:1];
    } else if ([NUISettings hasProperty:@"background-color" withClass:className]) {
        CGRect frame = bar.bounds;
        frame.size.width *= 2;
        UIImage *colorImage = [NUIGraphics colorImage:[NUISettings getColor:@"background-color" withClass:className] withFrame:frame];
        
        UIImageView *colorView = [[UIImageView alloc] initWithImage:colorImage];
        [bar.subviews[0] insertSubview:colorView atIndex:1];
    }
    
    NSDictionary *titleTextAttributes = [NUIUtilities titleTextAttributesForClass:className];
    
    if ([[titleTextAttributes allKeys] count] > 0) {
        bar.titleTextAttributes = titleTextAttributes;
    }
}

+ (void)render:(UINavigationBar*)bar onDrawRect:(CGRect)rect withClass:(NSString*)className
{
    if ([NUISettings hasProperty:@"background-color-top" withClass:className]) {
        CAGradientLayer *gradient = [NUIGraphics
                                     gradientLayerWithTop:[NUISettings getColor:@"background-color-top" withClass:className]
                                     bottom:[NUISettings getColor:@"background-color-bottom" withClass:className]
                                     frame:bar.frame];
        [gradient renderInContext:UIGraphicsGetCurrentContext()];
    } else if ([NUISettings hasProperty:@"background-color" withClass:className]) {
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetFillColor(context, CGColorGetComponents([[NUISettings getColor:@"background-color" withClass:className] CGColor]));
        CGContextFillRect(context, rect);
    }
}

@end
