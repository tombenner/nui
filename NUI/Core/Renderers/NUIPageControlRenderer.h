//
//  NUIPageControlRenderer.h
//  NUIDemo
//
//  Created by Yuichi Fujiki on 01/29/16.
//  Copyright (c) 2016 Yuichi Fujiki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import "NUIGraphics.h"
#import "NUIRenderer.h"
#import "NUISettings.h"

@interface NUIPageControlRenderer : NSObject

+ (void)render:(UIPageControl*)pageControl withClass:(NSString*)className;

@end
