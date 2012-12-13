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
+ (BOOL)hasProperty:(NSString*)property withClass:(NSString*)class_name;
+ (id)get:(NSString*)property withClass:(NSString*)class_name;
+ (BOOL)getBoolean:(NSString*)property withClass:(NSString*)class_name;
+ (float)getFloat:(NSString*)property withClass:(NSString*)class_name;
+ (CGSize)getSize:(NSString*)property withClass:(NSString*)class_name;
+ (UIOffset)getOffset:(NSString*)property withClass:(NSString*)class_name;
+ (UIEdgeInsets)getEdgeInsets:(NSString*)property withClass:(NSString*)class_name;
+ (UITextBorderStyle)getBorderStyle:(NSString*)property withClass:(NSString*)class_name;
+ (UIColor*)getColor:(NSString*)property withClass:(NSString*)class_name;
+ (UIColor*)getColorFromImage:(NSString*)property withClass:(NSString*)class_name;
+ (UIImage*)getImage:(NSString*)property withClass:(NSString*)class_name;
+ (UIImage*)getImageFromColor:(NSString*)property withClass:(NSString*)class_name;

@end