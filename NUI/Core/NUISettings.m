//
//  NUISettings.m
//  NUI
//
//  Created by Tom Benner on 11/20/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import "NUISettings.h"
#import "NUIAppearance.h"

@implementation NUISettings

@synthesize autoUpdatePath;
@synthesize styles;
@synthesize stylesheetName, additionalStylesheetNames;
@synthesize stylesheetOrientation;

static NUISettings *instance = nil;

+ (void)init
{
    [self initWithStylesheet:@"NUIStyle"];
}

+ (void)initWithStylesheet:(NSString*)name
{
    instance = [self getInstance];
    instance.stylesheetName = name;
    UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
    instance.stylesheetOrientation = [self stylesheetOrientationFromInterfaceOrientation:orientation];
    NUIStyleParser *parser = [[NUIStyleParser alloc] init];
    instance.styles = [parser getStylesFromFile:name];
    
    [NUIAppearance init];
}

+ (void)appendStylesheet:(NSString *)name
{
    instance = [self getInstance];
    
    if (!instance.additionalStylesheetNames)
        instance.additionalStylesheetNames = [NSMutableArray array];
    
    [instance.additionalStylesheetNames addObject:name];
    NUIStyleParser *parser = [[NUIStyleParser alloc] init];
    [instance appendStyles:[parser getStylesFromFile:name]];
}

- (void)appendStyles:(NSMutableDictionary*)newStyles
{
    for (NSString* key in newStyles) {
        id style = newStyles[key];
        if (![styles objectForKey:key]) {
            styles[key] = style;
            continue;
        }
    
        for (NSString *propertyKey in style) {
            id propertyValue = style[propertyKey];
            styles[key][propertyKey] = propertyValue;
        }
    }
}

+ (void)loadStylesheetByPath:(NSString*)path
{
    instance = [self getInstance];
    NUIStyleParser *parser = [[NUIStyleParser alloc] init];
    instance.styles = [parser getStylesFromPath:path];
}

+ (void)reloadStylesheets
{
    NUIStyleParser *parser = [[NUIStyleParser alloc] init];
    instance.styles = [parser getStylesFromFile:instance.stylesheetName];
    
    if (instance.additionalStylesheetNames) {
        for (NSString *name in instance.additionalStylesheetNames) {
            [instance appendStyles:[parser getStylesFromFile:name]];
        }
    }
}

+ (BOOL)reloadStylesheetsOnOrientationChange:(UIInterfaceOrientation)orientation
{
    instance = [self getInstance];
    NSString *newStylesheetOrientation = [self stylesheetOrientationFromInterfaceOrientation:orientation];
    
    if ([newStylesheetOrientation isEqualToString:instance.stylesheetOrientation])
        return NO;
    
    instance.stylesheetOrientation = newStylesheetOrientation;
    [self reloadStylesheets];
    return YES;
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

+ (BOOL)hasFontPropertiesWithClass:(NSString*)className
{
    return [self hasProperty:@"font-name" withClass:className] ||
           [self hasProperty:@"font-size" withClass:className];
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

+ (UITableViewCellSeparatorStyle)getSeparatorStyle:(NSString*)property withClass:(NSString*)className
{
    return [NUIConverter toSeparatorStyle:[self get:property withClass:className]];
}

+ (UIFont*)getFontWithClass:(NSString*)className
{
    return [self getFontWithClass:className baseFont:nil];
}

+ (UIFont*)getFontWithClass:(NSString*)className baseFont:(UIFont *)baseFont
{
    NSString *propertyName;
    CGFloat fontSize;
    UIFont *font = nil;
    
    propertyName = @"font-size";
    
    if ([self hasProperty:propertyName withClass:className]) {
        fontSize = [self getFloat:@"font-size" withClass:className];
    } else {
        fontSize = baseFont ? baseFont.pointSize : [UIFont systemFontSize];
    }
    
    propertyName = @"font-name";
    
    if ([self hasProperty:propertyName withClass:className]) {
        NSString *fontName = [self get:propertyName withClass:className];
        
        if ([fontName isEqualToString:@"system"]) {
            font = [UIFont systemFontOfSize:fontSize];
        } else if ([fontName isEqualToString:@"boldSystem"]) {
            font = [UIFont boldSystemFontOfSize:fontSize];
        } else if ([fontName isEqualToString:@"italicSystem"]) {
            font = [UIFont italicSystemFontOfSize:fontSize];
        } else {
            font = [UIFont fontWithName:fontName size:fontSize];
        }
    } else {
        font = baseFont ? [baseFont fontWithSize:fontSize] : [UIFont systemFontOfSize:fontSize];
    }
    
    return font;
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


+ (void)setGlobalExclusions:(NSArray *)array
{
    instance = [self getInstance];
    instance.globalExclusions = [array mutableCopy];
}

+ (NSMutableArray*)getGlobalExclusions
{
    instance = [self getInstance];
    return instance.globalExclusions;
}

+ (NSString *)stylesheetOrientation
{
    instance = [self getInstance];
    return instance.stylesheetOrientation;
}

+ (NSString *)stylesheetOrientationFromInterfaceOrientation:(UIInterfaceOrientation)orientation
{
    return UIInterfaceOrientationIsLandscape(orientation) ? @"landscape" : @"portrait";
}

+ (NUISettings*)getInstance
{
    @synchronized(self) {
        if (instance == nil) {
            [[NUISwizzler new] swizzleAll];
            instance = [NUISettings new];
        }
    }
    
    return instance;
}

@end
