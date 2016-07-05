//
//  NUIPreprocessor.h
//  NUIDemo
//
//  Created by imihaly on 04/07/16.
//  Copyright © 2016 Tom Benner. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NUIPreprocessor : NSObject

+ (NSString *)preprocessFileAtPath:(NSString *)path;
+ (NSArray<NSString *> *)dependenciesOfFileAtPath:(NSString *)path;

@end
