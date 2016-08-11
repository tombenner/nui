 //
//  NUIImageViewRenderer.m
//  Pods
//
//  Created by Gomez, Antonio on 06/07/2016.
//
//

#import "NUIImageViewRenderer.h"

@implementation NUIImageViewRenderer

+ (void)render:(UIImageView*)imageView withClass:(NSString*)className
{
    
    [super render: imageView withClass: className];
    
    // Set image view tint color
    if ([NUISettings hasProperty:@"tint-color" withClass:className]) {
        imageView.image = [imageView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        [imageView setTintColor:[NUISettings getColor:@"tint-color" withClass:className]];
    }
    
}

@end
