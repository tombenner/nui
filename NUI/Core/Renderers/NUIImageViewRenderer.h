//
//  NUIImageViewRenderer.h
//  NUIDemo
//
//  Created by Hulk on 14-1-23.
//  Copyright (c) 2014年 Tom Benner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import "NUISettings.h"

@interface NUIImageViewRenderer : NSObject

+ (void)render:(UIImageView*)imageView withClass:(NSString*)className;

@end
