//
//  NUIPLALR1Parser.h
//  NUIParse
//
//  Created by Tom Davie on 03/04/2011.
//  Copyright 2011 In The Beginning... All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NUIPLR1Parser.h"

/**
 * The NUIPLALR1Parser class is a concrete implementation of NUIPParser based on the lookahead left-to-right parsing method with a one symbol lookahead.
 * 
 * The LALR1 parser is almost as fast as the SLR parser and covers almost as many grammars as the LR1 parser.  LALR1 parsers consume only as much memory as SLR parsers.
 */
@interface NUIPLALR1Parser : NUIPShiftReduceParser

@end
