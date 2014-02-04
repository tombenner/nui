//
//  NUISettings.h
//  NUI
//
//  Created by Tom Benner on 11/20/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NUIConverter.h"
#import "NUIStyleParser.h"
#import "NUISwizzler.h"

@interface NUISettings : NSObject {
    NSString *autoUpdatePath;
    NSMutableDictionary *styles;
    NSString *stylesheetName;
    NSMutableArray *additionalStylesheetNames;
    NSString *stylesheetOrientation;
}

@property(nonatomic,retain)NSString *autoUpdatePath;
@property(nonatomic,retain)NSMutableDictionary *styles;
@property(nonatomic,retain)NSString *stylesheetName;
@property(nonatomic,retain)NSMutableArray *additionalStylesheetNames;
@property(nonatomic,retain)NSMutableArray *globalExclusions;
@property(nonatomic,retain)NSString* stylesheetOrientation;

+ (void)init;
+ (void)initWithStylesheet:(NSString*)name;
+ (void)appendStylesheet:(NSString*)name;
+ (void)loadStylesheetByPath:(NSString*)path;
+ (BOOL)reloadStylesheetsOnOrientationChange:(UIInterfaceOrientation)orientation;
+ (BOOL)autoUpdateIsEnabled;
+ (NSString*)autoUpdatePath;
+ (void)setAutoUpdatePath:(NSString*)path;
+ (BOOL)hasProperty:(NSString*)property withClass:(NSString*)className;
+ (BOOL)hasFontPropertiesWithClass:(NSString*)className;
+ (id)get:(NSString*)property withClass:(NSString*)className;
+ (BOOL)getBoolean:(NSString*)property withClass:(NSString*)className;
+ (float)getFloat:(NSString*)property withClass:(NSString*)className;
+ (CGSize)getSize:(NSString*)property withClass:(NSString*)className;
+ (UIOffset)getOffset:(NSString*)property withClass:(NSString*)className;
+ (UIEdgeInsets)getEdgeInsets:(NSString*)property withClass:(NSString*)className;
+ (UITextBorderStyle)getBorderStyle:(NSString*)property withClass:(NSString*)className;
+ (UITableViewCellSeparatorStyle)getSeparatorStyle:(NSString*)property withClass:(NSString*)className;
+ (UIFont*)getFontWithClass:(NSString*)className;
+ (UIFont*)getFontWithClass:(NSString*)className baseFont:(UIFont *)baseFont;
+ (UIColor*)getColor:(NSString*)property withClass:(NSString*)className;
+ (UIColor*)getColorFromImage:(NSString*)property withClass:(NSString*)className;
+ (UIImage*)getImage:(NSString*)property withClass:(NSString*)className;
+ (UIImage*)getImageFromColor:(NSString*)property withClass:(NSString*)className;
+ (kTextAlignment)getTextAlignment:(NSString*)property withClass:(NSString*)className;
+ (UIControlContentHorizontalAlignment)getControlContentHorizontalAlignment:(NSString*)property withClass:(NSString*)className;
+ (UIControlContentVerticalAlignment)getControlContentVerticalAlignment:(NSString*)property withClass:(NSString*)className;
+ (NSMutableArray*)getGlobalExclusions;
+ (void)setGlobalExclusions:(NSArray*)globalExclusions;
+ (NSString *)stylesheetOrientation;

@end

