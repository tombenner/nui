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
    NSMutableDictionary *settings;
}

@property(nonatomic,retain)NSMutableDictionary *settings;  

+ (void)init;
+ (void)initWithStylesheet:(NSString*)name;
+ (BOOL)hasProperty:(NSString*)property withClass:(NSString*)className;
+ (id)get:(NSString*)property withClass:(NSString*)className;
+ (BOOL)getBoolean:(NSString*)property withClass:(NSString*)className;
+ (float)getFloat:(NSString*)property withClass:(NSString*)className;
+ (CGSize)getSize:(NSString*)property withClass:(NSString*)className;
+ (UIOffset)getOffset:(NSString*)property withClass:(NSString*)className;
+ (UIEdgeInsets)getEdgeInsets:(NSString*)property withClass:(NSString*)className;
+ (UITextBorderStyle)getBorderStyle:(NSString*)property withClass:(NSString*)className;
+ (UIColor*)getColor:(NSString*)property withClass:(NSString*)className;
+ (UIColor*)getColorFromImage:(NSString*)property withClass:(NSString*)className;
+ (UIImage*)getImage:(NSString*)property withClass:(NSString*)className;
+ (UIImage*)getImageFromColor:(NSString*)property withClass:(NSString*)className;

@end