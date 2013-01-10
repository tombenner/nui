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
#import "UITabBarItem+NUI.h"

@interface NUITabBarRenderer : NSObject

+ (void)render:(UITabBar*)bar withClass:(NSString*)className;
+ (void)sizeDidChange:(UITabBar*)bar;

@end
