//
//  NUIConverter.m
//  NUI
//
//  Created by Tom Benner on 11/22/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import "NUIConverter.h"
#import "NUIConstants.h"

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

+ (UIEdgeInsets)toEdgeInsets:(NSString*)value
{
    NSArray *values = [value componentsSeparatedByCharactersInSet: [NSCharacterSet whitespaceCharacterSet]];
    values = [values filteredArrayUsingPredicate: [NSPredicate predicateWithFormat:@"SELF != ''"]];
    // edges will contain a CSS-like ordering of edges (top, right, bottom, left)
    NSArray *edges = nil;
    switch ([values count]) {
        case 1:
            edges = [NSArray arrayWithObjects:values[0], values[0], values[0], values[0], nil];
            break;
            
        case 2:
            edges = [NSArray arrayWithObjects:values[0], values[1], values[0], values[1], nil];
            break;
            
        case 3:
            edges = [NSArray arrayWithObjects:values[0], values[1], values[2], values[1], nil];
            break;
            
        case 4:
            edges = [NSArray arrayWithObjects:values[0], values[1], values[2], values[3], nil];
            break;
            
        default:
            edges = [NSArray arrayWithObjects:@0, @0, @0, @0, nil];
            break;
    }
    // UIEdgeInsetsMake's arguments have a different ordering: top, left, bottom, right
    return UIEdgeInsetsMake(
                            [edges[0] floatValue],
                            [edges[3] floatValue],
                            [edges[2] floatValue],
                            [edges[1] floatValue]
                            );
}

