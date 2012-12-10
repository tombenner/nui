//
//  NUIGraphics.m
//  NUIDemo
//
//  Created by Tom Benner on 11/25/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import "NUIGraphics.h"

@implementation NUIGraphics

+ (UIImage*)backButtonWithColor:(UIColor*)color
{
    CIColor *ciColor = [self uiColorToCIColor:color];
    CIImage *ciImage = [[CIImage alloc] initWithImage:[UIImage imageNamed:@"NUIBackButtonTemplate.png"]];
    CIContext *context = [CIContext contextWithOptions:nil];
    
    ciImage = [self tintCIImage:ciImage withColor:ciColor];
    UIImage *uiImage = [UIImage imageWithCGImage:[context createCGImage:ciImage fromRect:ciImage.extent]];
    uiImage = [uiImage resizableImageWithCapInsets:UIEdgeInsetsMake(0, 16, 0, 10)];
    
    return uiImage;
}

+ (UIImage*)barButtonWithColor:(UIColor*)color
{
    CIColor *ciColor = [self uiColorToCIColor:color];
    CIImage *ciImage = [[CIImage alloc] initWithImage:[UIImage imageNamed:@"NUIBarButtonTemplate.png"]];
    CIContext *context = [CIContext contextWithOptions:nil];
    
    ciImage = [self tintCIImage:ciImage withColor:ciColor];
    UIImage *uiImage = [UIImage imageWithCGImage:[context createCGImage:ciImage fromRect:ciImage.extent]];
    uiImage = [uiImage resizableImageWithCapInsets:UIEdgeInsetsMake(0, 10, 0, 10)];
    
    return uiImage;
}

+ (CIColor*)uiColorToCIColor:(UIColor*)color
{
    CGFloat red = 0.0, green = 0.0, blue = 0.0, alpha = 0.0;
    [color getRed:&red green:&green blue:&blue alpha:&alpha];
    return [CIColor colorWithRed:red green:green blue:blue];
}

+ (CIImage*)tintCIImage:(CIImage*)image withColor:(CIColor*)color
{
    CIFilter *monochromeFilter = [CIFilter filterWithName:@"CIColorMonochrome"];
    CIImage *baseImage = image;
    
    [monochromeFilter setValue:baseImage forKey:@"inputImage"];        
    [monochromeFilter setValue:[CIColor colorWithRed:0.75 green:0.75 blue:0.75] forKey:@"inputColor"];
    [monochromeFilter setValue:[NSNumber numberWithFloat:1.0] forKey:@"inputIntensity"];
    
    CIFilter *compositingFilter = [CIFilter filterWithName:@"CIMultiplyCompositing"];
    
    CIFilter *colorGenerator = [CIFilter filterWithName:@"CIConstantColorGenerator"];
    [colorGenerator setValue:color forKey:@"inputColor"];
    
    [compositingFilter setValue:[colorGenerator valueForKey:@"outputImage"] forKey:@"inputImage"];
    [compositingFilter setValue:[monochromeFilter valueForKey:@"outputImage"] forKey:@"inputBackgroundImage"];
    
    CIImage *outputImage = [compositingFilter valueForKey:@"outputImage"];
    
    return outputImage;
}

+ (UIImage*)colorImage:(UIColor*)color withFrame:(CGRect)frame
{
    UIGraphicsBeginImageContextWithOptions(frame.size, NO, 0);
    [color setFill];
    UIRectFill(frame);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (CAGradientLayer*)gradientLayerWithTop:(id)topColor withBottom:(id)bottomColor withFrame:(CGRect)frame
{
    CAGradientLayer *layer = [CAGradientLayer layer];
    layer.frame = frame;
    layer.colors = [NSArray arrayWithObjects:
                    (id)[topColor CGColor],
                    (id)[bottomColor CGColor], nil];
    layer.startPoint = CGPointMake(0.5f, 0.0f);
    layer.endPoint = CGPointMake(0.5f, 1.0f);
    return layer;
}

+ (UIImage*)gradientImageWithTop:(id)topColor withBottom:(id)bottomColor withFrame:(CGRect)frame
{
    CAGradientLayer *layer = [self gradientLayerWithTop:topColor withBottom:bottomColor withFrame:frame];
    UIGraphicsBeginImageContext([layer frame].size);
    
    [layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}

@end
