//
//  NUIUtilities.m
//  NUI
//
//  Created by Tom Benner on 11/22/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import "NUIUtilities.h"

@implementation NUIUtilities

+ (NSDictionary*)titleTextAttributesForClass:(NSString*)className withSuffix:(NSString*) suffix
{
    NSMutableDictionary *titleTextAttributes = [NSMutableDictionary dictionary];
    
    NSString *fontColorSelector = [NUIUtilities selector:@"font-color" withSuffix:suffix];
    NSString *textShadowColorSelector = [NUIUtilities selector:@"text-shadow-color" withSuffix:suffix];
    NSString *textShadowOffsetSelector = [NUIUtilities selector:@"text-shadow-offset" withSuffix:suffix];
    
    if ([NUISettings hasFontPropertiesWithClass:className]) {
        UIFont *font = [NUISettings getFontWithClass:className];
        
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= 70000
        [titleTextAttributes setObject:font forKey:NSFontAttributeName];
#else
        [titleTextAttributes setObject:font forKey:UITextAttributeFont];
#endif
    }
    
    if ([NUISettings hasProperty:fontColorSelector withClass:className]) {
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= 70000
        [titleTextAttributes setObject:[NUISettings getColor:fontColorSelector withClass:className] forKey:NSForegroundColorAttributeName];
#else
        [titleTextAttributes setObject:[NUISettings getColor:fontColorSelector withClass:className] forKey:UITextAttributeTextColor];
#endif
    }
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= 70000
    if ([NUISettings hasProperty:textShadowColorSelector withClass:className] || [NUISettings hasProperty:textShadowOffsetSelector withClass:className]) {
        NSShadow *shadow = [NSShadow new];
        
        if ([NUISettings hasProperty:textShadowColorSelector withClass:className]) {
            shadow.shadowColor = [NUISettings getColor:textShadowColorSelector withClass:className];
        }
        
        if ([NUISettings hasProperty:textShadowOffsetSelector withClass:className]) {
            shadow.shadowOffset = [NUISettings getSize:textShadowOffsetSelector withClass:className];
        }
        
        [titleTextAttributes setObject:shadow forKey:NSShadowAttributeName];
    }
#else
    if ([NUISettings hasProperty:textShadowColorSelector withClass:className]) {
        [titleTextAttributes setObject:[NUISettings getColor:textShadowColorSelector withClass:className] forKey:UITextAttributeTextShadowColor];
    }
    
    if ([NUISettings hasProperty:textShadowOffsetSelector withClass:className]) {
        [titleTextAttributes setObject:[NSValue valueWithUIOffset:[NUISettings getOffset:textShadowOffsetSelector withClass:className]] forKey:UITextAttributeTextShadowOffset];
    }
#endif
    
    return titleTextAttributes;
}

+ (NSDictionary*)titleTextAttributesForClass:(NSString*)className
{
    return [NUIUtilities titleTextAttributesForClass:className withSuffix:nil];
}

+ (NSString*)selector:(NSString*)selector withSuffix:(NSString*)suffix
{
    if (suffix) {
        return [NSString stringWithFormat:@"%@-%@", selector, suffix];
    }
    return selector;
}


@end
