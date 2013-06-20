//
//  NUITableViewRenderer.m
//  Pods
//
//  Created by Tobias Heinicke on 19.06.13.
//
//

#import "NUITableViewRenderer.h"

@implementation NUITableViewRenderer

+ (void)render:(UITableView*)tableView withClass:(NSString*)className
{
    [self renderSizeDependentProperties:tableView];
}

+ (void)sizeDidChange:(UITableView*)tableView
{
    [self renderSizeDependentProperties:tableView];
}

+ (void)renderSizeDependentProperties:(UITableView*)tableView
{
    NSString *className = tableView.nuiClass;
    
    // Set background color
    if ([NUISettings hasProperty:@"background-color" withClass:className]) {
        UIImage *colorImage = [NUISettings getImageFromColor:@"background-color" withClass:className];
        tableView.backgroundView = [[UIImageView alloc] initWithImage:colorImage];
    }
    
    // Set background gradient
    if ([NUISettings hasProperty:@"background-color-top" withClass:className]) {
        UIImage *gradientImage = [NUIGraphics
                                  gradientImageWithTop:[NUISettings getColor:@"background-color-top" withClass:className]
                                  bottom:[NUISettings getColor:@"background-color-bottom" withClass:className]
                                  frame:tableView.bounds];
        tableView.backgroundView = [[UIImageView alloc] initWithImage:gradientImage];
    }
    
}

@end