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
    [self render:label withClass:class_name withPrefix:@""];
}

+ (void)render:(UILabel*)label withClass:(NSString*)class_name withPrefix:(NSString*)prefix
{
    NSMutableString *key;
    
    key = [NSString stringWithFormat:@"%@%@", prefix, @"FontColor"];
    if ([NUISettings hasKey:key withClass:class_name]) {
        label.textColor = [NUISettings getColor:key withClass:class_name];
    }
    
    key = [NSString stringWithFormat:@"%@%@", prefix, @"FontColorHighlighted"];
    if ([NUISettings hasKey:key withClass:class_name]) {
        label.highlightedTextColor = [NUISettings getColor:key withClass:class_name];
    }
    
    key = [NSString stringWithFormat:@"%@%@", prefix, @"FontName"];
    NSString *size_key = [NSString stringWithFormat:@"%@%@", prefix, @"FontSize"];
    if ([NUISettings hasKey:key withClass:class_name]) {
        label.font = [UIFont fontWithName:[NUISettings get:key withClass:class_name] size:[NUISettings getFloat:size_key withClass:class_name]];
    }
    
    key = [NSString stringWithFormat:@"%@%@", prefix, @"TextAlpha"];
    if ([NUISettings hasKey:key withClass:class_name]) {
        label.alpha = [NUISettings getFloat:key withClass:class_name];
    }
    
    key = [NSString stringWithFormat:@"%@%@", prefix, @"TextAutoFit"];
    if ([NUISettings hasKey:key withClass:class_name]) {
        [label setAdjustsFontSizeToFitWidth:[NUISettings getBoolean:key withClass:class_name]];
    }
    
    key = [NSString stringWithFormat:@"%@%@", prefix, @"TextShadowColor"];
    if ([NUISettings hasKey:key withClass:class_name]) {
        label.shadowColor = [NUISettings getColor:key withClass:class_name];
    }
    
    key = [NSString stringWithFormat:@"%@%@", prefix, @"TextShadowOffset"];
    if ([NUISettings hasKey:key withClass:class_name]) {
        label.shadowOffset = [NUISettings getSize:key withClass:class_name];
    }
}

@end
