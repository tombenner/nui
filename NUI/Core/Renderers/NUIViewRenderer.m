//
//  NUIViewRenderer.m
//  NUIDemo
//
//  Created by Tom Benner on 11/24/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import "NUIViewRenderer.h"

@implementation NUIViewRenderer

+ (void)render:(UIView*)view withClass:(NSString*)className
{
	view.backgroundColor = [UIColor clearColor];
	
    if ([NUISettings hasProperty:@"background-image" withClass:className]) {
        [view setBackgroundColor: [NUISettings getColorFromImage:@"background-image" withClass: className]];
    } else if ([NUISettings hasProperty:@"background-color" withClass:className]) {
        [view setBackgroundColor: [NUISettings getColor:@"background-color" withClass: className]];
    }
    
    CALayer *layer = [view layer];
    
    if ([NUISettings hasProperty:@"border-color" withClass:className]) {
        [layer setBorderColor:[[NUISettings getColor:@"border-color" withClass:className] CGColor]];
    }
    
    if ([NUISettings hasProperty:@"border-width" withClass:className]) {
        [layer setBorderWidth:[NUISettings getFloat:@"border-width" withClass:className]];
    }
    
    if ([NUISettings hasProperty:@"corner-radius" withClass:className]) {
        [layer setCornerRadius:[NUISettings getFloat:@"corner-radius" withClass:className]];
    }
	layer.masksToBounds = (layer.cornerRadius > 0);
	
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
			layer.shadowPath = [[UIBezierPath bezierPathWithRect:view.bounds] CGPath];
		}
	}
}

@end
