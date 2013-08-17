//
//  NUIConverter.h
//  NUI
//
//  Created by Tom Benner on 11/22/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import <objc/message.h>

#ifdef __IPHONE_6_0 // iOS6 and later
#   define kTextAlignment           NSTextAlignment
#   define kTextAlignmentCenter     NSTextAlignmentCenter
#   define kTextAlignmentLeft       NSTextAlignmentLeft
#   define kTextAlignmentRight      NSTextAlignmentRight
#else // older versions
#   define kTextAlignment           UITextAlignment
#   define kTextAlignmentCenter     UITextAlignmentCenter
#   define kTextAlignmentLeft       UITextAlignmentLeft
#   define kTextAlignmentRight      UITextAlignmentRight
#endif

@interface NUIConverter : NSObject

+ (BOOL)toBoolean:(id)value;
+ (float)toFloat:(id)value;
+ (CGSize)toSize:(NSString*)value;
+ (UIOffset)toOffset:(NSString*)value;
+ (UIEdgeInsets)toEdgeInsets:(NSString*)value;
+ (UITextBorderStyle)toBorderStyle:(NSString*)value;
+ (UITableViewCellSeparatorStyle)toSeparatorStyle:(NSString*)value;
+ (UIColor*)toColor:(NSString*)value;
+ (UIColor*)toColorFromImageName:(NSString*)value;
+ (UIImage*)toImageFromColorName:(NSString*)value;
+ (UIImage*)toImageFromImageName:(NSString*)value;
+ (kTextAlignment)toTextAlignment:(NSString*)value;
+ (UIControlContentHorizontalAlignment)toControlContentHorizontalAlignment:(NSString*)value;
+ (UIControlContentVerticalAlignment)toControlContentVerticalAlignment:(NSString*)value;
@end
