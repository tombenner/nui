//
//  NUISettings.m
//  NUI
//
//  Created by Tom Benner on 11/20/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import "NUISettings.h"

@implementation NUISettings

@synthesize settings;
static NUISettings *instance = nil;

+ (void)init
{
    instance = [self getInstance];
}

+ (void)initWithStylesheet:(NSString *)name
{
    instance = [self getInstance];
    NUIStyleParser *parser = [[NUIStyleParser alloc] init];
    instance.settings = [parser getStylesFromFile:name];
}

+ (BOOL)hasProperty:(NSString*)property withExplicitClass:(NSString*)class_name
{
    instance = [self getInstance];
    NSMutableDictionary *ruleSet = [instance.settings objectForKey:class_name];
    if (ruleSet == nil) {
        return NO;
    }
    if ([ruleSet objectForKey:property] == nil) {
        return NO;
    }
    return YES;
}

+ (BOOL)hasProperty:(NSString*)property withClass:(NSString*)class_name
{
    NSArray *classes = [self getClasses:class_name];
    for (NSString *inherited_class in classes) {
        if ([self hasProperty:property withExplicitClass:inherited_class]) {
            return YES;
        }
    }
    return NO;
}

+ (id)get:(NSString*)property withExplicitClass:(NSString*)class_name
{
    instance = [self getInstance];
    NSMutableDictionary *ruleSet = [instance.settings objectForKey:class_name];
    return [ruleSet objectForKey:property];
}

+ (id)get:(NSString*)property withClass:(NSString*)class_name
{
    NSArray *classes = [self getClasses:class_name];
    for (NSString *inherited_class in classes) {
        if ([self hasProperty:property withExplicitClass:inherited_class]) {
            return [self get:property withExplicitClass:inherited_class];
        }
    }
    return nil;
}

+ (BOOL)getBoolean:(NSString*)property withClass:(NSString*)class_name
{   
    return [NUIConverter toBoolean:[self get:property withClass:class_name]];
}

+ (float)getFloat:(NSString*)property withClass:(NSString*)class_name
{   
    return [NUIConverter toFloat:[self get:property withClass:class_name]];
}

+ (CGSize)getSize:(NSString*)property withClass:(NSString*)class_name
{   
    return [NUIConverter toSize:[self get:property withClass:class_name]];
}

+ (UIOffset)getOffset:(NSString*)property withClass:(NSString*)class_name
{   
    return [NUIConverter toOffset:[self get:property withClass:class_name]];
}

+ (UIEdgeInsets)getEdgeInsets:(NSString*)property withClass:(NSString*)class_name
{
    return [NUIConverter toEdgeInsets:[self get:property withClass:class_name]];
}

+ (UITextBorderStyle)getBorderStyle:(NSString*)property withClass:(NSString*)class_name
{   
    return [NUIConverter toBorderStyle:[self get:property withClass:class_name]];
}

+ (UIColor*)getColor:(NSString*)property withClass:(NSString*)class_name
{   
    return [NUIConverter toColor:[self get:property withClass:class_name]];
}

+ (UIColor*)getColorFromImage:(NSString*)property withClass:(NSString*)class_name
{
    return [NUIConverter toColorFromImageName:[self get:property withClass:class_name]];
}

+ (UIImage*)getImageFromColor:(NSString*)property withClass:(NSString*)class_name
{
    return [NUIConverter toImageFromColorName:[self get:property withClass:class_name]];
}

+ (UIImage*)getImage:(NSString*)property withClass:(NSString*)class_name
{
    return [NUIConverter toImageFromImageName:[self get:property withClass:class_name]];
}

+ (NSArray*)getClasses:(NSString*)class_name
{
    NSArray *classes = [[[class_name componentsSeparatedByString: @":"] reverseObjectEnumerator] allObjects];
    return classes;
}

+ (NUISettings*)getInstance
{
    @synchronized(self) {    
        if(instance == nil) {
            [[NUISwizzler new] swizzleAll];
            instance = [NUISettings new];
            [self initWithStylesheet:@"NUIStyle"];
        }
    }
    
    return instance;
}

@end
