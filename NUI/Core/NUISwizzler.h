//
//  NUISwizzler.h
//  NUIDemo
//
//  Created by Tom Benner on 12/9/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "objc/runtime.h"
#import "objc/message.h"

@interface NUISwizzler : NSObject

- (void)swizzleAll;

@end
