//
//  NUIPShiftReduceActionTable.h
//  NUIParse
//
//  Created by Tom Davie on 05/03/2011.
//  Copyright 2011 In The Beginning... All rights reserved.
//

#import <Foundation/Foundation.h>

@class NUIPShiftReduceAction;

#import "NUIPToken.h"
#import "NUIPGrammar.h"

@interface NUIPShiftReduceActionTable : NSObject <NSCoding>
{}

- (id)initWithCapacity:(NSUInteger)capacity;

- (BOOL)setAction:(NUIPShiftReduceAction *)action forState:(NSUInteger)state name:(NSString *)token;

- (NUIPShiftReduceAction *)actionForState:(NSUInteger)state token:(NUIPToken *)token;
- (NSSet *)acceptableTokenNamesForState:(NSUInteger)state;

- (NSString *)descriptionWithGrammar:(NUIPGrammar *)g;

@end
