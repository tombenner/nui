//
//  NUIMediaBlock.h
//  NUI
//
//  Created by Tony Mann on 1/14/14.
//  Copyright (c) 2014 Tom Benner. All rights reserved.
//

#import "NUIParse.h"

@interface NUIMediaBlock : NSObject<NUIPParseResult>

@property (strong) NSArray *ruleSets;
@property (strong) NSArray *definitions;

@end
