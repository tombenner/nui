//
//  NUISettings.m
//  NUI
//
//  Created by Tom Benner on 11/20/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import "NUISettings.h"

@implementation NUISettings

@synthesize autoUpdatePath;
@synthesize styles;
static NUISettings *instance = nil;

+ (void)init
{
    [self initWithStylesheet:@"NUIStyle"];
}

+ (void)initWithStylesheet:(NSString*)name
{
    instance = [self getInstance];
    NUIStyleParser *parser = [[NUIStyleParser alloc] init];
    instance.styles = [parser getStylesFromFile:name];
}

+ (void)loadStylesheetByPath:(NSString*)path
{
    instance = [self getInstance];
    NUIStyleParser *parser = [[NUIStyleParser alloc] init];
    instance.styles = [parser getStylesFromPath:path];
}

+ (BOOL)autoUpdateIsEnabled
{
    instance = [self getInstance];
    return instance.autoUpdatePath != nil;
}

+ (NSString*)autoUpdatePath
{
    instance = [self getInstance];
    return instance.autoUpdatePath;
}

+ (void)setAutoUpdatePath:(NSString*)path
{
    instance = [self getInstance];
    instance.autoUpdatePath = path;
}

+ (BOOL)hasProperty:(NSString*)property withExplicitClass:(NSString*)className
{
    NSMutableDictionary *ruleSet = [instance.styles objectForKey:className];
    if (ruleSet == nil) {
        return NO;
    }
    if ([ruleSet objectForKey:property] == nil) {
        return NO;
    }
    return YES;
}

+ (BOOL)hasProperty:(NSString*)property withClass:(NSString*)className
{
    NSArray *classes = [self getClasses:className];
    for (NSString *inheritedClass in classes) {
        if ([self hasProperty:property withExplicitClass:inheritedClass]) {
            return YES;
        }
    }
    return NO;
}

+ (id)get:(NSString*)property withExplicitClass:(NSString*)className
{
    NSMutableDictionary *ruleSet = [instance.styles objectForKey:className];
    return [ruleSet objectForKey:property];
}

+ (id)get:(NSString*)property withClass:(NSString*)className
{
    NSArray *classes = [self getClasses:className];
    for (NSString *inheritedClass in classes) {
        if ([self hasProperty:property withExplicitClass:inheritedClass]) {
            return [self get:property withExplicitClass:inheritedClass];
        }
    }
    return nil;
}

+ (BOOL)getBoolean:(NSString*)property withClass:(NSString*)className
{   
    return [NUIConverter toBoolean:[self get:property withClass:className]];
}

+ (float)getFloat:(NSString*)property withClass:(NSString*)className
{   
    return [NUIConverter toFloat:[self get:property withClass:className]];
}

+ (CGSize)getSize:(NSString*)property withClass:(NSString*)className
{   
    return [NUIConverter toSize:[self get:property withClass:className]];
}

+ (UIOffset)getOffset:(NSString*)property withClass:(NSString*)className
{   
    return [NUIConverter toOffset:[self get:property withClass:className]];
}

+ (UIEdgeInsets)getEdgeInsets:(NSString*)property withClass:(NSString*)className
{
    return [NUIConverter toEdgeInsets:[self get:property withClass:className]];
}

+ (UITextBorderStyle)getBorderStyle:(NSString*)property withClass:(NSString*)className
{   
    return [NUIConverter toBorderStyle:[self get:property withClass:className]];
}

+ (UIColor*)getColor:(NSString*)property withClass:(NSString*)className
{   
    return [NUIConverter toColor:[self get:property withClass:className]];
}

+ (UIColor*)getColorFromImage:(NSString*)property withClass:(NSString*)className
{
    return [NUIConverter toColorFromImageName:[self get:property withClass:className]];
}

+ (UIImage*)getImageFromColor:(NSString*)property withClass:(NSString*)className
{
    return [NUIConverter toImageFromColorName:[self get:property withClass:className]];
}

+ (UIImage*)getImage:(NSString*)property withClass:(NSString*)className
{
    UIImage *image = [NUIConverter toImageFromImageName:[self get:property withClass:className]];
    NSString *insetsProperty = [NSString stringWithFormat:@"%@%@", property, @"-insets"];
    if ([self hasProperty:insetsProperty withClass:className]) {
        UIEdgeInsets insets = [self getEdgeInsets:insetsProperty withClass:className];
        image = [image resizableImageWithCapInsets:insets];
    }
    return image;
}

+ (kTextAlignment)getTextAlignment:(NSString*)property withClass:(NSString*)className
{
    return [NUIConverter toTextAlignment:[self get:property withClass:className]];
}

+ (UIControlContentHorizontalAlignment)getControlContentHorizontalAlignment:(NSString*)property withClass:(NSString*)className
{
    return [NUIConverter toControlContentHorizontalAlignment:[self get:property withClass:className]];
}

+ (UIControlContentVerticalAlignment)getControlContentVerticalAlignment:(NSString*)property withClass:(NSString*)className
{
    return [NUIConverter toControlContentVerticalAlignment:[self get:property withClass:className]];
}

+ (NSArray*)getClasses:(NSString*)className
{
    NSArray *classes = [[[className componentsSeparatedByString: @":"] reverseObjectEnumerator] allObjects];
    return classes;
}

+ (NUISettings*)getInstance
{
    @synchronized(self) {    
        if(instance == nil) {
            [[NUISwizzler new] swizzleAll];
            instance = [NUISettings new];
        }
    }
    
    return instance;
}

@end
