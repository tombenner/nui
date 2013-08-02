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
    [self renderSizeDependentProperties:tableView withClass:(NSString*)className];
	// setSectionIndexColor: is available since ios 6.0
	if([tableView respondsToSelector:@selector(setSectionIndexColor:)]) {
		// Set section index color
		if ([NUISettings hasProperty:@"section-index-color" withClass:className]) {
			UIColor *color = [NUISettings getColor:@"section-index-color" withClass:className];
			tableView.sectionIndexColor = color;

		}
	}
	// Set separator color
	if ([NUISettings hasProperty:@"separator-color" withClass:className]) {
		UIColor *colorImage = [NUISettings getColor:@"separator-color" withClass:className];
		tableView.separatorColor = colorImage;
	}
}

+ (void)sizeDidChange:(UITableView*)tableView
{
    [self renderSizeDependentProperties:tableView withClass:tableView.nuiClass];
}

+ (void)renderSizeDependentProperties:(UITableView*)tableView withClass:(NSString*)className
{
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