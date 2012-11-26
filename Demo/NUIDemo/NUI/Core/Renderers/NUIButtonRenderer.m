//
//  NUIButtonRenderer.m
//  NUIDemo
//
//  Created by Tom Benner on 11/24/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import "NUIButtonRenderer.h"

@implementation NUIButtonRenderer

+ (void)render:(UIButton*)button withClass:(NSString*)class_name
{
    // Set height
    if ([NUISettings hasKey:@"Height" withClass:class_name]) {
        CGRect frame = button.frame;
        CGSize originalSize = frame.size;
        frame.size = CGSizeMake(originalSize.width, [NUISettings getFloat:@"Height" withClass:class_name]);
        button.frame = frame;
    }
    
    // Set background color
    if ([NUISettings hasKey:@"BackgroundColor" withClass:class_name]) {
        [button setBackgroundColor:[NUISettings getColor:@"BackgroundColor" withClass:class_name]];
    }
    
    // Set background gradient
    if ([NUISettings hasKey:@"BackgroundColorTop" withClass:class_name]) {
        CAGradientLayer *gradient = [NUIGraphics
                                     gradientLayerWithTop:[NUISettings getColor:@"BackgroundColorTop" withClass:class_name] 
                                     withBottom:[NUISettings getColor:@"BackgroundColorBottom" withClass:class_name]
                                     withFrame:button.bounds];
        [button.layer insertSublayer:gradient atIndex:0];
    }
    
    // Set background image
    if ([NUISettings hasKey:@"BackgroundImage" withClass:class_name]) {
        [button setBackgroundImage:[NUISettings getImage:@"BackgroundImage" withClass:class_name] forState:UIControlStateNormal];
    }
    if ([NUISettings hasKey:@"BackgroundImageHighlighted" withClass:class_name]) {
        [button setBackgroundImage:[NUISettings getImage:@"BackgroundImageHighlighted" withClass:class_name] forState:UIControlStateHighlighted];
    }
    
    [NUIRenderer renderLabel:button.titleLabel withClass:class_name];
    
    // Set font color
    if ([NUISettings hasKey:@"FontColor" withClass:class_name]) {
        [button setTitleColor:[NUISettings getColor:@"FontColor" withClass:class_name] forState:UIControlStateNormal];
    }
    if ([NUISettings hasKey:@"FontColorHighlighted" withClass:class_name]) {
        [button setTitleColor:[NUISettings getColor:@"FontColorHighlighted" withClass:class_name] forState:UIControlStateHighlighted];
    }
    
    CALayer *layer = [button layer];
    
    // Set corners
    if ([NUISettings hasKey:@"CornerRadius" withClass:class_name]) {
        [layer setMasksToBounds:YES];
        [layer setCornerRadius:[NUISettings getFloat:@"CornerRadius" withClass:class_name]];
    }
    
    // Set border color
    if ([NUISettings hasKey:@"BorderColor" withClass:class_name]) {
        [layer setBorderColor:[[NUISettings getColor:@"BorderColor" withClass:class_name] CGColor]];
    }
    
    // Set border width
    if ([NUISettings hasKey:@"BorderWidth" withClass:class_name]) {
        [layer setBorderWidth:[NUISettings getFloat:@"BorderWidth" withClass:class_name]];
    }
}

@end
