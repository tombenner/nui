//
//  NUIProgressViewRenderer.h
//  NUIDemo
//
//  Created by Tom Benner on 3/17/13.
//  Copyright (c) 2013 Tom Benner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NUISettings.h"
#import "NUIViewRenderer.h"

@interface NUIProgressViewRenderer : NSObject

+(void)render:(UIProgressView*)progressView;
+(void)render:(UIProgressView*)progressView withClass:(NSString*)className;

@end
