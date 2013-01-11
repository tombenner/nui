//
//  NUITextFieldRenderer.m
//  NUIDemo
//
//  Created by Tom Benner on 11/24/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import "NUITextFieldRenderer.h"

@implementation NUITextFieldRenderer

+ (void)render:(UITextField*)textField withClass:(NSString*)className
{
    NSString *fontSizeProperty = @"font-size";
    
    // Set font name
    if ([NUISettings hasProperty:@"font-name" withClass:className]) {
        [textField setFont:[UIFont fontWithName:[NUISettings get:@"font-name" withClass:className] size:[NUISettings getFloat:fontSizeProperty withClass:className]]];
    // If font-name is undefined but font-size is defined, use systemFont
    } else if ([NUISettings getFloat:fontSizeProperty withClass:className]) {
        [textField setFont:[UIFont systemFontOfSize:[NUISettings getFloat:fontSizeProperty withClass:className]]];
    }
    
    // Set font color
    if ([NUISettings hasProperty:@"font-color" withClass:className]) {
        [textField setTextColor:[NUISettings getColor:@"font-color" withClass:className]];
    }
    
    // Set background color
    if ([NUISettings hasProperty:@"background-color" withClass:className]) {
        [textField setBackgroundColor:[NUISettings getColor:@"background-color" withClass:className]];
    }
    
    // Set background gradient
    if ([NUISettings hasProperty:@"background-color-top" withClass:className]) {
        UIImage *gradient = [NUIGraphics
                                     gradientImageWithTop:[NUISettings getColor:@"background-color-top" withClass:className]
                                     bottom:[NUISettings getColor:@"background-color-bottom" withClass:className]
                                     frame:textField.bounds];
        [textField setBackground:gradient];
    }
    
    // Set background image
    if ([NUISettings hasProperty:@"background-image" withClass:className]) {
        [textField setBackground:[NUISettings getImage:@"background-image" withClass:className]];
    }
    
    if ([NUISettings hasProperty:@"vertical-align" withClass:className]) {
        [textField setContentVerticalAlignment:[NUISettings getControlContentVerticalAlignment:@"vertical-align" withClass:className]];
    }
    
    // Set height
    if ([NUISettings hasProperty:@"height" withClass:className]) {
        CGRect buttonFrame = textField.frame;
        CGSize originalSize = buttonFrame.size;
        buttonFrame.size = CGSizeMake(originalSize.width, [NUISettings getFloat:@"height" withClass: className]);
        textField.frame = buttonFrame;
    }
    
    // Set border style
    if ([NUISettings hasProperty:@"border-style" withClass:className]) {
        [textField setBorderStyle:[NUISettings getBorderStyle:@"border-style" withClass:className]];
    }
    
    CALayer *layer = [textField layer];
    
    // Set border color
    if ([NUISettings hasProperty:@"border-color" withClass:className]) {
        [layer setBorderColor:[[NUISettings getColor:@"border-color" withClass:className] CGColor]];
    }
    
    // Set border width
    if ([NUISettings hasProperty:@"border-width" withClass:className]) {
        [layer setBorderWidth:[NUISettings getFloat:@"border-width" withClass:className]];
    }
    
    // Set corner radius
    if ([NUISettings hasProperty:@"corner-radius" withClass:className]) {
        [layer setCornerRadius:[NUISettings getFloat:@"corner-radius" withClass:className]];
    }
}

@end
