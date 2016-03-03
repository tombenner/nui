//
//  NUIVariableToken.m
//  ParseTest
//
//  Created by Tony Mann on 1/14/14.
//  Copyright (c) 2014 Tom Benner. All rights reserved.

#import <NUIParse/NUIParse.h>
#import "NUIVariableTokenWrapper.h"

@interface NUIVariableToken : NUIPToken
@property NSString *variable;
- (id)initWithIdentifierToken:(NUIPIdentifierToken *)token;
@end

@implementation NUIVariableToken

- (NSString *)name
{
    return @"Variable";
}

- (id)initWithIdentifierToken:(NUIPIdentifierToken *)token
{
    
    if (self) {
        self.variable        = token.identifier;
        self.length          = token.length;
        self.lineNumber      = token.lineNumber;
        self.columnNumber    = token.columnNumber;
        self.characterNumber = token.characterNumber;
    }
    
    return self;
}

@end
@implementation NUIVariableTokenWrapper

NUIVariableToken *pToken;

- (id)initWithIdentifierToken:(NUIPIdentifierToken *)token
{
    
    if (self) {
        pToken = [[NUIVariableToken alloc] initWithIdentifierToken: token];
    }
    
    return self;
}

- (id)getToken
{
    return pToken;
}
@end
