//
//  NUIUtilities.m
//  NUI
//
//  Created by Tom Benner on 11/22/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import "NUIUtilities.h"

@implementation NUIUtilities

+ (NSDictionary*)titleTextAttributesForClass:(NSString*)className
{
    NSMutableDictionary *titleTextAttributes = [NSMutableDictionary dictionary];

    if ([NUISettings hasProperty:@"font-name" withClass:className]) {
        [titleTextAttributes setObject:[UIFont fontWithName:[NUISettings get:@"font-name" withClass:className] size:[NUISettings getFloat:@"font-size" withClass:className]] forKey:UITextAttributeFont];
    }
    
    if ([NUISettings hasProperty:@"font-color" withClass:className]) {
        [titleTextAttributes setObject:[NUISettings getColor:@"font-color" withClass:className] forKey:UITextAttributeTextColor];
    }
    
    if ([NUISettings hasProperty:@"text-shadow-color" withClass:className]) {
        [titleTextAttributes setObject:[NUISettings getColor:@"text-shadow-color" withClass:className] forKey:UITextAttributeTextShadowColor];
    }
    
    if ([NUISettings hasProperty:@"text-shadow-offset" withClass:className]) {
        [titleTextAttributes setObject:[NSValue valueWithUIOffset:[NUISettings getOffset:@"text-shadow-offset" withClass:className]] forKey:UITextAttributeTextShadowOffset];
    }
    
    return titleTextAttributes;
}

@end
