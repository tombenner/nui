//
//  NUILabelRenderer.m
//  NUIDemo
//
//  Created by Tom Benner on 11/24/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import "NUILabelRenderer.h"

@implementation NUILabelRenderer

+ (void)render:(UILabel*)label withClass:(NSString*)className
{
    [self render:label withClass:className withSuffix:@""];
}

+ (void)render:(UILabel*)label withClass:(NSString*)className withSuffix:(NSString*)suffix
{
    NSString *property;
    NSString *fontSizeProperty = @"font-size";
    
    if (![suffix isEqualToString:@""]) {
        className = [NSString stringWithFormat:@"%@%@", className, suffix];
    }
    
    property = @"font-color";
    if ([NUISettings hasProperty:property withClass:className]) {
        label.textColor = [NUISettings getColor:property withClass:className];
    }
    
    property = @"font-color-highlighted";
    if ([NUISettings hasProperty:property withClass:className]) {
        label.highlightedTextColor = [NUISettings getColor:property withClass:className];
    }
    
    property = @"font-name";
    if ([NUISettings hasProperty:property withClass:className]) {
        label.font = [UIFont fontWithName:[NUISettings get:property withClass:className] size:[NUISettings getFloat:fontSizeProperty withClass:className]];
    // If font-name is undefined but font-size is defined, use systemFont
    } else if ([NUISettings getFloat:fontSizeProperty withClass:className]) {
        label.font = [UIFont systemFontOfSize:[NUISettings getFloat:fontSizeProperty withClass:className]];
    }
    
    property = @"text-alpha";
    if ([NUISettings hasProperty:property withClass:className]) {
        label.alpha = [NUISettings getFloat:property withClass:className];
    }
    
    property = @"text-auto-fit";
    if ([NUISettings hasProperty:property withClass:className]) {
        [label setAdjustsFontSizeToFitWidth:[NUISettings getBoolean:property withClass:className]];
    }
    
    property = @"text-shadow-color";
    if ([NUISettings hasProperty:property withClass:className]) {
        label.shadowColor = [NUISettings getColor:property withClass:className];
    }
    
    property = @"text-shadow-offset";
    if ([NUISettings hasProperty:property withClass:className]) {
        label.shadowOffset = [NUISettings getSize:property withClass:className];
    }
}

@end
