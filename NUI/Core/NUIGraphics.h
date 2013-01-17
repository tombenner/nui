//
//  NUIGraphics.h
//  NUIDemo
//
//  Created by Tom Benner on 11/25/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import "NUISettings.h"

@interface NUIGraphics : NSObject

+ (UIImage*)backButtonWithClass:(NSString*)className;
+ (CALayer*)roundedRectLayerWithClass:(NSString*)className;
+ (UIImage*)roundedRectImageWithClass:(NSString*)className;
+ (UIImage*)roundedRectImageWithClass:(NSString*)className layer:(CALayer*)layer;
+ (UIImage*)caLayerToUIImage:(CALayer*)layer;
+ (CALayer*)uiImageToCALayer:(UIImage*)image;
+ (CIImage*)tintCIImage:(CIImage*)image withColor:(CIColor*)color;
+ (UIImage*)colorImage:(UIColor*)color withFrame:(CGRect)frame;
+ (CAGradientLayer*)gradientLayerWithTop:(id)topColor bottom:(id)bottomColor frame:(CGRect)frame;
+ (UIImage*)gradientImageWithTop:(id)topColor bottom:(id)bottomColor frame:(CGRect)frame;

@end
