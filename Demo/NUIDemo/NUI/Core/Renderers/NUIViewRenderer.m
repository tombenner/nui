//
//  NUIViewRenderer.m
//  NUIDemo
//
//  Created by Tom Benner on 11/24/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import "NUIViewRenderer.h"

@implementation NUIViewRenderer

+ (void)render:(UIView*)view withClass:(NSString*)class_name
{
    if ([NUISettings hasKey:@"BackgroundImage" withClass:class_name]) {
        [view setBackgroundColor: [NUISettings getColorFromImage:@"BackgroundImage" withClass: class_name]];
    } else if ([NUISettings hasKey:@"BackgroundColor" withClass:class_name]) {
        [view setBackgroundColor: [NUISettings getColor:@"BackgroundColor" withClass: class_name]];
    }
}

@end
