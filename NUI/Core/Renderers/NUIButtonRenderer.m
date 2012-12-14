//
//  NUIButtonRenderer.m
//  NUIDemo
//
//  Created by Tom Benner on 11/24/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import "NUIButtonRenderer.h"

@implementation NUIButtonRenderer

+ (void)render:(UIButton*)button withClass:(NSString*)className
{
    // TODO: Look into why the button seems to be rendered twice (once in the native iOS style)
    if ([button.layer.sublayers count] == 3) {
        [button.layer.sublayers[0] setOpacity:0.0f];
        [button.layer.sublayers[1] setOpacity:0.0f];
    }
    
    // Set height
    if ([NUISettings hasProperty:@"height" withClass:className]) {
        CGRect frame = button.frame;
        CGSize originalSize = frame.size;
        frame.size = CGSizeMake(originalSize.width, [NUISettings getFloat:@"height" withClass:className]);
        button.frame = frame;
    }
    
    // Set padding
    if ([NUISettings hasProperty:@"padding" withClass:className]) {
        [button setTitleEdgeInsets:[NUISettings getEdgeInsets:@"padding" withClass:className]];
    }
    
    // Set background color
    if ([NUISettings hasProperty:@"background-color" withClass:className]) {
        [button setBackgroundColor:[NUISettings getColor:@"background-color" withClass:className]];
    }
    
    // Set background gradient
    if ([NUISettings hasProperty:@"background-color-top" withClass:className]) {
        CAGradientLayer *gradient = [NUIGraphics
                                     gradientLayerWithTop:[NUISettings getColor:@"background-color-top" withClass:className] 
                                     bottom:[NUISettings getColor:@"background-color-bottom" withClass:className]
                                     frame:button.bounds];
        int index = [button.layer.sublayers count] == 1 ? 0 : 1;
        [button.layer insertSublayer:gradient atIndex:index];
    }
    
    // Set background image
    if ([NUISettings hasProperty:@"background-image" withClass:className]) {
        [button setBackgroundImage:[NUISettings getImage:@"background-image" withClass:className] forState:UIControlStateNormal];
    }
    if ([NUISettings hasProperty:@"background-image-highlighted" withClass:className]) {
        [button setBackgroundImage:[NUISettings getImage:@"background-image-highlighted" withClass:className] forState:UIControlStateHighlighted];
    }
    
    [NUIRenderer renderLabel:button.titleLabel withClass:className];
    
    // Set font color
    if ([NUISettings hasProperty:@"font-color" withClass:className]) {
        [button setTitleColor:[NUISettings getColor:@"font-color" withClass:className] forState:UIControlStateNormal];
    }
    if ([NUISettings hasProperty:@"font-color-highlighted" withClass:className]) {
        [button setTitleColor:[NUISettings getColor:@"font-color-highlighted" withClass:className] forState:UIControlStateHighlighted];
    }
    
    CALayer *layer = [button layer];
    
    // Set corners
    if ([NUISettings hasProperty:@"corner-radius" withClass:className]) {
        [layer setMasksToBounds:YES];
        [layer setCornerRadius:[NUISettings getFloat:@"corner-radius" withClass:className]];
    }
    
    // Set border color
    if ([NUISettings hasProperty:@"border-color" withClass:className]) {
        [layer setBorderColor:[[NUISettings getColor:@"border-color" withClass:className] CGColor]];
    }
    
    // Set border width
    if ([NUISettings hasProperty:@"border-width" withClass:className]) {
        [layer setBorderWidth:[NUISettings getFloat:@"border-width" withClass:className]];
    }
}

@end
