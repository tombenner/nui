//
//  NUIStyleSheet.h
//  ParseTest
//
//  Created by Tony Mann on 1/14/14.
//  Copyright (c) 2014 Tom Benner. All rights reserved.
//

#import "CoreParse.h"

@interface NUIStyleSheet : NSObject <CPParseResult>

@property NSArray *ruleSets;
@property NSDictionary *definitions;

@end
