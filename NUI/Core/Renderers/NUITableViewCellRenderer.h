//
//  NUITableViewCellRenderer.h
//  NUIDemo
//
//  Created by Tom Benner on 11/24/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import "NUIGraphics.h"
#import "NUIRenderer.h"
#import "NUISettings.h"

@interface NUITableViewCellRenderer : NSObject

+ (void)render:(UITableViewCell*)cell withClass:(NSString*)className;
+ (void)sizeDidChange:(UITableViewCell*)cell;

@end
