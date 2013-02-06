//
//  NUIWindowRenderer.h
//
//  Created by Julien Phalip on 01/27/13.
//  Copyright (c) 2013 Julien Phalip. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import "NUIRenderer.h"
#import "NUISettings.h"
#import "NUIUtilities.h"
#import "UIWindow+NUI.h"

@interface NUIWindowRenderer : NSObject

+ (void)render:(UIWindow*)window withClass:(NSString*)className;

@end
