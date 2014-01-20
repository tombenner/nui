//
//  NUIMediaBlock.h
//  NUI
//
//  Created by Tony Mann on 1/14/14.
//  Copyright (c) 2014 Tom Benner. All rights reserved.
//

#import "CoreParse.h"

@interface NUIMediaBlock : NSObject<CPParseResult>

@property (strong) NSArray *ruleSets;
@property (strong) NSArray *definitions;

@end
