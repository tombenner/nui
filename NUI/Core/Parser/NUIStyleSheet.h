//
//  NUIStyleSheet.h
//  ParseTest
//
//  Created by Tony Mann on 1/14/14.
//  Copyright (c) 2014 Tom Benner. All rights reserved.
//

#import "NUIParse.h"

@interface NUIStyleSheet : NSObject <NUIPParseResult>

@property NSArray *ruleSets;
@property NSArray *definitions;

@end
