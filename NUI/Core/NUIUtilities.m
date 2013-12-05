//
//  NUIUtilities.m
//  NUI
//
//  Created by Tom Benner on 11/22/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import "NUIUtilities.h"

@implementation NUIUtilities

+ (NSDictionary*)titleTextAttributesForClass:(NSString*)className withSuffix:(NSString*)suffix
{
    return [self titleTextAttributesForClass:className withSuffix:suffix forHighlighted:NO];
}

+ (NSDictionary*)titleTextAttributesForClass:(NSString*)className withSuffix:(NSString*)suffix forHighlighted:(BOOL)highlighted
{
    NSString *highlightedPostfix = @"-highlighted";
    NSMutableDictionary *titleTextAttributes = [NSMutableDictionary dictionary];

    NSMutableString *fontNameSelector = [[NUIUtilities selector:@"font-name" withSuffix:suffix] mutableCopy];
    NSMutableString *fontSizeSelector = [[NUIUtilities selector:@"font-size" withSuffix:suffix] mutableCopy];
    NSMutableString *fontColorSelector = [[NUIUtilities selector:@"font-color" withSuffix:suffix] mutableCopy];
    NSMutableString *textShadowColorSelector = [[NUIUtilities selector:@"text-shadow-color" withSuffix:suffix] mutableCopy];
    NSMutableString *textShadowOffsetSelector = [[NUIUtilities selector:@"text-shadow-offset" withSuffix:suffix] mutableCopy];

    if (highlighted) {
        [fontNameSelector appendString:highlightedPostfix];
        [fontSizeSelector appendString:highlightedPostfix];
        [fontColorSelector appendString:highlightedPostfix];
        [textShadowColorSelector appendString:highlightedPostfix];
        [textShadowOffsetSelector appendString:highlightedPostfix];
    }
    
    if ([NUISettings hasProperty:fontNameSelector withClass:className] || [NUISettings hasProperty:fontSizeSelector withClass:className]) {
        NSString *fontName = [NUISettings get:fontNameSelector withClass:className];
        float fontSize = [NUISettings getFloat:fontSizeSelector withClass:className];

        fontSize = fontSize ? fontSize : [UIFont systemFontSize];
        UIFont *font = fontName ? [UIFont fontWithName:fontName size:fontSize] : [UIFont systemFontOfSize:fontSize];

        [titleTextAttributes setObject:font forKey:UITextAttributeFont];
    }

    if ([NUISettings hasProperty:fontColorSelector withClass:className]) {
        [titleTextAttributes setObject:[NUISettings getColor:fontColorSelector withClass:className] forKey:UITextAttributeTextColor];
    }
    
    if ([NUISettings hasProperty:textShadowColorSelector withClass:className]) {
        [titleTextAttributes setObject:[NUISettings getColor:textShadowColorSelector withClass:className] forKey:UITextAttributeTextShadowColor];
    }

    if ([NUISettings hasProperty:textShadowOffsetSelector withClass:className]) {
        [titleTextAttributes setObject:[NSValue valueWithUIOffset:[NUISettings getOffset:textShadowOffsetSelector withClass:className]] forKey:UITextAttributeTextShadowOffset];
    }

    return titleTextAttributes;
}

+ (NSDictionary*)titleTextAttributesForClass:(NSString*)className
{
    return [NUIUtilities titleTextAttributesForClass:className withSuffix:nil forHighlighted:NO];
}

+ (NSDictionary*)titleTextAttributesHighlightedForClass:(NSString*)className
{
    return [NUIUtilities titleTextAttributesForClass:className withSuffix:nil forHighlighted:YES];
}

+ (NSString*)selector:(NSString*)selector withSuffix:(NSString*)suffix
{
    if (suffix) {
        return [NSString stringWithFormat:@"%@-%@", selector, suffix];
    }
    return selector;
}


@end
