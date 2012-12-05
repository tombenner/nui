//
//  NUIConverter.m
//  NUI
//
//  Created by Tom Benner on 11/22/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import "NUIConverter.h"

@implementation NUIConverter

+ (BOOL)toBoolean:(id)value
{
    if ([value isKindOfClass:[NSString class]]) {
        if ([value isEqualToString:@"true"]) {
            return YES;
        }
        if ([value isEqualToString:@"false"]) {
            return NO;
        }
    }
    return [value boolValue];
}

+ (float)toFloat:(id)value
{
    return [value floatValue];
}

+ (NSNumber*)toNumber:(id)value
{
    return [NSNumber numberWithFloat:[value floatValue]];
}

+ (CGSize)toSize:(NSString*)value
{
    NSArray *strings = [value componentsSeparatedByString: @","];
    return CGSizeMake(
      [self toFloat:[strings objectAtIndex:0]],
      [self toFloat:[strings objectAtIndex:1]]
    );
}

+ (UIOffset)toOffset:(NSString*)value
{
    CGSize size = [self toSize:value];
    return UIOffsetMake(size.width, size.height);
}

+ (UITextBorderStyle)toBorderStyle:(NSString*)value
{
    if ([value isEqualToString:@"none"]) {
        return UITextBorderStyleNone;
    } else if ([value isEqualToString:@"line"]) {
        return UITextBorderStyleLine;
    } else if ([value isEqualToString:@"bezel"]) {
        return UITextBorderStyleBezel;
    } else if ([value isEqualToString:@"rounded"]) {
        return UITextBorderStyleRoundedRect;
    }
    return UITextBorderStyleNone;
}

+ (UIColor*)toColor:(NSString*)value
{
    
    if ([value isEqualToString:@"clear"]) {
        return [UIColor clearColor];
    }
    
    NSString *cString = [[value stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be at least 6 characters
    if ([cString length] < 6) return nil;
    
    // Strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    
    // Strip # if it appears
    if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];
    
    if ([cString length] != 6) return nil;
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}

+ (UIColor*)toColorFromImageName:(NSString*)value
{
    UIImage* image = [self toImageFromImageName:value];
    return [UIColor colorWithPatternImage:image];
}

+ (UIImage*)toImageFromColorName:(NSString*)value {
    UIColor* color = [self toColor:value];
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    [color setFill];
    UIRectFill(rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage*)toImageFromImageName:(NSString*)value
{
    return [UIImage imageNamed:value];
}

@end
