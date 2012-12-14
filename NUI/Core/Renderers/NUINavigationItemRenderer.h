//
//  NUINavigationItemRenderer.h
//  NUIDemo
//
//  Created by Tom Benner on 11/24/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import "NUIRenderer.h"
#import "NUISettings.h"

@interface NUINavigationItemRenderer : NSObject

+ (void)render:(UINavigationItem*)item withClass:(NSString*)className;

@end
