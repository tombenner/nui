//
//  NUIActivityIndicatorRenderer.m
//  Pods
//
//  Created by Gomez, Antonio on 22/04/2016.
//
//

#import "NUIActivityIndicatorRenderer.h"
#import "NUIViewRenderer.h"
#import "UIButton+NUI.h"

@implementation NUIActivityIndicatorRenderer

+ (void)render:(UIActivityIndicatorView*)activityIndicator withClass:(NSString*)className
{
    // Set activity indicator color
    if ([NUISettings hasProperty:@"color" withClass:className]) {
        [activityIndicator setColor:[NUISettings getColor:@"color" withClass:className]];
    }
    
}

@end
