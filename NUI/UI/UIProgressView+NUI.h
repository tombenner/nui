//
//  UIProgressView+NUI.h
//  NUIDemo
//
//  Created by Christopher Cotton on 3/13/13.
//  Copyright (c) 2013 Tom Benner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@interface UIProgressView (NUI)

+(void)renderNui:(UIProgressView*)progressView;
+(void)renderNui:(UIProgressView*)progressView withClass:(NSString*)className;

@end
