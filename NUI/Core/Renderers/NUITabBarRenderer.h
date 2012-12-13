//
//  NUITabBarRenderer.h
//  NUIDemo
//
//  Created by Tom Benner on 11/24/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NUIGraphics.h"
#import "NUISettings.h"

@interface NUITabBarRenderer : NSObject

+ (void)render:(UITabBar*)bar withClass:(NSString*)class_name;

@end
