//
//  NUIBarButtonItemRenderer.h
//  NUIDemo
//
//  Created by Tom Benner on 11/24/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import "NUIRenderer.h"
#import "NUISettings.h"
#import "NUIUtilities.h"
#import "UIBarButtonItem+NUI.h"

@interface NUIBarButtonItemRenderer : NSObject

+ (void)render:(UIBarButtonItem*)item withClass:(NSString*)className;

@end
