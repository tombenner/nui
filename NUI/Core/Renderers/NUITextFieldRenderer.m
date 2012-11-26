//
//  NUITextFieldRenderer.m
//  NUIDemo
//
//  Created by Tom Benner on 11/24/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import "NUITextFieldRenderer.h"

@implementation NUITextFieldRenderer

+ (void)render:(UITextField*)text_field withClass:(NSString*)class_name
{
    // Set font   
    if ([NUISettings hasKey:@"FontName" withClass:class_name]) {
        [text_field setFont:[UIFont fontWithName:[NUISettings get:@"FontName" withClass:class_name] size:[NUISettings getFloat:@"FontSize" withClass:class_name]]];
    }
    
    // Set border style   
    if ([NUISettings hasKey:@"BorderStyle" withClass:class_name]) {
        [text_field setBorderStyle:[NUISettings getBorderStyle:@"BorderStyle" withClass:class_name]];
    }
    
    // Set height
    if ([NUISettings hasKey:@"Height" withClass:class_name]) {
        CGRect buttonFrame = text_field.frame;
        CGSize originalSize = buttonFrame.size;
        buttonFrame.size = CGSizeMake(originalSize.width, [NUISettings getFloat:@"Height" withClass: class_name]);
        text_field.frame = buttonFrame;
    }
}

@end
