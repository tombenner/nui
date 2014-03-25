//
//  NUIPShiftReduceAction.h
//  NUIParse
//
//  Created by Tom Davie on 05/03/2011.
//  Copyright 2011 In The Beginning... All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NUIPRule.h"

#import "NUIPGrammar.h"

@interface NUIPShiftReduceAction : NSObject <NSCoding>

+ (id)shiftAction:(NSUInteger)shiftLocation;
+ (id)reduceAction:(NUIPRule *)reduction;
+ (id)acceptAction;

- (id)initWithShift:(NSUInteger)shiftLocation;
- (id)initWithReductionRule:(NUIPRule *)reduction;

- (BOOL)isShiftAction;
- (BOOL)isReduceAction;
- (BOOL)isAccept;

- (NSUInteger)newState;
- (NUIPRule *)reductionRule;

- (NSString *)descriptionWithGrammar:(NUIPGrammar *)g;

- (BOOL)isEqualToShiftReduceAction:(NUIPShiftReduceAction *)object;

@end

@interface NSObject (NUIPIsShiftReduceAction)

- (BOOL)isShiftReduceAction;

@end
