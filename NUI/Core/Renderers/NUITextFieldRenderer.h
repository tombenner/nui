//
//  NUITextFieldRenderer.h
//  NUIDemo
//
//  Created by Tom Benner on 11/24/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import "NUIGraphics.h"
#import "NUISettings.h"

@interface NUITextFieldRenderer : NSObject

+ (void)render:(UITextField*)textField withClass:(NSString*)className;

@end
