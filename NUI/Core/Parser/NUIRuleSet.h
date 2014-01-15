//
//  NUIRuleSet.h
//  NUI
//
//  Created by Tony Mann on 1/14/14.
//  Copyright (c) 2014 Tom Benner. All rights reserved.
//

#import "CoreParse.h"

@interface NUIRuleSet : NSObject<CPParseResult>

@property (strong) NSArray  *selectors;
@property (strong) NSDictionary *declarations;

@end
