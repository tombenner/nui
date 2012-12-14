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
    
    // Set font
    if ([NUISettings hasProperty:@"font-name" withClass:className]) {
        [textField setFont:[UIFont fontWithName:[NUISettings get:@"font-name" withClass:className] size:[NUISettings getFloat:fontSizeProperty withClass:className]]];
    // If font-name is undefined but font-size is defined, use systemFont
    } else if ([NUISettings getFloat:fontSizeProperty withClass:className]) {
        [textField setFont:[UIFont systemFontOfSize:[NUISettings getFloat:fontSizeProperty withClass:className]]];
    }
    
    // Set border style   
    if ([NUISettings hasProperty:@"border-color" withClass:className]) {
        [textField setBorderStyle:[NUISettings getBorderStyle:@"border-color" withClass:className]];
    }
    
    // Set height
    if ([NUISettings hasProperty:@"height" withClass:className]) {
        CGRect buttonFrame = textField.frame;
        CGSize originalSize = buttonFrame.size;
        buttonFrame.size = CGSizeMake(originalSize.width, [NUISettings getFloat:@"height" withClass: className]);
        textField.frame = buttonFrame;
    }
}

@end
