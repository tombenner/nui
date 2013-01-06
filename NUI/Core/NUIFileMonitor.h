//
//  NUIFileMonitor.h
//  NUIDemo
//
//  Created by Tom Benner on 1/5/13.
//  Copyright (c) 2013 Tom Benner. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NUIFileMonitor : NSObject

+(void)watch:(NSString*)path withCallback:(void(^)())handler;

@end
