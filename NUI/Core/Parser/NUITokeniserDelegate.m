//
//  NUITokeniserDelegate.m
//  ParseTest
//
//  Created by Tony Mann on 1/14/14.
//  Copyright (c) 2014 Tom Benner. All rights reserved.

#import <NUIParse/NUIParse.h>
#import "NUITokeniserDelegate.h"
#import "NUIVariableTokenWrapper.h"

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
            NUIVariableTokenWrapper *varToken  = [[NUIVariableTokenWrapper alloc] initWithIdentifierToken:idToken];
            [stream pushToken:[varToken getToken]];
            return;
        }
    }
    
    [stream pushToken:token];
}

@end
