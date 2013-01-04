//
//  NUISwitchRenderer.m
//  NUIDemo
//
//  Created by Benjamin Clayton on 04/01/2013.
//  Copyright (c) 2013 Tom Benner. All rights reserved.
//

#import "NUISwitchRenderer.h"

@implementation NUISwitchRenderer

+ (void)render:(UISwitch*)item withClass:(NSString*)className
{
    if ([NUISettings hasProperty:@"background-color" withClass:className]) {
        [item setBackgroundColor:[NUISettings getColor:@"background-color" withClass:className]];
    }
    
    if ([NUISettings hasProperty:@"off-image" withClass:className]) {
        [item setOffImage:[NUISettings getImage:@"off-image" withClass:className]];
    }
    
    if ([NUISettings hasProperty:@"on-image" withClass:className]) {
        [item setOnImage:[NUISettings getImage:@"on-image" withClass:className]];
    }
    
    if ([NUISettings hasProperty:@"on-tint-color" withClass:className]) {
        [item setOnTintColor:[NUISettings getColor:@"on-tint-color" withClass:className]];
    }
    
    if ([NUISettings hasProperty:@"thumb-tint-color" withClass:className]) {
        [item setThumbTintColor:[NUISettings getColor:@"thumb-tint-color" withClass:className]];
    }
    
    if ([NUISettings hasProperty:@"tint-color" withClass:className]) {
        [item setTintColor:[NUISettings getColor:@"tint-color" withClass:className]];
    }
}

@end
