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
    
    if ([NUISettings hasKey:@"FontName" withClass:class_name]) {
        [titleTextAttributes setObject:[UIFont fontWithName:[NUISettings get:@"FontName" withClass:class_name] size:[NUISettings getFloat:@"FontSize" withClass:class_name]] forKey:UITextAttributeFont];
    }
    
    if ([NUISettings hasKey:@"FontColor" withClass:class_name]) {
        [titleTextAttributes setObject:[NUISettings getColor:@"FontColor" withClass:class_name] forKey:UITextAttributeTextColor];
    }
    
    if ([NUISettings hasKey:@"TextShadowColor" withClass:class_name]) {
        [titleTextAttributes setObject:[NUISettings getColor:@"TextShadowColor" withClass:class_name] forKey:UITextAttributeTextShadowColor];
    }
    
    if ([NUISettings hasKey:@"TextShadowOffset" withClass:class_name]) {
        [titleTextAttributes setObject:[NSValue valueWithUIOffset:[NUISettings getOffset:@"TextShadowOffset" withClass:class_name]] forKey:UITextAttributeTextShadowOffset];
    }
    
    return titleTextAttributes;
}

@end
