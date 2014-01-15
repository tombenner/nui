//
//  Definition.h
//  ParseTest
//
//  Created by Tony Mann on 1/14/14.
//  Copyright (c) 2014 Tom Benner. All rights reserved.
//

#import "CoreParse.h"

@interface NUIDefinition : NSObject<CPParseResult>

@property (strong) NSString *variable;
@property (strong) NSString *value;

@end
