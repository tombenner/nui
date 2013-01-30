//
//  NUIControlRenderer.m
//  NUIDemo
//
//  Created by Alejandro Isaza on 13-01-30.
//  Copyright (c) 2013 Tom Benner. All rights reserved.
//

#import "NUIControlRenderer.h"

@implementation NUIControlRenderer

+ (void)render:(UIControl*)control withClass:(NSString*)className
{
    if ([NUISettings hasProperty:@"background-image" withClass:className]) {
        [control setBackgroundColor: [NUISettings getColorFromImage:@"background-image" withClass: className]];
    } else if ([NUISettings hasProperty:@"background-color" withClass:className]) {
        [control setBackgroundColor: [NUISettings getColor:@"background-color" withClass: className]];
    }
    
    CALayer *layer = [control layer];
    
    if ([NUISettings hasProperty:@"border-color" withClass:className]) {
        [layer setBorderColor:[[NUISettings getColor:@"border-color" withClass:className] CGColor]];
    }
    
    if ([NUISettings hasProperty:@"border-width" withClass:className]) {
        [layer setBorderWidth:[NUISettings getFloat:@"border-width" withClass:className]];
    }
    
    if ([NUISettings hasProperty:@"corner-radius" withClass:className]) {
        [layer setCornerRadius:[NUISettings getFloat:@"corner-radius" withClass:className]];
    }
}

@end
