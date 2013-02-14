//
//  NUIControlRenderer.h
//  NUIDemo
//
//  Created by Alejandro Isaza on 13-01-30.
//  Copyright (c) 2013 Tom Benner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import "NUISettings.h"

@interface NUIControlRenderer : NSObject

+ (void)render:(UIControl*)control withClass:(NSString*)className;

@end
