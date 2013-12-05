//
//  NUITextFieldRenderer.m
//  NUIDemo
//
//  Created by Tom Benner on 11/24/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import "NUITextFieldRenderer.h"
#import "NUIViewRenderer.h"

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
    
    //TODO: Need to fix this
    //Set padding
    if ([NUISettings hasProperty:@"clear-button-image" withClass:className]) {
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        UIButton *clearButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 16, 16)];
        [clearButton setTitle:@"" forState:UIControlStateNormal];
        [clearButton setImage:[NUISettings getImage:@"clear-button-image" withClass:className] forState:UIControlStateNormal];
        textField.rightView = clearButton;
    }
    
    // Set background image
    if ([NUISettings hasProperty:@"background-image" withClass:className]) {
        [textField setBackground:[NUISettings getImage:@"background-image" withClass:className]];
    }
    
    if ([NUISettings hasProperty:@"vertical-align" withClass:className]) {
        [textField setContentVerticalAlignment:[NUISettings getControlContentVerticalAlignment:@"vertical-align" withClass:className]];
    }

    // Set border style
    if ([NUISettings hasProperty:@"border-style" withClass:className]) {
        [textField setBorderStyle:[NUISettings getBorderStyle:@"border-style" withClass:className]];
    }

    [NUIViewRenderer renderSize:textField withClass:className];
    [NUIViewRenderer renderBorder:textField withClass:className];
    [NUIViewRenderer renderShadow:textField withClass:className];
}

@end
