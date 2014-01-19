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

- (id)parser:(CPParser *)parser didProduceSyntaxTree:(CPSyntaxTree *)syntaxTree
{
    return flattenTokens(syntaxTree.children);
}

- (CPRecoveryAction *)parser:(CPParser *)parser didEncounterErrorOnInput:(CPTokenStream *)inputStream expecting:(NSSet *)acceptableTokens
{
    return [CPRecoveryAction recoveryActionStop];
}

NSString *flattenTokens(NSArray *tokens)
{
    NSMutableString *contents = [NSMutableString string];
    
    for (id token in tokens) {
        if ([token isKeywordToken]) {
            [contents appendString:[token keyword]];
        } else if ([token isIdentifierToken]) {
            [contents appendString:[token identifier]];
        } else if ([token isKindOfClass:[NUIVariableToken class]]) {
            [contents appendString:[token variable]];
        } else if ([token isKindOfClass:[NSString class]]) {
            [contents appendString:token];
        } else if ([token isKindOfClass:[NSArray class]]) {
            [contents appendString:flattenTokens(token)];
        } else {
            [NSException raise:@"Unexpected value token" format:nil];
        }
    }
    
    return contents;
}

@end
