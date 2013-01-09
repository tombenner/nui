//
//  NUISliderRenderer.m
//  NUIDemo
//
//  Created by Simon Moser @savage7 on 09/01/13.
//  Copyright (c) 2013 Simon Moser. All rights reserved.
//

#import "NUISliderRenderer.h"

@implementation NUISliderRenderer

+ (void)render:(UISlider*)uiSlider withClass:(NSString*)className;
{
    if ([NUISettings hasProperty:@"minimum-value-image-color" withClass:className]) {
        [uiSlider setMinimumValueImage:[NUISettings getImage:@"minimum-value-image-color" withClass:className]];
    }
    if ([NUISettings hasProperty:@"maximum-value-image-color" withClass:className]) {
        [uiSlider setMaximumValueImage:[NUISettings getImage:@"maximum-value-image-color" withClass:className]];
    }
    if ([NUISettings hasProperty:@"minimum-track-tint-color" withClass:className]) {
        [uiSlider setMinimumTrackTintColor:[NUISettings getColor:@"minimum-track-tint-color" withClass:className]];
    }
    if ([NUISettings hasProperty:@"maximum-track-tint-color" withClass:className]) {
        [uiSlider setMaximumTrackTintColor:[NUISettings getColor:@"maximum-track-tint-color" withClass:className]];
    }
    if ([NUISettings hasProperty:@"thumb-tint-color" withClass:className]) {
        [uiSlider setThumbTintColor:[NUISettings getColor:@"thumb-tint-color" withClass:className]];
    }
}

@end
