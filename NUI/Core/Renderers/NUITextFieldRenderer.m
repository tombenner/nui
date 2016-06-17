//
//  NUITextFieldRenderer.m
//  NUIDemo
//
//  Created by Tom Benner on 11/24/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import "NUITextFieldRenderer.h"
#import "NUIViewRenderer.h"
#import "NUITextInputTraitsRenderer.h"

@implementation NUITextFieldRenderer

+ (void)render:(UITextField*)textField withClass:(NSString*)className
{
    if ([NUISettings hasFontPropertiesWithClass:className]) {
        [textField setFont:[NUISettings getFontWithClass:className baseFont:textField.font]];
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
    
    if ([NUISettings hasProperty:@"horizontal-align" withClass:className]) {
        [textField setContentHorizontalAlignment:[NUISettings getControlContentHorizontalAlignment:@"horizontal" withClass:className]];
    }

    // Set border style
    if ([NUISettings hasProperty:@"border-style" withClass:className]) {
        [textField setBorderStyle:[NUISettings getBorderStyle:@"border-style" withClass:className]];
    }

    // Set the tint color (cursor color)
    if ([NUISettings hasProperty:@"tint-color" withClass:className]) {
        [textField setTintColor:[NUISettings getColor:@"tint-color" withClass:className]];
    }
    
    [self renderText:textField withClass:className];
    [NUIViewRenderer renderSize:textField withClass:className];
    [NUIViewRenderer renderBorder:textField withClass:className];
    [NUIViewRenderer renderShadow:textField withClass:className];
    if([textField conformsToProtocol:@protocol(UITextInputTraits)]) {
        [NUITextInputTraitsRenderer renderKeyboard:(id<UITextInputTraits>)textField withClass:className];
    }
}

+(void)renderText:(UITextField*)textField withClass:(NSString*)className
{
    NSString *property;
	
    property = @"text-align";
    if ([NUISettings hasProperty:property withClass:className]) {
        textField.textAlignment = [NUISettings getTextAlignment:property withClass:className];
    }
	
    property = @"text-alpha";
    if ([NUISettings hasProperty:property withClass:className]) {
        textField.alpha = [NUISettings getFloat:property withClass:className];
}
	
    property = @"text-auto-fit";
    if ([NUISettings hasProperty:property withClass:className]) {
        [textField setAdjustsFontSizeToFitWidth:[NUISettings getBoolean:property withClass:className]];
    }
}
@end
