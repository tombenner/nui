//
//  NUIUtilities.m
//  NUI
//
//  Created by Tom Benner on 11/22/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import "NUIUtilities.h"

@implementation NUIUtilities

+ (NSDictionary*)titleTextAttributesForClass:(NSString*)class_name
{
    NSMutableDictionary *titleTextAttributes = [NSMutableDictionary dictionary];
    
    if ([NUISettings hasProperty:@"font-name" withClass:class_name]) {
        [titleTextAttributes setObject:[UIFont fontWithName:[NUISettings get:@"font-name" withClass:class_name] size:[NUISettings getFloat:@"font-size" withClass:class_name]] forKey:UITextAttributeFont];
    }
    
    if ([NUISettings hasProperty:@"font-color" withClass:class_name]) {
        [titleTextAttributes setObject:[NUISettings getColor:@"font-color" withClass:class_name] forKey:UITextAttributeTextColor];
    }
    
    if ([NUISettings hasProperty:@"text-shadow-color" withClass:class_name]) {
        [titleTextAttributes setObject:[NUISettings getColor:@"text-shadow-color" withClass:class_name] forKey:UITextAttributeTextShadowColor];
    }
    
    if ([NUISettings hasProperty:@"text-shadow-offset" withClass:class_name]) {
        [titleTextAttributes setObject:[NSValue valueWithUIOffset:[NUISettings getOffset:@"text-shadow-offset" withClass:class_name]] forKey:UITextAttributeTextShadowOffset];
    }
    
    return titleTextAttributes;
}

@end
