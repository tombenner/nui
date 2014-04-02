//
//  NUITokeniserDelegate.m
//  ParseTest
//
//  Created by Tony Mann on 1/14/14.
//  Copyright (c) 2014 Tom Benner. All rights reserved.

#import "NUITokeniserDelegate.h"
#import "NUIVariableToken.h"

@implementation NUITokeniserDelegate

- (BOOL)tokeniser:(NUIPTokeniser *)tokeniser shouldConsumeToken:(NUIPToken *)token
{
    return YES;
}

- (void)tokeniser:(NUIPTokeniser *)tokeniser requestsToken:(NUIPToken *)token pushedOntoStream:(NUIPTokenStream *)stream
{
    if ([token isWhiteSpaceToken] || [[token name] isEqualToString:@"Comment"])
        return;
    
    if ([token isIdentifierToken]) {
        NUIPIdentifierToken *idToken =  (NUIPIdentifierToken *)token;
        
        if ([idToken.identifier hasPrefix:@"@"]) {
            NUIVariableToken *varToken  = [[NUIVariableToken alloc] initWithIdentifierToken:idToken];
            [stream pushToken:varToken];
            return;
        }
    }
    
    [stream pushToken:token];
}

@end
