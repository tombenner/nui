//
//  NUILabelRenderer.m
//  NUIDemo
//
//  Created by Tom Benner on 11/24/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import "NUILabelRenderer.h"

@implementation NUILabelRenderer

+ (void)render:(UILabel*)label withClass:(NSString*)class_name
{
    [self render:label withClass:class_name withSuffix:@""];
}

+ (void)render:(UILabel*)label withClass:(NSString*)class_name withSuffix:(NSString*)suffix
{
    NSString *property;
    
    if (![suffix isEqualToString:@""]) {
        class_name = [NSString stringWithFormat:@"%@%@", class_name, suffix];
    }
    
    property = @"font-color";
    if ([NUISettings hasProperty:property withClass:class_name]) {
        label.textColor = [NUISettings getColor:property withClass:class_name];
    }
    
    property = @"font-color-highlighted";
    if ([NUISettings hasProperty:property withClass:class_name]) {
        label.highlightedTextColor = [NUISettings getColor:property withClass:class_name];
    }
    
    property = @"font-name";
    NSString *size_property = @"font-size";
    if ([NUISettings hasProperty:property withClass:class_name]) {
        label.font = [UIFont fontWithName:[NUISettings get:property withClass:class_name] size:[NUISettings getFloat:size_property withClass:class_name]];
    }
    
    property = @"text-alpha";
    if ([NUISettings hasProperty:property withClass:class_name]) {
        label.alpha = [NUISettings getFloat:property withClass:class_name];
    }
    
    property = @"text-auto-fit";
    if ([NUISettings hasProperty:property withClass:class_name]) {
        [label setAdjustsFontSizeToFitWidth:[NUISettings getBoolean:property withClass:class_name]];
    }
    
    property = @"text-shadow-color";
    if ([NUISettings hasProperty:property withClass:class_name]) {
        label.shadowColor = [NUISettings getColor:property withClass:class_name];
    }
    
    property = @"text-shadow-offset";
    if ([NUISettings hasProperty:property withClass:class_name]) {
        label.shadowOffset = [NUISettings getSize:property withClass:class_name];
    }
}

@end
