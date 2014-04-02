//
//  NUIDeclaration.h
//  NUI
//
//  Created by Tony Mann on 1/14/14.
//  Copyright (c) 2014 Tom Benner. All rights reserved.
//

#import "NUIParse.h"

@interface NUIDeclaration : NSObject<NUIPParseResult>

@property (strong) NSString *property;
@property (strong) NSString *value;

@end
