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
    // UIButtonTypeRoundedRect's first two sublayers contain its background and border, which
    // need to be hidden for NUI's rendering to be displayed correctly. Ideally we would switch
    // over to a UIButtonTypeCustom, but this appears to be impossible.
    if (button.buttonType == UIButtonTypeRoundedRect) {
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
        [button setBackgroundImage:[NUISettings getImageFromColor:@"background-color" withClass:className] forState:UIControlStateNormal];
    }
    if ([NUISettings hasProperty:@"background-color-selected" withClass:className]) {
        [button setBackgroundImage:[NUISettings getImageFromColor:@"background-color-selected" withClass:className] forState:UIControlStateSelected];
    }
    if ([NUISettings hasProperty:@"background-color-highlighted" withClass:className]) {
        [button setBackgroundImage:[NUISettings getImageFromColor:@"background-color-highlighted" withClass:className] forState:UIControlStateHighlighted];
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
        if (button.nuiIsApplied) {
            [[button.layer.sublayers objectAtIndex:backgroundLayerIndex] removeFromSuperlayer];
        }
        [button.layer insertSublayer:gradientLayer atIndex:backgroundLayerIndex];
    }
    
    // Set background image
    if ([NUISettings hasProperty:@"background-image" withClass:className]) {
        [button setBackgroundImage:[NUISettings getImage:@"background-image" withClass:className] forState:UIControlStateNormal];
    }
    if ([NUISettings hasProperty:@"background-image-selected" withClass:className]) {
        [button setBackgroundImage:[NUISettings getImage:@"background-image-selected" withClass:className] forState:UIControlStateSelected];
    }
    if ([NUISettings hasProperty:@"background-image-highlighted" withClass:className]) {
        [button setBackgroundImage:[NUISettings getImage:@"background-image-highlighted" withClass:className] forState:UIControlStateHighlighted];
    }
    if ([NUISettings hasProperty:@"background-image-disabled" withClass:className]) {
        [button setBackgroundImage:[NUISettings getImage:@"background-image-disabled" withClass:className] forState:UIControlStateDisabled];
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
    if ([NUISettings hasProperty:@"font-color-selected" withClass:className]) {
        [button setTitleColor:[NUISettings getColor:@"font-color-selected" withClass:className] forState:UIControlStateSelected];
    }
    if ([NUISettings hasProperty:@"font-color-highlighted" withClass:className]) {
        [button setTitleColor:[NUISettings getColor:@"font-color-highlighted" withClass:className] forState:UIControlStateHighlighted];
    }
    if ([NUISettings hasProperty:@"font-color-disabled" withClass:className]) {
        [button setTitleColor:[NUISettings getColor:@"font-color-disabled" withClass:className] forState:UIControlStateDisabled];
    }
    
    // Set text shadow color
    if ([NUISettings hasProperty:@"text-shadow-color" withClass:className]) {
        [button setTitleShadowColor:[NUISettings getColor:@"text-shadow-color" withClass:className] forState:UIControlStateNormal];
    }
    if ([NUISettings hasProperty:@"text-shadow-color-selected" withClass:className]) {
        [button setTitleShadowColor:[NUISettings getColor:@"text-shadow-color-selected" withClass:className] forState:UIControlStateSelected];
    }
    if ([NUISettings hasProperty:@"text-shadow-color-highlighted" withClass:className]) {
        [button setTitleShadowColor:[NUISettings getColor:@"text-shadow-color-highlighted" withClass:className] forState:UIControlStateHighlighted];
    }
    
    // title insets
    if ([NUISettings hasProperty:@"title-insets" withClass:className]) {
        [button setTitleEdgeInsets:[NUISettings getEdgeInsets:@"title-insets" withClass:className]];
    }
    
    // content insets
    if ([NUISettings hasProperty:@"content-insets" withClass:className]) {
        [button setContentEdgeInsets:[NUISettings getEdgeInsets:@"content-insets" withClass:className]];
    }
    
    CALayer *layer = [button layer];
    
    // Set corners
    if ([NUISettings hasProperty:@"corner-radius" withClass:className]) {
        [layer setCornerRadius:[NUISettings getFloat:@"corner-radius" withClass:className]];
    }
	layer.masksToBounds = (layer.cornerRadius > 0);
    
    // Set border color
    if ([NUISettings hasProperty:@"border-color" withClass:className]) {
        [layer setBorderColor:[[NUISettings getColor:@"border-color" withClass:className] CGColor]];
    }
    
    // Set border width
    if ([NUISettings hasProperty:@"border-width" withClass:className]) {
        [layer setBorderWidth:[NUISettings getFloat:@"border-width" withClass:className]];
    }
	
	// Set shadow
	if ([NUISettings hasProperty:@"shadow-offset" withClass:className]) {
		layer.shadowOffset = [NUISettings getSize:@"shadow-offset" withClass:className];
	}
	if ([NUISettings hasProperty:@"shadow-alpha" withClass:className]) {
		layer.shadowOpacity = [NUISettings getFloat:@"shadow-alpha" withClass:className];
	}
	if ([NUISettings hasProperty:@"shadow-color" withClass:className]) {
		layer.shadowColor = [[NUISettings getColor:@"shadow-color" withClass:className] CGColor];
	}
	if ([NUISettings hasProperty:@"shadow-radius" withClass:className]) {
		layer.shadowRadius = [NUISettings getFloat:@"shadow-radius" withClass:className];
	}
	if ([NUISettings hasProperty:@"shadow-box" withClass:className]) {
		if([NUISettings getBoolean:@"shadow-box" withClass:className]) {
			layer.shadowPath = [[UIBezierPath bezierPathWithRect:button.bounds] CGPath];
		}
	}
}

@end
