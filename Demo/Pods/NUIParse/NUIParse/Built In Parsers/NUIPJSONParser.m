//
//  NUIPJSONParser.m
//  NUIParse
//
//  Created by Tom Davie on 29/03/2011.
//  Copyright 2011 In The Beginning... All rights reserved.
//

#import "NUIPJSONParser.h"

#import "NUIPTokeniser.h"
#import "NUIPSLRParser.h"
#import "NUIPKeywordRecogniser.h"
#import "NUIPNumberRecogniser.h"
#import "NUIPWhiteSpaceRecogniser.h"
#import "NUIPQuotedRecogniser.h"

#import "NUIPKeywordToken.h"
#import "NUIPNumberToken.h"
#import "NUIPQuotedToken.h"
#import "NUIPWhiteSpaceToken.h"

@interface NUIPJSONParser () <NUIPParserDelegate, NUIPTokeniserDelegate>
@end

@implementation NUIPJSONParser
{
    NUIPTokeniser *jsonTokeniser;
    NUIPParser *jsonParser;
}

- (id)init
{
    self = [super init];
    
    if (nil != self)
    {
        jsonTokeniser = [[NUIPTokeniser alloc] init];
        NUIPQuotedRecogniser *stringRecogniser = [NUIPQuotedRecogniser quotedRecogniserWithStartQuote:@"\"" endQuote:@"\"" escapeSequence:@"\\" name:@"String"];
        [stringRecogniser setEscapeReplacer:^ NSString * (NSString *str, NSUInteger *loc)
         {
             if ([str length] > *loc)
             {
                 switch ([str characterAtIndex:*loc])
                 {
                     case 'b':
                         *loc = *loc + 1;
                         return @"\b";
                     case 'f':
                         *loc = *loc + 1;
                         return @"\f";
                     case 'n':
                         *loc = *loc + 1;
                         return @"\n";
                     case 'r':
                         *loc = *loc + 1;
                         return @"\r";
                     case 't':
                         *loc = *loc + 1;
                         return @"\t";
                     default:
                         break;
                 }
             }
             return nil;
         }];
        
        [jsonTokeniser addTokenRecogniser:[NUIPKeywordRecogniser recogniserForKeyword:@"{"]];
        [jsonTokeniser addTokenRecogniser:[NUIPKeywordRecogniser recogniserForKeyword:@"}"]];
        [jsonTokeniser addTokenRecogniser:[NUIPKeywordRecogniser recogniserForKeyword:@"["]];
        [jsonTokeniser addTokenRecogniser:[NUIPKeywordRecogniser recogniserForKeyword:@"]"]];
        [jsonTokeniser addTokenRecogniser:[NUIPKeywordRecogniser recogniserForKeyword:@":"]];
        [jsonTokeniser addTokenRecogniser:[NUIPKeywordRecogniser recogniserForKeyword:@","]];
        [jsonTokeniser addTokenRecogniser:[NUIPKeywordRecogniser recogniserForKeyword:@"true"]];
        [jsonTokeniser addTokenRecogniser:[NUIPKeywordRecogniser recogniserForKeyword:@"false"]];
        [jsonTokeniser addTokenRecogniser:[NUIPKeywordRecogniser recogniserForKeyword:@"null"]];
        [jsonTokeniser addTokenRecogniser:[NUIPNumberRecogniser numberRecogniser]];
        [jsonTokeniser addTokenRecogniser:stringRecogniser];
        [jsonTokeniser addTokenRecogniser:[NUIPWhiteSpaceRecogniser whiteSpaceRecogniser]];
        [jsonTokeniser setDelegate:self];
        
        NUIPGrammar *jsonGrammar = [NUIPGrammar grammarWithStart:@"value"
                                              backusNaurForm:
                                  @"0  value    ::= 'String';"
                                  @"1  value    ::= 'Number';"
                                  @"2  value    ::= <object>;"
                                  @"3  value    ::= <array>;"
                                  @"4  value    ::= <boolean>;"
                                  @"5  value    ::= 'null';"
                                  @"6  object   ::= '{' '}';"
                                  @"7  object   ::= '{' <members> '}';"
                                  @"8  members  ::= <pair>;"
                                  @"9  members  ::= <pair> ',' <members>;"
                                  @"10 pair     ::= 'String' ':' <value>;"
                                  @"11 array    ::= '[' ']';"
                                  @"12 array    ::= '[' <elements> ']';"
                                  @"13 elements ::= <value>;"
                                  @"14 elements ::= <value> ',' <elements>;"
                                  @"15 boolean  ::= 'true';"
                                  @"16 boolean  ::= 'false';"
                                                       error:NULL];
        jsonParser = [[NUIPSLRParser parserWithGrammar:jsonGrammar] retain];
        [jsonParser setDelegate:self];
    }
    
    return self;
}

- (void)dealloc
{
    [jsonTokeniser release];
    [jsonParser release];
    
    [super dealloc];
}

- (id<NSObject>)parse:(NSString *)json
{
    NUIPTokenStream *tokenStream = [jsonTokeniser tokenise:json];
    return [jsonParser parse:tokenStream];
}

- (BOOL)tokeniser:(NUIPTokeniser *)tokeniser shouldConsumeToken:(NUIPToken *)token
{
    return YES;
}

- (NSArray *)tokeniser:(NUIPTokeniser *)tokeniser willProduceToken:(NUIPToken *)token
{
    if ([token isWhiteSpaceToken])
    {
        return [NSArray array];
    }
    return [NSArray arrayWithObject:token];
}

- (id)parser:(NUIPParser *)parser didProduceSyntaxTree:(NUIPSyntaxTree *)syntaxTree
{
    NSArray *children = [syntaxTree children];
    switch ([[syntaxTree rule] tag])
    {
        case 0:
            return [(NUIPQuotedToken *)[children objectAtIndex:0] content];
        case 1:
            return [(NUIPNumberToken *)[children objectAtIndex:0] number];
        case 2:
        case 3:
        case 4:
            return [children objectAtIndex:0];
        case 5:
            return [NSNull null];
        case 6:
            return [NSDictionary dictionary];
        case 7:
            return [children objectAtIndex:1];
        case 8:
        {
            NSDictionary *p = [children objectAtIndex:0];
            return [NSMutableDictionary dictionaryWithObject:[p objectForKey:@"v"] forKey:[p objectForKey:@"k"]];
        }
        case 9:
        {
            NSDictionary *p = [children objectAtIndex:0];
            NSMutableDictionary *ms = [children objectAtIndex:2];
            [ms setObject:[p objectForKey:@"v"] forKey:[p objectForKey:@"k"]];
            return ms;
        }
        case 10:
        {
            return [NSDictionary dictionaryWithObjectsAndKeys:
                    [(NUIPQuotedToken *)[children objectAtIndex:0] content], @"k",
                    [children objectAtIndex:2], @"v",
                    nil];
        }
        case 11:
            return [NSArray array];
        case 12:
            return [children objectAtIndex:1];
        case 13:
            return [NSMutableArray arrayWithObject:[children objectAtIndex:0]];
        case 14:
        {
            NSMutableArray *es = [children objectAtIndex:2];
            [es insertObject:[children objectAtIndex:0] atIndex:0];
            return es;
        }
        case 15:
            return [NSNumber numberWithBool:YES];
        case 16:
            return [NSNumber numberWithBool:NO];
    }
    return nil;
}

@end
