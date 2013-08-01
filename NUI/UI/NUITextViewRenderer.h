//
//  NUITextViewRenderer.h
//  App
//
//  Created by Kavi Dhokia on 01/08/2013.
//  Copyright (c) 2013 RealityMine Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import "NUIGraphics.h"
#import "NUISettings.h"

@interface NUITextViewRenderer : NSObject

+ (void)render:(UITextView*)textView withClass:(NSString*)className;

@end
