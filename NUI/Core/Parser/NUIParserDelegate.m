//
//  ParserDelegate.m
//  ParseTest
//
//  Created by Tony Mann on 1/14/14.
//  Copyright (c) 2014 Tom Benner. All rights reserved.
//

#import "NUIParserDelegate.h"
#import "NUIVariableToken.h"

NSString *flattenTokens(NSArray *tokens);

@implementation NUIParserDelegate

- (id)parser:(NUIPParser *)parser didProduceSyntaxTree:(NUIPSyntaxTree *)syntaxTree
{
    return flattenTokens(syntaxTree.children);
}

- (NUIPRecoveryAction *)parser:(NUIPParser *)parser didEncounterErrorOnInput:(NUIPTokenStream *)inputStream expecting:(NSSet *)acceptableTokens
{
    return [NUIPRecoveryAction recoveryActionStop];
}

NSString *flattenTokens(NSArray *tokens)
{
    NSMutableString *contents = [NSMutableString string];
    
    for (id token in tokens) {
        NSString *tokenString;
        
        if ([token isKeywordToken]) {
            tokenString = [token keyword];
        } else if ([token isIdentifierToken]) {
            tokenString = [token identifier];
        } else if ([token isKindOfClass:[NUIVariableToken class]]) {
            tokenString = [token variable];
        } else if ([token isKindOfClass:[NSString class]]) {
            tokenString = token;
        } else if ([token isKindOfClass:[NSArray class]]) {
            tokenString = flattenTokens(token);
        } else {
            [NSException raise:@"Unexpected value token" format:nil];
        }
        
        if (contents.length > 0)
            [contents appendFormat:@" %@", tokenString];
        else
            [contents appendString:tokenString];
    }
    
    return contents;
}

@end
