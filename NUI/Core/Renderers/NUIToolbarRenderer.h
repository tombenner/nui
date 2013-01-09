//
//  NUIToolbarRenderer.h
//  NUIDemo
//
//  Created by Simon Moser @savage7 on 09/01/13.
//  Copyright (c) 2013 Simon Moser. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NUIGraphics.h"
#import "NUISettings.h"
#import "NUIUtilities.h"

@interface NUIToolbarRenderer : NSObject

+ (void)render:(UIToolbar*)bar withClass:(NSString*)className;

@end
