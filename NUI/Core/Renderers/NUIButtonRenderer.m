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
    // TODO: Look into why the button seems to be rendered twice (once in the native iOS style)
    if ([button.layer.sublayers count] == 3) {
        [button.layer.sublayers[0] setOpacity:0.0f];
        [button.layer.sublayers[1] setOpacity:0.0f];
    }
    
    // Set height
    if ([NUISettings hasProperty:@"height" withClass:class_name]) {
        CGRect frame = button.frame;
        CGSize originalSize = frame.size;
        frame.size = CGSizeMake(originalSize.width, [NUISettings getFloat:@"height" withClass:class_name]);
        button.frame = frame;
    }
    
    // Set padding
    if ([NUISettings hasProperty:@"padding" withClass:class_name]) {
        [button setTitleEdgeInsets:[NUISettings getEdgeInsets:@"padding" withClass:class_name]];
    }
    
    // Set background color
    if ([NUISettings hasProperty:@"background-color" withClass:class_name]) {
        [button setBackgroundColor:[NUISettings getColor:@"background-color" withClass:class_name]];
    }
    
    // Set background gradient
    if ([NUISettings hasProperty:@"background-color-top" withClass:class_name]) {
        CAGradientLayer *gradient = [NUIGraphics
                                     gradientLayerWithTop:[NUISettings getColor:@"background-color-top" withClass:class_name] 
                                     withBottom:[NUISettings getColor:@"background-color-bottom" withClass:class_name]
                                     withFrame:button.bounds];
        int index = [button.layer.sublayers count] == 1 ? 0 : 1;
        [button.layer insertSublayer:gradient atIndex:index];
    }
    
    // Set background image
    if ([NUISettings hasProperty:@"background-image" withClass:class_name]) {
        [button setBackgroundImage:[NUISettings getImage:@"background-image" withClass:class_name] forState:UIControlStateNormal];
    }
    if ([NUISettings hasProperty:@"background-image-highlighted" withClass:class_name]) {
        [button setBackgroundImage:[NUISettings getImage:@"background-image-highlighted" withClass:class_name] forState:UIControlStateHighlighted];
    }
    
    [NUIRenderer renderLabel:button.titleLabel withClass:class_name];
    
    // Set font color
    if ([NUISettings hasProperty:@"font-color" withClass:class_name]) {
        [button setTitleColor:[NUISettings getColor:@"font-color" withClass:class_name] forState:UIControlStateNormal];
    }
    if ([NUISettings hasProperty:@"font-color-highlighted" withClass:class_name]) {
        [button setTitleColor:[NUISettings getColor:@"font-color-highlighted" withClass:class_name] forState:UIControlStateHighlighted];
    }
    
    CALayer *layer = [button layer];
    
    // Set corners
    if ([NUISettings hasProperty:@"corner-radius" withClass:class_name]) {
        [layer setMasksToBounds:YES];
        [layer setCornerRadius:[NUISettings getFloat:@"corner-radius" withClass:class_name]];
    }
    
    // Set border color
    if ([NUISettings hasProperty:@"border-color" withClass:class_name]) {
        [layer setBorderColor:[[NUISettings getColor:@"border-color" withClass:class_name] CGColor]];
    }
    
    // Set border width
    if ([NUISettings hasProperty:@"border-width" withClass:class_name]) {
        [layer setBorderWidth:[NUISettings getFloat:@"border-width" withClass:class_name]];
    }
}

@end
