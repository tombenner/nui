//
//  NUIVariableToken.m
//  ParseTest
//
//  Created by Tony Mann on 1/14/14.
//  Copyright (c) 2014 Tom Benner. All rights reserved.

#import "NUIVariableToken.h"

@implementation NUIVariableToken

- (NSString *)name
{
    return @"Variable";
}

- (id)initWithIdentifierToken:(NUIPIdentifierToken *)token
{
    self = [super init];
    
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
