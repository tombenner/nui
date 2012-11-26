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

+ (void)loadSettings:(NSString*)name
{
    instance = [self getInstance];
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@"plist"];
    NSMutableDictionary *settings = [[NSMutableDictionary alloc]initWithContentsOfFile:path];
    instance.settings = settings;
}

+ (BOOL)hasKey:(NSString*)key
{
    instance = [self getInstance];
    return ([instance.settings objectForKey:key] != nil);
}

+ (BOOL)hasKey:(NSString*)key withExplicitClass:(NSString*)class_name
{   
    return [self hasKey:[self getCompositeKey:key withClass:class_name]];
}

+ (BOOL)hasKey:(NSString*)key withClass:(NSString*)class_name
{
    NSArray *classes = [self getClasses:class_name];
    for (NSString *inherited_class in classes) {
        if ([self hasKey:key withExplicitClass:inherited_class]) {
            return YES;
        }
    }
    return NO;
}

+ (id)get:(NSString*)key
{
    instance = [self getInstance];
    id value = [instance.settings objectForKey:key];
    if ([value isKindOfClass:[NSString class]] && [value hasPrefix:@"@"]) {
        value = [instance.settings objectForKey:value];
    }
    return value;
}

+ (id)getExplicit:(NSString*)key
{
    instance = [self getInstance];
    return [instance.settings objectForKey:key];
}

+ (id)get:(NSString*)key withExplicitClass:(NSString*)class_name
{   
    return [self get:[self getCompositeKey:key withClass:class_name]];
}

+ (id)get:(NSString*)key withClass:(NSString*)class_name
{
    NSArray *classes = [self getClasses:class_name];
    for (NSString *inherited_class in classes) {
        if ([self hasKey:key withExplicitClass:inherited_class]) {
            return [self get:key withExplicitClass:inherited_class];
        }
    }
    return nil;
}

+ (BOOL)getBoolean:(NSString*)key withClass:(NSString*)class_name
{   
    return [NUIConverter toBoolean:[self get:key withClass:class_name]];
}

+ (float)getFloat:(NSString*)key withClass:(NSString*)class_name
{   
    return [NUIConverter toFloat:[self get:key withClass:class_name]];
}

+ (CGSize)getSize:(NSString*)key withClass:(NSString*)class_name
{   
    return [NUIConverter toSize:[self get:key withClass:class_name]];
}

+ (UIOffset)getOffset:(NSString*)key withClass:(NSString*)class_name
{   
    return [NUIConverter toOffset:[self get:key withClass:class_name]];
}

+ (UITextBorderStyle)getBorderStyle:(NSString*)key withClass:(NSString*)class_name
{   
    return [NUIConverter toBorderStyle:[self get:key withClass:class_name]];
}

+ (UIColor*)getColor:(NSString*)key withClass:(NSString*)class_name
{   
    return [NUIConverter toColor:[self get:key withClass:class_name]];
}

+ (UIColor*)getColorFromImage:(NSString*)key withClass:(NSString*)class_name
{
    return [NUIConverter toColorFromImageName:[self get:key withClass:class_name]];
}

+ (UIImage*)getImageFromColor:(NSString*)key withClass:(NSString*)class_name
{
    return [NUIConverter toImageFromColorName:[self get:key withClass:class_name]];
}

+ (UIImage*)getImage:(NSString*)key withClass:(NSString*)class_name
{
    return [NUIConverter toImageFromImageName:[self get:key withClass:class_name]];
}

+ (NSString*)getCompositeKey:(NSString*)key withClass:(NSString*)class_name
{
    return [NSString stringWithFormat:@"%@%@", class_name, key];
}

+ (NSArray*)getClasses:(NSString*)class_name
{
    NSArray *classes = [[[class_name componentsSeparatedByString: @":"] reverseObjectEnumerator] allObjects];
    return classes;
}

+ (NUISettings*)getInstance
{
    @synchronized(self)    
    {    
        if(instance == nil)    
        {
            instance = [NUISettings new];
            [self loadSettings:@"NUISettings"];
        }    
    }
    
    return instance;
}

@end
