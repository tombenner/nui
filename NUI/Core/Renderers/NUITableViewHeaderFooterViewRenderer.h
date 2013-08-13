//
//  NUITableViewHeaderFooterViewRenderer.h
//  NUIDemo
//
//  Created by Matthew Flint on 12 Aug 2013.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#ifdef __IPHONE_6_0 // iOS6 and later

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import "NUIGraphics.h"
#import "NUIRenderer.h"
#import "NUISettings.h"

@interface NUITableViewHeaderFooterViewRenderer : NSObject

+ (void)render:(UITableViewHeaderFooterView*)view withClass:(NSString*)className;
+ (void)sizeDidChange:(UITableViewHeaderFooterView*)view;

@end

#endif
