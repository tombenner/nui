//
//  NUIVariableToken.h
//  ParseTest
//
//  Created by Tony Mann on 1/14/14.
//  Copyright (c) 2014 Tom Benner. All rights reserved.

#import "NUIParse.h"

@interface NUIVariableToken : NUIPToken

@property NSString *variable;
- (id)initWithIdentifierToken:(NUIPIdentifierToken *)token;

@end
