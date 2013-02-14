//
//  NUIControlRenderer.m
//  NUIDemo
//
//  Created by Alejandro Isaza on 13-01-30.
//  Copyright (c) 2013 Tom Benner. All rights reserved.
//

#import "NUIControlRenderer.h"
#import "NUIViewRenderer.h"

@implementation NUIControlRenderer

+ (void)render:(UIControl*)control withClass:(NSString*)className
{
    if ([NUISettings hasProperty:@"background-image" withClass:className]) {
        [control setBackgroundColor: [NUISettings getColorFromImage:@"background-image" withClass: className]];
    } else if ([NUISettings hasProperty:@"background-color" withClass:className]) {
        [control setBackgroundColor: [NUISettings getColor:@"background-color" withClass: className]];
    }
    
    [NUIViewRenderer renderBorder:control withClass:className];
    [NUIViewRenderer renderShadow:control withClass:className];
}

@end
