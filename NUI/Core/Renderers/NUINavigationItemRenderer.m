//
//  NUINavigationItemRenderer.m
//  NUIDemo
//
//  Created by Tom Benner on 11/24/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import "NUINavigationItemRenderer.h"

@implementation NUINavigationItemRenderer

+ (void)render:(UINavigationItem*)item withClass:(NSString*)className
{
    if (item.backBarButtonItem != nil) {
        [NUIRenderer renderBarButtonItem:item.backBarButtonItem];
    }
    if (item.leftBarButtonItem != nil) {
        [NUIRenderer renderBarButtonItem:item.leftBarButtonItem];
    }
    if (item.rightBarButtonItem != nil) {
        [NUIRenderer renderBarButtonItem:item.rightBarButtonItem];
    }
}

@end
