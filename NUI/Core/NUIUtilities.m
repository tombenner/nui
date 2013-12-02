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

    NSString *fontNameSelector = [NUIUtilities selector:@"font-name" withSuffix:suffix];
    NSString *fontSizeSelector = [NUIUtilities selector:@"font-size" withSuffix:suffix];
    NSString *fontColorSelector = [NUIUtilities selector:@"font-color" withSuffix:suffix];
    NSString *textShadowColorSelector = [NUIUtilities selector:@"text-shadow-color" withSuffix:suffix];
    NSString *textShadowOffsetSelector = [NUIUtilities selector:@"text-shadow-offset" withSuffix:suffix];

    if ([NUISettings hasProperty:fontNameSelector withClass:className] || [NUISettings hasProperty:fontSizeSelector withClass:className]) {
        NSString *fontName = [NUISettings get:fontNameSelector withClass:className];
        float fontSize = [NUISettings getFloat:fontSizeSelector withClass:className];

        fontSize = fontSize ? fontSize : [UIFont systemFontSize];
        UIFont *font = fontName ? [UIFont fontWithName:fontName size:fontSize] : [UIFont systemFontOfSize:fontSize];

        [titleTextAttributes setObject:font forKey:[self textAttributeFontKey]];
    }

    if ([NUISettings hasProperty:fontColorSelector withClass:className]) {
        [titleTextAttributes setObject:[NUISettings getColor:fontColorSelector withClass:className] forKey:[self textAttributeTextColorKey]];
    }

    if ([self iOSVersionIsAtLeastiOS7]) {
        NSShadow *shadow = [[NSShadow alloc] init];
        BOOL containsShadow = NO;
        
        if ([NUISettings hasProperty:textShadowColorSelector withClass:className]) {
            containsShadow = YES;
            shadow.shadowColor = [NUISettings getColor:textShadowColorSelector withClass:className];
        }
        
        if ([NUISettings hasProperty:textShadowOffsetSelector withClass:className]) {
            containsShadow = YES;
            UIOffset offset = [NUISettings getOffset:textShadowOffsetSelector withClass:className];
            CGSize shadowOffset = CGSizeMake(offset.horizontal, offset.vertical);
            shadow.shadowOffset = shadowOffset;
        }
        
        if (containsShadow) {
            [titleTextAttributes setObject:shadow forKey:NSShadowAttributeName];
        }
    } else {
        if ([NUISettings hasProperty:textShadowColorSelector withClass:className]) {
            [titleTextAttributes setObject:[NUISettings getColor:textShadowColorSelector withClass:className] forKey:[self textAttributeTextShadowColorKey]];
        }
        
        if ([NUISettings hasProperty:textShadowOffsetSelector withClass:className]) {
            [titleTextAttributes setObject:[NSValue valueWithUIOffset:[NUISettings getOffset:textShadowOffsetSelector withClass:className]] forKey:[self textAttributeTextShadowOffsetKey]];
        }
    }


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

+ (NSString *)textAttributeFontKey
{
    if ([self iOSVersionIsAtLeastiOS7]) {
        return NSFontAttributeName;
    } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        return UITextAttributeFont;
#pragma clang diagnostic pop
    }
}

+ (NSString *)textAttributeTextColorKey
{
    if ([self iOSVersionIsAtLeastiOS7]) {
        return NSForegroundColorAttributeName;
    } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        return UITextAttributeTextColor;
#pragma clang diagnostic pop
    }
}

+ (NSString *)textAttributeTextShadowColorKey
{
    if ([self iOSVersionIsAtLeastiOS7]) {
        return nil;
    } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        return UITextAttributeTextShadowColor;
#pragma clang diagnostic pop
    }
}

+ (NSString *)textAttributeTextShadowOffsetKey
{
    if ([self iOSVersionIsAtLeastiOS7]) {
        return nil;
    } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        return UITextAttributeTextShadowOffset;
#pragma clang diagnostic pop
    }
}

+ (NSString *)textAttributeShadowKey
{
    if ([self iOSVersionIsAtLeastiOS7]) {
        return NSShadowAttributeName;
    } else {
        return nil;
    }
}

+ (BOOL)iOSVersionIsAtLeastiOS7
{
    return (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_6_1);
}

@end
