//
//  UIImage+ColorFromImage.m
//
//  Created by Paul Williamson on 30/05/2014.
//  Copyright (c) 2014 Paul Williamson. All rights reserved.
//

#import "UIImage+ColorFromImage.h"

@implementation UIImage (ColorFromImage)

- (UIColor *)sqf_colorFromImage
{
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    unsigned char *buffer = malloc(4);
    CGBitmapInfo bitmapInfo = kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big;
    CGContextRef context = CGBitmapContextCreate(buffer, 1, 1, 8, 4, colorSpace, bitmapInfo);
    CGColorSpaceRelease(colorSpace);
    CGContextDrawImage(context, CGRectMake(0.f, 0.f, 1.f, 1.f), [self CGImage]);
    CGContextRelease(context);
    
    CGFloat r = buffer[0] / 255.f;
    CGFloat g = buffer[1] / 255.f;
    CGFloat b = buffer[2] / 255.f;
    CGFloat a = buffer[3] / 255.f;
    
    return [UIColor colorWithRed:r green:g blue:b alpha:a];
}

@end
