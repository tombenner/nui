//
//  NUILabelRenderer.h
//  NUIDemo
//
//  Created by Tom Benner on 11/24/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NUISettings.h"

@interface NUILabelRenderer : NSObject

+ (void)render:(UILabel*)label withClass:(NSString*)class_name;
+ (void)render:(UILabel*)label withClass:(NSString*)class_name withSuffix:(NSString*)suffix;

@end
