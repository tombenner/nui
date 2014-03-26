//
//  NUIPSLRParser.h
//  NUIParse
//
//  Created by Tom Davie on 06/03/2011.
//  Copyright 2011 In The Beginning... All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NUIPShiftReduceParser.h"

/**
 * The NUIPSLRParser class is a concrete implementation of NUIPParser based on the simple left-to-right parsing method.
 * 
 * The SLR parser is the fastest parser type available in NUIParse, but covers the smallest set of grammars.
 */
@interface NUIPSLRParser : NUIPShiftReduceParser

@end
