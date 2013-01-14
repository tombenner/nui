//
//  NUISearchBarRenderer.h
//  NUIDemo
//
//  Created by Tom Benner on 1/11/13.
//  Copyright (c) 2013 Tom Benner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NUIGraphics.h"
#import "NUISettings.h"
#import "NUIUtilities.h"

@interface NUISearchBarRenderer : NSObject

+ (void)render:(UISearchBar*)bar withClass:(NSString*)className;

@end
