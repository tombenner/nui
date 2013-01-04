//
//  NUISwitchRenderer.m
//  NUIDemo
//
//  Created by Benjamin Clayton on 04/01/2013.
//  Copyright (c) 2013 Tom Benner. All rights reserved.
//

#import "NUISwitchRenderer.h"

@implementation NUISwitchRenderer

+ (void)render:(UISwitch*)uiSwitch withClass:(NSString*)className
{
    if ([NUISettings hasProperty:@"background-color" withClass:className]) {
        [uiSwitch setBackgroundColor:[NUISettings getColor:@"background-color" withClass:className]];
    }
    
    if ([NUISettings hasProperty:@"off-image" withClass:className]) {
        [uiSwitch setOffImage:[NUISettings getImage:@"off-image" withClass:className]];
    }
    
    if ([NUISettings hasProperty:@"on-image" withClass:className]) {
        [uiSwitch setOnImage:[NUISettings getImage:@"on-image" withClass:className]];
    }
    
    if ([NUISettings hasProperty:@"on-tint-color" withClass:className]) {
        [uiSwitch setOnTintColor:[NUISettings getColor:@"on-tint-color" withClass:className]];
    }
    
    if ([NUISettings hasProperty:@"thumb-tint-color" withClass:className]) {
        [uiSwitch setThumbTintColor:[NUISettings getColor:@"thumb-tint-color" withClass:className]];
    }
    
    if ([NUISettings hasProperty:@"tint-color" withClass:className]) {
        [uiSwitch setTintColor:[NUISettings getColor:@"tint-color" withClass:className]];
    }
}

@end
