//
//  NUIProgressViewRenderer.m
//  NUIDemo
//
//  Created by Tom Benner on 3/17/13.
//  Copyright (c) 2013 Tom Benner. All rights reserved.
//

#import "NUIProgressViewRenderer.h"

@implementation NUIProgressViewRenderer

+(void)render:(UIProgressView*)progressView
{
    [self render:progressView withClass:@"Progress"];
}

+(void)render:(UIProgressView*)progressView withClass:(NSString*)className
{
    if ([NUISettings hasProperty:@"progress-tint-color" withClass:className]) {
        [progressView setProgressTintColor:[NUISettings getColor:@"progress-tint-color" withClass:className]];
    }
    
    if ([NUISettings hasProperty:@"progress-image" withClass:className]) {
        [progressView setProgressImage:[NUISettings getImage:@"progress-image" withClass:className]];
    }
    
    if ([NUISettings hasProperty:@"track-tint-color" withClass:className]) {
        [progressView setTrackTintColor:[NUISettings getColor:@"track-tint-color" withClass:className]];
    }
    
    if ([NUISettings hasProperty:@"track-image" withClass:className]) {
        [progressView setTrackImage:[NUISettings getImage:@"track-image" withClass:className]];
    }
    
    [NUIViewRenderer renderSize:progressView withClass:className];
}

@end
