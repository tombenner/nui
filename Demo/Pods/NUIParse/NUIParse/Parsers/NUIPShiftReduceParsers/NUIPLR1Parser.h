//
//  NUIPLR1Parser.h
//  NUIParse
//
//  Created by Tom Davie on 12/03/2011.
//  Copyright 2011 In The Beginning... All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NUIPShiftReduceParser.h"

/**
 * The NUIPLR1Parser class is a concrete implementation of NUIPParser based on the left-to-right parsing method with a one symbol lookahead.
 * 
 * The LR1 parser is the slowest parser type available in NUIParse, but covers the largest set of grammars.  LR1 parsers may consume significant amounts of memory.
 */
@interface NUIPLR1Parser : NUIPShiftReduceParser

@end
