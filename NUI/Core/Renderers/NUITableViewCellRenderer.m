//
//  NUITableViewCellRenderer.m
//  NUIDemo
//
//  Created by Tom Benner on 11/24/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import "NUITableViewCellRenderer.h"

@implementation NUITableViewCellRenderer

+ (void)render:(UITableViewCell*)cell withClass:(NSString*)className
{
    // Set background color
    if ([NUISettings hasProperty:@"background-color" withClass:className]) {
        UIView *background = [[UIView alloc] initWithFrame:cell.frame];
        background.backgroundColor = [NUISettings getColor:@"background-color" withClass:className];
        cell.backgroundView = background;
    }
    
    // Set background gradient
    if ([NUISettings hasProperty:@"background-color-top" withClass:className]) {
        CGRect backgroundViewFrame = cell.contentView.frame;
        cell.backgroundView = [[UIView alloc] initWithFrame:backgroundViewFrame];
        CAGradientLayer *gradient = [NUIGraphics
                                     gradientLayerWithTop:[NUISettings getColor:@"background-color-top" withClass:className] 
                                     bottom:[NUISettings getColor:@"background-color-bottom" withClass:className]
                                     frame:cell.bounds];
        [cell.backgroundView.layer addSublayer:gradient];
    }
    
    // Set the labels' background colors to clearColor by default, so they don't show a white
    // background on top of the cell background color
    [cell.textLabel setBackgroundColor:[UIColor clearColor]];
    [cell.detailTextLabel setBackgroundColor:[UIColor clearColor]];
    
    // Set fonts
    [NUIRenderer renderLabel:cell.textLabel withClass:className];
    [NUIRenderer renderLabel:cell.detailTextLabel withClass:className withSuffix:@"Detail"];
    
}

@end
