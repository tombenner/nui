//
//  NUIPShiftReduceGotoTable.h
//  NUIParse
//
//  Created by Tom Davie on 05/03/2011.
//  Copyright 2011 In The Beginning... All rights reserved.
//

#import <Foundation/Foundation.h>

@class NUIPRule;

@interface NUIPShiftReduceGotoTable : NSObject <NSCoding>
{}

- (id)initWithCapacity:(NSUInteger)capacity;

- (BOOL)setGoto:(NSUInteger)gotoIndex forState:(NSUInteger)state nonTerminalNamed:(NSString *)nonTerminalName;

- (NSUInteger)gotoForState:(NSUInteger)state rule:(NUIPRule *)rule;

@end