+ (UITextBorderStyle)toBorderStyle:(NSString*)value
{
    if ([value isEqualToString:kNUIClassNone]) {
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

+ (UITableViewCellSeparatorStyle)toSeparatorStyle:(NSString*)value
{
    if([value isEqualToString:kNUIClassNone]) {
        return UITableViewCellSeparatorStyleNone;
    } else if([value isEqualToString:@"single-line"]) {
        return UITableViewCellSeparatorStyleSingleLine;
    } else if([value isEqualToString:@"single-line-etched"]){
        return UITableViewCellSeparatorStyleSingleLineEtched;
    }
    return UITableViewCellSeparatorStyleNone;
}

+ (UIColor*)toColor:(NSString*)value
{
    // Look at UIColor selectors for a matching selector.
    // Name matches can take the form of 'colorname' (matching selectors like +redColor with 'red').
    SEL selector = NSSelectorFromString([NSString stringWithFormat:@"%@Color", value]);
    if (selector) {
        if ([[UIColor class] respondsToSelector:selector]) {
            // [[UIColor class] performSelector:selector] would be better here, but it causes
            // a warning: "PerformSelector may cause a leak because its selector is unknown"
            return objc_msgSend([UIColor class], selector);
        }
    }
    
    // Remove all whitespace.
    NSString *cString = [[[value componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]
                                 componentsJoinedByString:@""]
                                 uppercaseString];
    
    NSArray *hexStrings = [NUIConverter getCapturedStrings:cString
                                               withPattern:@"(?:0X|#)([0-9A-F]{6})"];
    NSArray *csStrings = [NUIConverter getCapturedStrings:cString
                                              withPattern:@"(RGB|RGBA|HSL|HSLA)\\((\\d{1,3}|[0-9.]+),(\\d{1,3}|[0-9.]+),(\\d{1,3}|[0-9.]+)(?:,(\\d{1,3}|[0-9.]+))?\\)"];
    
    UIColor *color = nil;
    
    if (hexStrings) {        
        unsigned int c;
        [[NSScanner scannerWithString:[hexStrings objectAtIndex:1]] scanHexInt:&c];
        color = [UIColor colorWithRed:(float)((c >> 16) & 0xFF) / 255.0f
                                green:(float)((c >>  8) & 0xFF) / 255.0f
                                 blue:(float)((c >>  0) & 0xFF) / 255.0f
                                alpha:1.0f];
    } else if (csStrings) {
        BOOL isRGB = [[csStrings objectAtIndex:1] hasPrefix:@"RGB"];
        BOOL isAlpha = [[csStrings objectAtIndex:1] hasSuffix:@"A"];
        
        // Color space with alpha specified but no alpha provided.
        if (isAlpha && [[csStrings objectAtIndex:5] isEqual:[NSNull null]])
            return nil;
    
        CGFloat a = isAlpha ?
                    [NUIConverter parseColorComponent:[csStrings objectAtIndex:5]] :
                    1.0f;
        
        if (isRGB) {
            color = [UIColor colorWithRed:[NUIConverter parseColorComponent:[csStrings objectAtIndex:2]]
                                    green:[NUIConverter parseColorComponent:[csStrings objectAtIndex:3]]
                                     blue:[NUIConverter parseColorComponent:[csStrings objectAtIndex:4]]
                                    alpha:a];
        } else {
            color = [UIColor colorWithHue:[NUIConverter parseColorComponent:[csStrings objectAtIndex:2]]
                               saturation:[NUIConverter parseColorComponent:[csStrings objectAtIndex:3]]
                               brightness:[NUIConverter parseColorComponent:[csStrings objectAtIndex:4]]
                                    alpha:a];
        }
    }
    
    return color;
}

/** Parses a color component in a color expression. Values containing
 *  periods (.) are treated as unscaled floats. Integer values
 *  are normalized by 255.
 */
+ (CGFloat)parseColorComponent:(NSString *)s {
    if ([s rangeOfString:@"."].location != NSNotFound) {
        return [s floatValue];
    } else {
        return [s floatValue] / 255.0f;
    }
}

+ (UIColor*)toColorFromImageName:(NSString*)value
{
    UIImage* image = [self toImageFromImageName:value];
    return [UIColor colorWithPatternImage:image];
}

+ (UIImage*)toImageFromColorName:(NSString*)value {
    UIColor* color = [self toColor:value];
    CGFloat alphaChannel;
    [color getRed:NULL green:NULL blue:NULL alpha:&alphaChannel];
    BOOL opaqueImage = (alphaChannel == 1.0);
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContextWithOptions(rect.size, opaqueImage, 0);
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

+ (kTextAlignment)toTextAlignment:(NSString*)value
{
    kTextAlignment alignment = kTextAlignmentLeft;
    
    if ([value isEqualToString:@"center"]) {
        alignment =   kTextAlignmentCenter;
    } else if ([value isEqualToString:@"right"]) {
        alignment =   kTextAlignmentRight;
    }
    
    return alignment;
}

+ (UIControlContentHorizontalAlignment)toControlContentHorizontalAlignment:(NSString*)value
{
    UIControlContentHorizontalAlignment alignment = UIControlContentHorizontalAlignmentLeft;
    
    if ([value isEqualToString:@"center"]) {
        alignment =  UIControlContentHorizontalAlignmentCenter;
    } else if ([value isEqualToString:@"right"]) {
        alignment =  UIControlContentHorizontalAlignmentRight;
    } else if ([value isEqualToString:@"fill"]) {
        alignment =  UIControlContentHorizontalAlignmentFill;
    }
    
    return alignment;
}

+ (UIControlContentVerticalAlignment)toControlContentVerticalAlignment:(NSString*)value
{
    UIControlContentVerticalAlignment alignment = UIControlContentVerticalAlignmentTop;
    
    if ([value isEqualToString:@"center"]) {
        alignment =  UIControlContentVerticalAlignmentCenter;
    } else if ([value isEqualToString:@"bottom"]) {
        alignment =  UIControlContentVerticalAlignmentBottom;
    } else if ([value isEqualToString:@"fill"]) {
        alignment =  UIControlContentVerticalAlignmentFill;
    }
    
    return alignment;
}

/** Matches the given content against the regular expression pattern, extracting
 *  any captured groups into an NSArray. Unmatched captured groups are represented
 *  by NSNull instances in the returned array.
 */
+ (NSArray *)getCapturedStrings:(NSString *)content withPattern:(NSString *)pattern {
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:nil];
    NSTextCheckingResult *result = [regex firstMatchInString:content options:0 range:NSMakeRange(0, [content length])];
    
    if (!result)
        return nil;
    
    NSMutableArray *capturedStrings = [NSMutableArray array];
    for (NSUInteger i = 0; i <= regex.numberOfCaptureGroups; i++) {
        NSRange capturedRange = [result rangeAtIndex:i];
        if (capturedRange.location != NSNotFound) {
            [capturedStrings insertObject:[content substringWithRange:capturedRange] atIndex:i];
        } else {
            [capturedStrings insertObject:[NSNull null] atIndex:i];
        }
    }
    return [NSArray arrayWithArray:capturedStrings];
}

@end
