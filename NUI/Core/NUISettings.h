//
//  NUISettings.h
//  NUI
//
//  Created by Tom Benner on 11/20/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NUIConverter.h"

@interface NUISettings : NSObject {
    NSMutableDictionary *settings;
}

@property(nonatomic,retain)NSMutableDictionary *settings;  

+ (void)loadSettings:(NSString*)name;
+ (BOOL)hasKey:(NSString*)key withClass:(NSString*)class_name;
+ (id)get:(NSString*)key withClass:(NSString*)class_name;
+ (BOOL)getBoolean:(NSString*)key withClass:(NSString*)class_name;
+ (float)getFloat:(NSString*)key withClass:(NSString*)class_name;
+ (CGSize)getSize:(NSString*)key withClass:(NSString*)class_name;
+ (UIOffset)getOffset:(NSString*)key withClass:(NSString*)class_name;
+ (UITextBorderStyle)getBorderStyle:(NSString*)key withClass:(NSString*)class_name;
+ (UIColor*)getColor:(NSString*)key withClass:(NSString*)class_name;
+ (UIColor*)getColorFromImage:(NSString*)key withClass:(NSString*)class_name;
+ (UIImage*)getImage:(NSString*)key withClass:(NSString*)class_name;
+ (UIImage*)getImageFromColor:(NSString*)key withClass:(NSString*)class_name;

@end