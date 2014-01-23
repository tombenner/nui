//
//  NUIImageViewRenderer.m
//  NUIDemo
//
//  Created by Hulk on 14-1-23.
//  Copyright (c) 2014年 Tom Benner. All rights reserved.
//

#import "NUIImageViewRenderer.h"
#import "NUIViewRenderer.h"

@implementation NUIImageViewRenderer

+ (void)render:(UIImageView*)imageView withClass:(NSString*)className
{
    //image
    if ([NUISettings hasProperty:@"image" withClass:className]) {
        [imageView setImage:[NUISettings getImage:@"image" withClass:className]];
    }
    //highlighted
    if ([NUISettings hasProperty:@"image-highlighted" withClass:className]) {
        [imageView setHighlightedImage:[NUISettings getImage:@"image-highlighted" withClass:className]];
    }
    
    [NUIViewRenderer render:imageView withClass:className];
    [NUIViewRenderer renderSize:imageView withClass:className];
    [NUIViewRenderer renderBorder:imageView withClass:className];
    [NUIViewRenderer renderShadow:imageView withClass:className];
}

@end
