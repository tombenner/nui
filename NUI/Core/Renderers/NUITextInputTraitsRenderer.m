//
//  NUITextInputTraitsRenderer.m
//  NUIDemo
//
//  Created by Alexey Trenikhin on 3/13/16.
//  Copyright © 2016 Tom Benner. All rights reserved.
//

#import "NUITextInputTraitsRenderer.h"
#import "UIKit/UITextInputTraits.h"
#import "NUISettings.h"

@implementation NUITextInputTraitsRenderer

+ (void)renderKeyboard:(id<UITextInputTraits>) traits withClass:(NSString*)className
{
    NSString *property;
    property = @"keyboard-appearance";
    if ([NUISettings hasProperty:property withClass:className] && [traits respondsToSelector: @selector(setKeyboardAppearance:)]) {
        traits.keyboardAppearance = [NUISettings getKeyboardAppearance:property withClass:className];
    }
}
@end
