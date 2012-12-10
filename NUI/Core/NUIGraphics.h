//
//  NUIGraphics.h
//  NUIDemo
//
//  Created by Tom Benner on 11/25/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

@interface NUIGraphics : NSObject

+ (UIImage*)backButtonWithColor:(UIColor*)color;
+ (UIImage*)barButtonWithColor:(UIColor*)color;
+ (CIImage*)tintCIImage:(CIImage*)image withColor:(CIColor*)color;
+ (UIImage*)colorImage:(UIColor*)color withFrame:(CGRect)frame;
+ (CAGradientLayer*)gradientLayerWithTop:(id)topColor withBottom:(id)bottomColor withFrame:(CGRect)frame;
+ (UIImage*)gradientImageWithTop:(id)topColor withBottom:(id)bottomColor withFrame:(CGRect)frame;

@end
