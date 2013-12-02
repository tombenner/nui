//
//  NUIWindowRenderer.m
//
//  Created by Julien Phalip on 01/27/13.
//  Copyright (c) 2013 Julien Phalip. All rights reserved.
//

#import "NUIWindowRenderer.h"

@implementation NUIWindowRenderer

+ (void)render:(UIWindow*)window withClass:(NSString*)className
{
    if ([NUISettings hasProperty:@"background-color" withClass:className]) {
        [window.rootViewController.view setBackgroundColor:[NUISettings getColor:@"background-color" withClass:className]];
    }
}

@end

