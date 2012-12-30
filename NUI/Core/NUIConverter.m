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

+ (UIEdgeInsets)toEdgeInsets:(NSString*)value
{
    NSArray *values = [value componentsSeparatedByCharactersInSet: [NSCharacterSet whitespaceCharacterSet]];
    values = [values filteredArrayUsingPredicate: [NSPredicate predicateWithFormat:@"SELF != ''"]];
    // edges will contain a CSS-like ordering of edges (top, right, bottom, left)
    NSMutableArray *edges = [[NSMutableArray alloc] initWithCapacity:4];
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
            edges = [NSArray arrayWithObjects:0, 0, 0, 0, nil];
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
    
    NSString *cString = [[value stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // Try to match four color expressions:
    //   #hhhhhh,
    //   0xhhhhhh,
    //   RGB(ddd,ddd,ddd),
    //   RGBA(ddd,ddd,ddd,ddd).
    
    NSArray *hexStrings = [NUIConverter getCapturedStrings:cString withPattern:@"(?:0x|#)([0-9A-F]{6})"];
    NSArray *rgbaStrings = [NUIConverter getCapturedStrings:cString withPattern:@"(RGB|RGBA)\\((\\d{1,3}),(\\d{1,3}),(\\d{1,3})(?:,(\\d{1,3}))?\\)"];
    
    unsigned int r, g, b, a;
    
    if (hexStrings) {        
        unsigned int c;
        [[NSScanner scannerWithString:[hexStrings objectAtIndex:1]] scanHexInt:&c];
        r = (c >> 16) & 0xFF;
        g = (c >>  8) & 0xFF;
        b = (c >>  0) & 0xFF;
        a = 255;
    } else if (rgbaStrings) {
        BOOL isRGBA = [[rgbaStrings objectAtIndex:1] isEqualToString:@"RGBA"];
        
        // RGBA color type specified but no alpha provided.
        if (isRGBA && [[rgbaStrings objectAtIndex:5] isEqual:[NSNull null]])
            return nil;
        
        r = [[rgbaStrings objectAtIndex:2] intValue];
        g = [[rgbaStrings objectAtIndex:3] intValue];
        b = [[rgbaStrings objectAtIndex:4] intValue];
        a = isRGBA ? [[rgbaStrings objectAtIndex:5] intValue] : 255;
    } else {
        return nil;
    }
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:((float) a / 255.0f)];
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

+ (UITextAlignment)toTextAlignment:(NSString*)value
{
    UITextAlignment textAlignment = UITextAlignmentLeft;
    
    if ([value isEqualToString:@"center"]) {
        textAlignment =  UITextAlignmentCenter;
    } else if ([value isEqualToString:@"right"]) {
        textAlignment =  UITextAlignmentRight;
    }
    
    return textAlignment;
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
