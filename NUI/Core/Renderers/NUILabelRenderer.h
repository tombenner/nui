//
//  NUILabelRenderer.h
//  NUIDemo
//
//  Created by Tom Benner on 11/24/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import "NUISettings.h"

@interface NUILabelRenderer : NSObject

+ (void)render:(UILabel*)label withClass:(NSString*)className;
+ (void)render:(UILabel*)label withClass:(NSString*)className withSuffix:(NSString*)suffix;
+ (void)renderText:(UILabel*)label withClass:(NSString*)className;
+ (BOOL)needsTextTransformWithClass:(NSString*)className;
+ (NSString *)transformText:(NSString*)text withClass:(NSString*)className;
+ (NSAttributedString *)transformAttributedText:(NSAttributedString*)attributedText withClass:(NSString*)className;
@end
