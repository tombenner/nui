//
//  NUIToolbarRenderer.m
//  NUIDemo
//
//  Created by Simon Moser on 09/01/13.
//  Copyright (c) 2013 Simon Moser. All rights reserved.
//

#import "NUIToolbarRenderer.h"

@implementation NUIToolbarRenderer

+ (void)render:(UIToolbar*)bar withClass:(NSString*)className
{
    // setBackgroundColor isn't applied correctly in all cases, so we'll use setBackgroundImage
    // instead
    if ([NUISettings hasProperty:@"background-color" withClass:className]) {
        [bar setBackgroundImage:[NUISettings getImageFromColor:@"background-color" withClass:className] forToolbarPosition:UIToolbarPositionAny barMetrics:UIBarMetricsDefault];
    }
    
    if ([NUISettings hasProperty:@"background-tint-color" withClass:className]) {
        [bar setTintColor:[NUISettings getColor:@"background-tint-color" withClass:className]];
    }
    
    if ([NUISettings hasProperty:@"background-image" withClass:className]) {
        [bar setBackgroundImage:[NUISettings getImage:@"background-image" withClass:className] forToolbarPosition:UIToolbarPositionAny barMetrics:UIBarMetricsDefault];
    }
    if ([NUISettings hasProperty:@"background-image-top" withClass:className]) {
        [bar setBackgroundImage:[NUISettings getImage:@"background-image-top" withClass:className] forToolbarPosition:UIToolbarPositionTop barMetrics:UIBarMetricsDefault];
    }
    if ([NUISettings hasProperty:@"background-image-bottom" withClass:className]) {
        [bar setBackgroundImage:[NUISettings getImage:@"background-image-bottom" withClass:className] forToolbarPosition:UIToolbarPositionBottom barMetrics:UIBarMetricsDefault];
    }
    if ([NUISettings hasProperty:@"background-image-top-landscape" withClass:className]) {
        [bar setBackgroundImage:[NUISettings getImage:@"background-image-top-landscape" withClass:className] forToolbarPosition:UIToolbarPositionTop barMetrics:UIBarMetricsLandscapePhone];
    }
    if ([NUISettings hasProperty:@"background-image-bottom-landscape" withClass:className]) {
        [bar setBackgroundImage:[NUISettings getImage:@"background-image-bottom-landscape" withClass:className] forToolbarPosition:UIToolbarPositionBottom barMetrics:UIBarMetricsLandscapePhone];
    }
    
    // setShadowImage is available since ios 6.0
    if ([bar respondsToSelector:@selector(setShadowImage:forToolbarPosition:)]) {
        if ([NUISettings hasProperty:@"shadow-image" withClass:className]) {
            [bar setShadowImage:[NUISettings getImage:@"shadow-image" withClass:className] forToolbarPosition:UIToolbarPositionAny];
        }
        if ([NUISettings hasProperty:@"shadow-image-top" withClass:className]) {
            [bar setShadowImage:[NUISettings getImage:@"shadow-image-top" withClass:className] forToolbarPosition:UIToolbarPositionTop];
        }
        if ([NUISettings hasProperty:@"shadow-image-bottom" withClass:className]) {
            [bar setShadowImage:[NUISettings getImage:@"shadow-image-bottom" withClass:className] forToolbarPosition:UIToolbarPositionBottom];
        }
    }
}

@end
