//
//  NUIConverter.h
//  NUI
//
//  Created by Tom Benner on 11/22/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

@interface NUIConverter : NSObject

+ (BOOL)toBoolean:(id)value;
+ (float)toFloat:(id)value;
+ (CGSize)toSize:(NSString*)value;
+ (UIOffset)toOffset:(NSString*)value;
+ (UIEdgeInsets)toEdgeInsets:(NSString*)value;
+ (UITextBorderStyle)toBorderStyle:(NSString*)value;
+ (UIColor*)toColor:(NSString*)value;
+ (UIColor*)toColorFromImageName:(NSString*)value;
+ (UIImage*)toImageFromColorName:(NSString*)value;
+ (UIImage*)toImageFromImageName:(NSString*)value;

@end
