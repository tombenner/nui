//
//  NUIVariableToken.h
//  ParseTest
//
//  Created by Tony Mann on 1/14/14.
//  Copyright (c) 2014 Tom Benner. All rights reserved.

@class NUIPIdentifierToken;

@interface NUIVariableTokenWrapper : NSObject
@property NSString *variable;
- (id)initWithIdentifierToken:(NUIPIdentifierToken *)token;
- (id)getToken;
@end


