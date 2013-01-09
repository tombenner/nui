//
//  NUISliderRenderer.m
//  NUIDemo
//
//  Created by Simon Moser @savage7 on 09/01/13.
//  Copyright (c) 2013 Simon Moser. All rights reserved.
//

#import "NUISliderRenderer.h"

@implementation NUISliderRenderer

+ (void)render:(UISlider*)slider withClass:(NSString*)className;
{
    if ([NUISettings hasProperty:@"minimum-track-tint-color" withClass:className]) {
        [slider setMinimumTrackTintColor:[NUISettings getColor:@"minimum-track-tint-color" withClass:className]];
    }
    if ([NUISettings hasProperty:@"maximum-track-tint-color" withClass:className]) {
        [slider setMaximumTrackTintColor:[NUISettings getColor:@"maximum-track-tint-color" withClass:className]];
    }
    if ([NUISettings hasProperty:@"minimum-value-image" withClass:className]) {
        [slider setMinimumValueImage:[NUISettings getImage:@"minimum-value-image" withClass:className]];
    }
    if ([NUISettings hasProperty:@"maximum-value-image" withClass:className]) {
        [slider setMaximumValueImage:[NUISettings getImage:@"maximum-value-image" withClass:className]];
    }
    if ([NUISettings hasProperty:@"thumb-image" withClass:className]) {
        [slider setThumbImage:[NUISettings getImage:@"thumb-image" withClass:className] forState:UIControlStateNormal];
    }
    if ([NUISettings hasProperty:@"thumb-tint-color" withClass:className]) {
        [slider setThumbTintColor:[NUISettings getColor:@"thumb-tint-color" withClass:className]];
    }
}

@end
