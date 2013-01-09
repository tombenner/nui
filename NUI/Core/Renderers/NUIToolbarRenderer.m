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
    if ([NUISettings hasProperty:@"background-tint-color" withClass:className]) {
        [bar setTintColor:[NUISettings getColor:@"background-tint-color" withClass:className]];
    }
    
    if ([NUISettings hasProperty:@"background-image-landscape-top" withClass:className]) {
        [bar setBackgroundImage:[NUISettings getImage:@"background-image-landscape-top" withClass:className] forToolbarPosition:UIToolbarPositionTop barMetrics:UIBarMetricsLandscapePhone];
    }
    if ([NUISettings hasProperty:@"background-image-landscape-bottom" withClass:className]) {
        [bar setBackgroundImage:[NUISettings getImage:@"background-image-landscape-bottom" withClass:className] forToolbarPosition:UIToolbarPositionBottom barMetrics:UIBarMetricsLandscapePhone];
    }
    if ([NUISettings hasProperty:@"background-image-portrait-top" withClass:className]) {
        [bar setBackgroundImage:[NUISettings getImage:@"background-image-portrait-top" withClass:className] forToolbarPosition:UIToolbarPositionTop barMetrics:UIBarMetricsDefault];
    }
    if ([NUISettings hasProperty:@"background-image-portrait-bottom" withClass:className]) {
        [bar setBackgroundImage:[NUISettings getImage:@"background-image-portrait-top" withClass:className] forToolbarPosition:UIToolbarPositionBottom barMetrics:UIBarMetricsDefault];
    }
    
    // setShadowImage is available since ios 6.0
    if([bar respondsToSelector:@selector(setShadowImage:forToolbarPosition:)])
    {
        if ([NUISettings hasProperty:@"shadow-image-top" withClass:className]) {
            [bar setShadowImage:[NUISettings getImage:@"shadow-image-top" withClass:className] forToolbarPosition:UIToolbarPositionTop];
        }
        
        if ([NUISettings hasProperty:@"shadow-image-bottom" withClass:className]) {
            [bar setShadowImage:[NUISettings getImage:@"shadow-image-bottom" withClass:className] forToolbarPosition:UIToolbarPositionBottom];
        }
    }
}

@end
