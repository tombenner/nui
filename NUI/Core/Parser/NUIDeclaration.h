//
//  NUIDeclaration.h
//  NUI
//
//  Created by Tony Mann on 1/14/14.
//  Copyright (c) 2014 Tom Benner. All rights reserved.
//

#import "CoreParse.h"

@interface NUIDeclaration : NSObject<CPParseResult>

@property (strong) NSString *property;
@property (strong) NSString *value;

@end
