 //
//  NUIImageViewRenderer.m
//  Pods
//
//  Created by Gomez, Antonio on 06/07/2016.
//
//

#import "NUIImageViewRenderer.h"
#import "NUIViewRenderer.h"

@implementation NUIImageViewRenderer

+ (void)render:(UIImageView*)imageView withClass:(NSString*)className
{
    // Set image view tint color
    if ([NUISettings hasProperty:@"tint-color" withClass:className]) {
        imageView.image = [imageView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        [imageView setTintColor:[NUISettings getColor:@"tint-color" withClass:className]];
    }
    
}

@end
