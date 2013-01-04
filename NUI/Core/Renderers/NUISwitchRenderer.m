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
    if ([NUISettings hasProperty:@"on-tint-color" withClass:className]) {
        [item setOnTintColor:[NUISettings getColor:@"on-tint-color" withClass:className]];
    }
}


@end
