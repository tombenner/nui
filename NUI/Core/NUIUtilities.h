//
//  NUIUtilities.h
//  NUI
//
//  Created by Tom Benner on 11/22/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NUISettings.h"

@interface NUIUtilities : NSObject

+ (NSDictionary*)titleTextAttributesForClass:(NSString*)className;
+ (NSDictionary*)titleTextAttributesForClass:(NSString*)className withSuffix:(NSString*) suffix;

+ (NSString *)textAttributeFontKey;
+ (NSString *)textAttributeTextColorKey;

// Deprecated in iOS 7
+ (NSString *)textAttributeTextShadowColorKey;
+ (NSString *)textAttributeTextShadowOffsetKey;

// iOS 7 and later
+ (NSString *)textAttributeShadowKey;

@end
