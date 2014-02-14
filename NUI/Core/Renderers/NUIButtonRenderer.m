//
//  NUIButtonRenderer.m
//  NUIDemo
//
//  Created by Tom Benner on 11/24/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import "NUIButtonRenderer.h"
#import "NUIViewRenderer.h"

@implementation NUIButtonRenderer

+ (void)render:(UIButton*)button withClass:(NSString*)className
{
    [NUIViewRenderer renderSize:button withClass:className];
    // UIButtonTypeRoundedRect's first two sublayers contain its background and border, which
    // need to be hidden for NUI's rendering to be displayed correctly. Ideally we would switch
    // over to a UIButtonTypeCustom, but this appears to be impossible.
    if (button.buttonType == UIButtonTypeRoundedRect) {
        if ([button.layer.sublayers count] > 2) {
            [button.layer.sublayers[0] setOpacity:0.0f];
            [button.layer.sublayers[1] setOpacity:0.0f];
        }
    }

    // Set padding
    if ([NUISettings hasProperty:@"padding" withClass:className]) {
        [button setTitleEdgeInsets:[NUISettings getEdgeInsets:@"padding" withClass:className]];
    }
    
    // Set background color
    if ([NUISettings hasProperty:@"background-color" withClass:className]) {
        [button setBackgroundImage:[NUISettings getImageFromColor:@"background-color" withClass:className] forState:UIControlStateNormal];
    }
    if ([NUISettings hasProperty:@"background-color-highlighted" withClass:className]) {
        [button setBackgroundImage:[NUISettings getImageFromColor:@"background-color-highlighted" withClass:className] forState:UIControlStateHighlighted];
    }
    if ([NUISettings hasProperty:@"background-color-selected" withClass:className]) {
        [button setBackgroundImage:[NUISettings getImageFromColor:@"background-color-selected" withClass:className] forState:UIControlStateSelected];
    }
    if ([NUISettings hasProperty:@"background-color-selected-highlighted" withClass:className]) {
        [button setBackgroundImage:[NUISettings getImageFromColor:@"background-color-selected-highlighted" withClass:className] forState:UIControlStateSelected|UIControlStateHighlighted];
    }
    if ([NUISettings hasProperty:@"background-color-selected-disabled" withClass:className]) {
        [button setBackgroundImage:[NUISettings getImageFromColor:@"background-color-selected-disabled" withClass:className] forState:UIControlStateSelected|UIControlStateDisabled];
    }
    if ([NUISettings hasProperty:@"background-color-disabled" withClass:className]) {
        [button setBackgroundImage:[NUISettings getImageFromColor:@"background-color-disabled" withClass:className] forState:UIControlStateDisabled];
    }
    
    // Set background gradient
    if ([NUISettings hasProperty:@"background-color-top" withClass:className]) {
        CAGradientLayer *gradientLayer = [NUIGraphics
                                          gradientLayerWithTop:[NUISettings getColor:@"background-color-top" withClass:className]
                                          bottom:[NUISettings getColor:@"background-color-bottom" withClass:className]
                                          frame:button.bounds];
        int backgroundLayerIndex = [button.layer.sublayers count] == 1 ? 0 : 1;
        if (button.isNUIApplied) {
            [[button.layer.sublayers objectAtIndex:backgroundLayerIndex] removeFromSuperlayer];
        }
        [button.layer insertSublayer:gradientLayer atIndex:backgroundLayerIndex];
    }
    
    // Set background image
    if ([NUISettings hasProperty:@"background-image" withClass:className]) {
        [button setBackgroundImage:[NUISettings getImage:@"background-image" withClass:className] forState:UIControlStateNormal];
    }
    if ([NUISettings hasProperty:@"background-image-highlighted" withClass:className]) {
        [button setBackgroundImage:[NUISettings getImage:@"background-image-highlighted" withClass:className] forState:UIControlStateHighlighted];
    }
    if ([NUISettings hasProperty:@"background-image-selected" withClass:className]) {
        [button setBackgroundImage:[NUISettings getImage:@"background-image-selected" withClass:className] forState:UIControlStateSelected];
    }
    if ([NUISettings hasProperty:@"background-image-selected-highlighted" withClass:className]) {
        [button setBackgroundImage:[NUISettings getImage:@"background-image-selected-highlighted" withClass:className] forState:UIControlStateSelected|UIControlStateHighlighted];
    }
    if ([NUISettings hasProperty:@"background-image-selected-disabled" withClass:className]) {
        [button setBackgroundImage:[NUISettings getImage:@"background-image-selected-disabled" withClass:className] forState:UIControlStateSelected|UIControlStateDisabled];
    }
    if ([NUISettings hasProperty:@"background-image-disabled" withClass:className]) {
        [button setBackgroundImage:[NUISettings getImage:@"background-image-disabled" withClass:className] forState:UIControlStateDisabled];
    }
    
    // Set image
    if ([NUISettings hasProperty:@"image" withClass:className]) {
        [button setImage:[NUISettings getImage:@"image" withClass:className] forState:UIControlStateNormal];
    }
    if ([NUISettings hasProperty:@"image-highlighted" withClass:className]) {
        [button setImage:[NUISettings getImage:@"image-highlighted" withClass:className] forState:UIControlStateHighlighted];
    }
    if ([NUISettings hasProperty:@"image-selected" withClass:className]) {
        [button setImage:[NUISettings getImage:@"image-selected" withClass:className] forState:UIControlStateSelected];
    }
    if ([NUISettings hasProperty:@"image-selected-highlighted" withClass:className]) {
        [button setImage:[NUISettings getImage:@"image-selected-highlighted" withClass:className] forState:UIControlStateSelected|UIControlStateHighlighted];
    }
    if ([NUISettings hasProperty:@"image-selected-disabled" withClass:className]) {
        [button setImage:[NUISettings getImage:@"image-selected-disabled" withClass:className] forState:UIControlStateSelected|UIControlStateDisabled];
    }
    if ([NUISettings hasProperty:@"image-disabled" withClass:className]) {
        [button setImage:[NUISettings getImage:@"image-disabled" withClass:className] forState:UIControlStateDisabled];
    }
    
    [NUILabelRenderer renderText:button.titleLabel withClass:className];
    
    // Set text align
    if ([NUISettings hasProperty:@"text-align" withClass:className]) {
        [button setContentHorizontalAlignment:[NUISettings getControlContentHorizontalAlignment:@"text-align" withClass:className]];
    }
    
    // Set font color
    if ([NUISettings hasProperty:@"font-color" withClass:className]) {
        [button setTitleColor:[NUISettings getColor:@"font-color" withClass:className] forState:UIControlStateNormal];
    }
    if ([NUISettings hasProperty:@"font-color-highlighted" withClass:className]) {
        [button setTitleColor:[NUISettings getColor:@"font-color-highlighted" withClass:className] forState:UIControlStateHighlighted];
    }
    if ([NUISettings hasProperty:@"font-color-selected" withClass:className]) {
        [button setTitleColor:[NUISettings getColor:@"font-color-selected" withClass:className] forState:UIControlStateSelected];
    }
    if ([NUISettings hasProperty:@"font-color-selected-highlighted" withClass:className]) {
        [button setTitleColor:[NUISettings getColor:@"font-color-selected-highlighted" withClass:className] forState:UIControlStateSelected|UIControlStateHighlighted];
    }
    if ([NUISettings hasProperty:@"font-color-selected-disabled" withClass:className]) {
        [button setTitleColor:[NUISettings getColor:@"font-color-selected-disabled" withClass:className] forState:UIControlStateSelected|UIControlStateDisabled];
    }
    if ([NUISettings hasProperty:@"font-color-disabled" withClass:className]) {
        [button setTitleColor:[NUISettings getColor:@"font-color-disabled" withClass:className] forState:UIControlStateDisabled];
    }
    
    // Set text shadow color
    if ([NUISettings hasProperty:@"text-shadow-color" withClass:className]) {
        [button setTitleShadowColor:[NUISettings getColor:@"text-shadow-color" withClass:className] forState:UIControlStateNormal];
    }
    if ([NUISettings hasProperty:@"text-shadow-color-highlighted" withClass:className]) {
        [button setTitleShadowColor:[NUISettings getColor:@"text-shadow-color-highlighted" withClass:className] forState:UIControlStateHighlighted];
    }
    if ([NUISettings hasProperty:@"text-shadow-color-selected" withClass:className]) {
        [button setTitleShadowColor:[NUISettings getColor:@"text-shadow-color-selected" withClass:className] forState:UIControlStateSelected];
    }
    if ([NUISettings hasProperty:@"text-shadow-color-selected-highlighted" withClass:className]) {
        [button setTitleShadowColor:[NUISettings getColor:@"text-shadow-color-selected-highlighted" withClass:className] forState:UIControlStateSelected|UIControlStateHighlighted];
    }
    if ([NUISettings hasProperty:@"text-shadow-color-selected-disabled" withClass:className]) {
        [button setTitleShadowColor:[NUISettings getColor:@"text-shadow-color-selected-disabled" withClass:className] forState:UIControlStateSelected|UIControlStateDisabled];
    }
    if ([NUISettings hasProperty:@"text-shadow-color-disabled" withClass:className]) {
        [button setTitleShadowColor:[NUISettings getColor:@"text-shadow-color-disabled" withClass:className] forState:UIControlStateDisabled];
    }
    
    // title insets
    if ([NUISettings hasProperty:@"title-insets" withClass:className]) {
        [button setTitleEdgeInsets:[NUISettings getEdgeInsets:@"title-insets" withClass:className]];
    }
    
    // content insets
    if ([NUISettings hasProperty:@"content-insets" withClass:className]) {
        [button setContentEdgeInsets:[NUISettings getEdgeInsets:@"content-insets" withClass:className]];
    }
    
    [NUIViewRenderer renderBorder:button withClass:className];
    
    // We need to apply the corner radius to all sublayers so that the shadow displays correctly
    if ([NUISettings hasProperty:@"corner-radius" withClass:className]) {
        CGFloat r = [NUISettings getFloat:@"corner-radius" withClass:className];
        for (CALayer* layer in button.layer.sublayers) {
            layer.cornerRadius = r;
        }
    }
    
    [NUIViewRenderer renderShadow:button withClass:className];
}

@end
