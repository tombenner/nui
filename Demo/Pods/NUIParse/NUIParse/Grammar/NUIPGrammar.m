//
//  Grammar.m
//  NUIParse
//
//  Created by Tom Davie on 13/02/2011.
//  Copyright 2011 In The Beginning... All rights reserved.
//

#import "NUIPGrammar.h"
#import "NUIPGrammarPrivate.h"
#import "NUIPGrammarInternal.h"

#import "NUIPTokeniser.h"
#import "NUIPTokenStream.h"
#import "NUIPKeywordRecogniser.h"
#import "NUIPNumberRecogniser.h"
#import "NUIPWhitespaceRecogniser.h"
#import "NUIPWhiteSpaceToken.h"
#import "NUIPQuotedRecogniser.h"
#import "NUIPIdentifierRecogniser.h"
#import "NUIPLALR1Parser.h"
#import "NUIPIdentifierToken.h"
#import "NUIPQuotedToken.h"
#import "NUIPNumberToken.h"

#import "NUIPItem.h"
#import "NUIPLR1Item.h"

#import "NUIPRHSItem.h"
#import "NUIPRHSItem+Private.h"

#import "NSSetFunctional.h"

#import <objc/runtime.h>

@interface NUIPBNFParserDelegate : NSObject <NUIPTokeniserDelegate,NUIPParserDelegate>

@property (readwrite, retain, nonatomic) NSError *err;

@end

@implementation NUIPBNFParserDelegate

@synthesize err = _err;

- (id)parser:(NUIPParser *)parser didProduceSyntaxTree:(NUIPSyntaxTree *)syntaxTree
{
    NSArray *children = [syntaxTree children];
    switch ([[syntaxTree rule] tag])
    {
        case 0:
        {
            NSMutableArray *rules = (NSMutableArray *)[children objectAtIndex:0];
            [rules addObjectsFromArray:[children objectAtIndex:1]];
            return rules;
        }
        case 1:
            return [NSMutableArray arrayWithArray:[children objectAtIndex:0]];
        case 2:
        {
            NSArray *rules = [children objectAtIndex:1];
            for (NUIPRule *r in rules)
            {
                [r setTag:[[(NUIPNumberToken *)[children objectAtIndex:0] number] intValue]];
            }
            return rules;
        }
        case 3:
            return [children objectAtIndex:0];
        case 4:
        {
            NSArray *arrs = [children objectAtIndex:2];
            NSMutableArray *rules = [NSMutableArray arrayWithCapacity:[arrs count]];
            for (NSArray *rhs in arrs)
            {
                NSString *name = [(NUIPIdentifierToken *)[children objectAtIndex:0] identifier];
                Class c = NSClassFromString(name);
                NUIPRule *rule = nil == c || ![c conformsToProtocol:@protocol(NUIPParseResult)] ? [NUIPRule ruleWithName:name rightHandSideElements:rhs] : [NUIPRule ruleWithName:name rightHandSideElements:rhs representitiveClass:c];
                [rules addObject:rule];
            }
            return rules;
        }
        case 5:
        {
            NSMutableArray *rhs = [children objectAtIndex:0];
            [rhs addObject:[children objectAtIndex:2]];
            return rhs;
        }
        case 6:
        {
            NSMutableArray *rhs = [children objectAtIndex:0];
            [rhs addObject:[NSArray array]];
            return rhs;
        }
        case 7:
            return [NSMutableArray arrayWithObject:[children objectAtIndex:0]];
        case 8:
        {
            NSMutableArray *elements = (NSMutableArray *)[children objectAtIndex:0];
            [elements addObject:[children objectAtIndex:1]];
            return elements;
        }
        case 9:
            return [NSMutableArray arrayWithObject:[children objectAtIndex:0]];
        case 10:
            return [children objectAtIndex:0];
        case 11:
        {
            id i = [children objectAtIndex:2];
            if ([i isRHSItem])
            {
                [(NUIPRHSItem *)i addTag:[[children objectAtIndex:0] identifier]];
                return i;
            }
            else
            {
                NUIPRHSItem *newI = [[[NUIPRHSItem alloc] init] autorelease];
                [newI setAlternatives:[NSArray arrayWithObject:[NSArray arrayWithObject:i]]];
                [newI setRepeats:NO];
                [newI setMayNotExist:NO];
                [newI addTag:[[children objectAtIndex:0] identifier]];
                [newI setShouldCollapse:YES];
                return newI;
            }
        }
        case 12:
            return [children objectAtIndex:0];
        case 13:
        {
            NUIPRHSItem *i = [[[NUIPRHSItem alloc] init] autorelease];
            [i setAlternatives:[NSArray arrayWithObject:[NSArray arrayWithObject:[children objectAtIndex:0]]]];
            NSString *symbol = [(NUIPKeywordToken *)[children objectAtIndex:1] keyword];
            if ([symbol isEqualToString:@"*"])
            {
                [i setRepeats:YES];
                [i setMayNotExist:YES];
            }
            else if ([symbol isEqualToString:@"+"])
            {
                [i setRepeats:YES];
                [i setMayNotExist:NO];
            }
            else
            {
                [i setRepeats:NO];
                [i setMayNotExist:YES];
            }
            return i;
        }
        case 14:
            return [children objectAtIndex:0];
        case 15:
        {
            NUIPRHSItem *i = [[[NUIPRHSItem alloc] init] autorelease];
            [i setAlternatives:[children objectAtIndex:1]];
            [i setRepeats:NO];
            [i setMayNotExist:NO];
            return i;
        }
        case 16:
        case 17:
        case 18:
        case 19:
        case 20:
            return [children objectAtIndex:0];
            return [children objectAtIndex:0];
        case 21:
            return [NUIPGrammarSymbol nonTerminalWithName:[(NUIPIdentifierToken *)[children objectAtIndex:1] identifier]];
        case 22:
            return [NUIPGrammarSymbol terminalWithName:[(NUIPQuotedToken *)[children objectAtIndex:0] content]];
        default:
            return syntaxTree;
    }
}

- (NUIPRecoveryAction *)parser:(NUIPParser *)parser didEncounterErrorOnInput:(NUIPTokenStream *)inputStream expecting:(NSSet *)acceptableTokens
{
    NUIPToken *t = [inputStream peekToken];
    [self setErr:[NSError errorWithDomain:NUIPEBNFParserErrorDomain
                                     code:NUIPErrorCodeCouldNotParseEBNF
                                 userInfo:[NSDictionary dictionaryWithObjectsAndKeys:
                                           [NSString stringWithFormat:@"Could not parse EBNF for grammar.  %ld:%ld: Found %@, Expected %@.", (long)[t lineNumber] + 1, (long)[t columnNumber] + 1, t, acceptableTokens], NSLocalizedDescriptionKey,
                                           nil]]];
    return [NUIPRecoveryAction recoveryActionStop];
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

@end

@implementation NUIPGrammar

@synthesize start;

+ (id)grammarWithStart:(NSString *)start rules:(NSArray *)rules
{
    return [[[self alloc] initWithStart:start rules:rules] autorelease];
}

- (id)initWithStart:(NSString *)initStart rules:(NSArray *)initRules;
{
    self = [super init];
    
    if (nil != self)
    {
        [self setStart:initStart];
        [self setRules:initRules];
        [self setFollowCache:[NSMutableDictionary dictionary]];
    }
    
    return self;
}

+ (id)grammarWithStart:(NSString *)start backusNaurForm:(NSString *)bnf
{
    return [[[self alloc] initWithStart:start backusNaurForm:bnf] autorelease];
}

+ (id)grammarWithStart:(NSString *)start backusNaurForm:(NSString *)bnf error:(NSError **)error
{
    return [[[self alloc] initWithStart:start backusNaurForm:bnf error:error] autorelease];
}

- (id)initWithStart:(NSString *)initStart backusNaurForm:(NSString *)bnf
{
    NSError *err = nil;
    self = [self initWithStart:initStart backusNaurForm:bnf error:&err];
    if (nil == self)
    {
        NSLog(@"=== Core Parse Error ===");
        NSLog(@"%@", err);
    }
    return self;
}

- (id)initWithStart:(NSString *)initStart backusNaurForm:(NSString *)bnf error:(NSError **)error
{
    NUIPBNFParserDelegate *del = [[[NUIPBNFParserDelegate alloc] init] autorelease];
    NUIPTokeniser *tokeniser = [[[NUIPTokeniser alloc] init] autorelease];
    [tokeniser addTokenRecogniser:[NUIPKeywordRecogniser recogniserForKeyword:@"::="]];
    [tokeniser addTokenRecogniser:[NUIPKeywordRecogniser recogniserForKeyword:@"@"]];
    [tokeniser addTokenRecogniser:[NUIPKeywordRecogniser recogniserForKeyword:@"<"]];
    [tokeniser addTokenRecogniser:[NUIPKeywordRecogniser recogniserForKeyword:@">"]];
    [tokeniser addTokenRecogniser:[NUIPKeywordRecogniser recogniserForKeyword:@"("]];
    [tokeniser addTokenRecogniser:[NUIPKeywordRecogniser recogniserForKeyword:@")"]];
    [tokeniser addTokenRecogniser:[NUIPKeywordRecogniser recogniserForKeyword:@"*"]];
    [tokeniser addTokenRecogniser:[NUIPKeywordRecogniser recogniserForKeyword:@"+"]];
    [tokeniser addTokenRecogniser:[NUIPKeywordRecogniser recogniserForKeyword:@"?"]];
    [tokeniser addTokenRecogniser:[NUIPKeywordRecogniser recogniserForKeyword:@"|"]];
    [tokeniser addTokenRecogniser:[NUIPKeywordRecogniser recogniserForKeyword:@";"]];
    [tokeniser addTokenRecogniser:[NUIPNumberRecogniser integerRecogniser]];
    [tokeniser addTokenRecogniser:[NUIPQuotedRecogniser quotedRecogniserWithStartQuote:@"\"" endQuote:@"\"" escapeSequence:@"\\" name:@"String"]];
    [tokeniser addTokenRecogniser:[NUIPQuotedRecogniser quotedRecogniserWithStartQuote:@"'" endQuote:@"'" escapeSequence:@"\\" name:@"String"]];
    [tokeniser addTokenRecogniser:[NUIPIdentifierRecogniser identifierRecogniser]];
    [tokeniser addTokenRecogniser:[NUIPWhiteSpaceRecogniser whiteSpaceRecogniser]];
    [tokeniser setDelegate:del];
    NUIPTokenStream *tokenStream = [tokeniser tokenise:bnf];
    
    NUIPRule *ruleset1 = [NUIPRule ruleWithName:@"ruleset" rightHandSideElements:[NSArray arrayWithObjects:[NUIPGrammarSymbol nonTerminalWithName:@"ruleset"], [NUIPGrammarSymbol nonTerminalWithName:@"rule"], nil] tag:0];
    NUIPRule *ruleset2 = [NUIPRule ruleWithName:@"ruleset" rightHandSideElements:[NSArray arrayWithObjects:[NUIPGrammarSymbol nonTerminalWithName:@"rule"], nil] tag:1];
    
    NUIPRule *rule1 = [NUIPRule ruleWithName:@"rule" rightHandSideElements:[NSArray arrayWithObjects:[NUIPGrammarSymbol terminalWithName:@"Number"], [NUIPGrammarSymbol nonTerminalWithName:@"unNumbered"], nil] tag:2];
    NUIPRule *rule2 = [NUIPRule ruleWithName:@"rule" rightHandSideElements:[NSArray arrayWithObjects:[NUIPGrammarSymbol nonTerminalWithName:@"unNumbered"], nil] tag:3];
    
    NUIPRule *unNumbered = [NUIPRule ruleWithName:@"unNumbered" rightHandSideElements:[NSArray arrayWithObjects:[NUIPGrammarSymbol terminalWithName:@"Identifier"], [NUIPGrammarSymbol terminalWithName:@"::="], [NUIPGrammarSymbol nonTerminalWithName:@"rightHandSide"], [NUIPGrammarSymbol terminalWithName:@";"], nil] tag:4];
    
    NUIPRule *rightHandSide1 = [NUIPRule ruleWithName:@"rightHandSide" rightHandSideElements:[NSArray arrayWithObjects:[NUIPGrammarSymbol nonTerminalWithName:@"rightHandSide"], [NUIPGrammarSymbol terminalWithName:@"|"], [NUIPGrammarSymbol nonTerminalWithName:@"sumset"], nil] tag:5];
    NUIPRule *rightHandSide2 = [NUIPRule ruleWithName:@"rightHandSide" rightHandSideElements:[NSArray arrayWithObjects:[NUIPGrammarSymbol nonTerminalWithName:@"rightHandSide"], [NUIPGrammarSymbol terminalWithName:@"|"], nil] tag:6];
    NUIPRule *rightHandSide3 = [NUIPRule ruleWithName:@"rightHandSide" rightHandSideElements:[NSArray arrayWithObjects:[NUIPGrammarSymbol nonTerminalWithName:@"sumset"], nil] tag:7];
    
    NUIPRule *sumset1 = [NUIPRule ruleWithName:@"sumset" rightHandSideElements:[NSArray arrayWithObjects:[NUIPGrammarSymbol nonTerminalWithName:@"sumset"], [NUIPGrammarSymbol nonTerminalWithName:@"taggedRightHandSideItem"], nil] tag:8];
    NUIPRule *sumset2 = [NUIPRule ruleWithName:@"sumset" rightHandSideElements:[NSArray arrayWithObjects:[NUIPGrammarSymbol nonTerminalWithName:@"taggedRightHandSideItem"], nil] tag:9];
    
    NUIPRule *taggedRightHandSideItem1 = [NUIPRule ruleWithName:@"taggedRightHandSideItem" rightHandSideElements:[NSArray arrayWithObjects:[NUIPGrammarSymbol nonTerminalWithName:@"rightHandSideItem"], nil] tag:10];
    NUIPRule *taggedRightHandSideItem2 = [NUIPRule ruleWithName:@"taggedRightHandSideItem" rightHandSideElements:[NSArray arrayWithObjects:[NUIPGrammarSymbol terminalWithName:@"Identifier"], [NUIPGrammarSymbol terminalWithName:@"@"], [NUIPGrammarSymbol nonTerminalWithName:@"taggedRightHandSideItem"], nil] tag:11];
    
    NUIPRule *rightHandSideItem1 = [NUIPRule ruleWithName:@"rightHandSideItem" rightHandSideElements:[NSArray arrayWithObject:[NUIPGrammarSymbol nonTerminalWithName:@"unit"]] tag:12];
    NUIPRule *rightHandSideItem2 = [NUIPRule ruleWithName:@"rightHandSideItem" rightHandSideElements:[NSArray arrayWithObjects:[NUIPGrammarSymbol nonTerminalWithName:@"unit"], [NUIPGrammarSymbol nonTerminalWithName:@"repeatSymbol"], nil] tag:13];
    
    NUIPRule *unit1 = [NUIPRule ruleWithName:@"unit" rightHandSideElements:[NSArray arrayWithObject:[NUIPGrammarSymbol nonTerminalWithName:@"grammarSymbol"]] tag:14];
    NUIPRule *unit2 = [NUIPRule ruleWithName:@"unit" rightHandSideElements:[NSArray arrayWithObjects:[NUIPGrammarSymbol terminalWithName:@"("], [NUIPGrammarSymbol nonTerminalWithName:@"rightHandSide"], [NUIPGrammarSymbol terminalWithName:@")"], nil] tag:15];
    
    NUIPRule *repeatSymbol1 = [NUIPRule ruleWithName:@"repeatSymbol" rightHandSideElements:[NSArray arrayWithObject:[NUIPGrammarSymbol terminalWithName:@"*"]] tag:16];
    NUIPRule *repeatSymbol2 = [NUIPRule ruleWithName:@"repeatSymbol" rightHandSideElements:[NSArray arrayWithObject:[NUIPGrammarSymbol terminalWithName:@"+"]] tag:17];
    NUIPRule *repeatSymbol3 = [NUIPRule ruleWithName:@"repeatSymbol" rightHandSideElements:[NSArray arrayWithObject:[NUIPGrammarSymbol terminalWithName:@"?"]] tag:18];
    
    NUIPRule *grammarSymbol1 = [NUIPRule ruleWithName:@"grammarSymbol" rightHandSideElements:[NSArray arrayWithObjects:[NUIPGrammarSymbol nonTerminalWithName:@"nonterminal"], nil] tag:19];
    NUIPRule *grammarSymbol2 = [NUIPRule ruleWithName:@"grammarSymbol" rightHandSideElements:[NSArray arrayWithObjects:[NUIPGrammarSymbol nonTerminalWithName:@"terminal"], nil] tag:20];
    
    NUIPRule *nonterminal = [NUIPRule ruleWithName:@"nonterminal" rightHandSideElements:[NSArray arrayWithObjects:[NUIPGrammarSymbol terminalWithName:@"<"], [NUIPGrammarSymbol terminalWithName:@"Identifier"], [NUIPGrammarSymbol terminalWithName:@">"], nil] tag:21];
    
    NUIPRule *terminal = [NUIPRule ruleWithName:@"terminal" rightHandSideElements:[NSArray arrayWithObjects:[NUIPGrammarSymbol terminalWithName:@"String"], nil] tag:22];
    
    NUIPGrammar *bnfGrammar = [NUIPGrammar grammarWithStart:@"ruleset" rules:[NSArray arrayWithObjects:ruleset1, ruleset2, rule1, rule2, unNumbered, rightHandSide1, rightHandSide2, rightHandSide3, sumset1, sumset2, taggedRightHandSideItem1, taggedRightHandSideItem2, rightHandSideItem1, rightHandSideItem2, unit1, unit2, repeatSymbol1, repeatSymbol2, repeatSymbol3, grammarSymbol1, grammarSymbol2, nonterminal, terminal, nil]];
    NUIPParser *parser = [NUIPLALR1Parser parserWithGrammar:bnfGrammar];
    [parser setDelegate:del];
    
    NSMutableArray *initRules = [parser parse:tokenStream];
    
    if ([del err] != nil)
    {
        if (NULL != error)
        {
            *error = [[[del err] copy] autorelease];
        }
        [self release];
        return nil;
    }
    
    NSError *e = [self checkForMissingNonTerminalsInRules:initRules];
    if (nil != e)
    {
        if (NULL != error)
        {
            *error = e;
        }
        [self release];
        return nil;
    }
    
    NSArray *newRules = [self tidyRightHandSides:initRules error:error];
    if (nil == newRules)
    {
        [self release];
        return nil;
    }
    
    return [self initWithStart:initStart rules:newRules];
}

- (id)init
{
    return [self initWithStart:nil rules:[NSArray array]];
}

#define NUIPGrammarStartKey @"s"
#define NUIPGrammarRulesKey @"r"

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    
    if (nil != self)
    {
        [self setStart:[aDecoder decodeObjectForKey:NUIPGrammarStartKey]];
        [self setRules:[aDecoder decodeObjectForKey:NUIPGrammarRulesKey]];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:[self start] forKey:NUIPGrammarStartKey];
    [aCoder encodeObject:[self rules] forKey:NUIPGrammarRulesKey];
}

- (void)dealloc
{
    [start release];
    [self setRules:nil];
    
    [super dealloc];
}

- (NSSet *)allRules
{
        return [NSSet setWithArray:[self rules]];
}

- (NSError *)checkForMissingNonTerminalsInRules:(NSArray *)rules
{
    NSMutableSet *definedNonTerminals = [NSMutableSet setWithCapacity:[rules count]];
    for (NUIPRule *rule in rules)
    {
        [definedNonTerminals addObject:[rule name]];
    }
    
    for (NUIPRule *rule in rules)
    {
        for (id item in [rule rightHandSideElements])
        {
            if ([item isGrammarSymbol] && ![(NUIPGrammarSymbol *)item isTerminal] && ![definedNonTerminals containsObject:[(NUIPGrammarSymbol *)item name]])
            {
                return [NSError errorWithDomain:NUIPEBNFParserErrorDomain
                                           code:NUIPErrorCodeUndefinedNonTerminal
                                       userInfo:[NSDictionary dictionaryWithObjectsAndKeys:
                                                 [NSString stringWithFormat:@"Could not find definition of %@, used in %@", [item name], rule], NSLocalizedDescriptionKey,
                                                 nil]];
            }
            else if ([item isRHSItem])
            {
                NSSet *usedNonTerminals = [(NUIPRHSItem *)item nonTerminalsUsed];
                if (![usedNonTerminals isSubsetOfSet:definedNonTerminals])
                {
                    NSMutableSet *mutableUsedNonTerminals = [[usedNonTerminals mutableCopy] autorelease];
                    [mutableUsedNonTerminals minusSet:definedNonTerminals];
                    return [NSError errorWithDomain:NUIPEBNFParserErrorDomain
                                               code:NUIPErrorCodeUndefinedNonTerminal
                                           userInfo:[NSDictionary dictionaryWithObjectsAndKeys:
                                                     [NSString stringWithFormat:@"Could not find definition of %@, used in %@", [mutableUsedNonTerminals anyObject], rule], NSLocalizedDescriptionKey,
                                                     nil]];
                }
            }
        }
    }
    
    return nil;
}

- (NSArray *)allNonTerminalNames
{
    return [[self rulesByNonTerminal] allKeys];
}

- (void)addRule:(NUIPRule *)rule
{
    NSMutableDictionary *rs = [self rulesByNonTerminal];
    NSMutableArray *arr = [rs objectForKey:[rule name]];
    if (nil == arr)
    {
        arr = [NSMutableArray array];
        [rs setObject:arr forKey:[rule name]];
    }
    [arr addObject:rule];
}

- (NSArray *)rulesForNonTerminalWithName:(NSString *)nonTerminal
{
    return [[self rulesByNonTerminal] objectForKey:nonTerminal];
}

- (NSUInteger)hash
{
    return [[self start] hash] ^ [[self rules] hash];
}

- (BOOL)isGrammar
{
    return YES;
}

- (BOOL)isEqual:(id)object
{
    return ([object isGrammar] &&
            [((NUIPGrammar *)object)->start isEqualToString:start] &&
            [[(NUIPGrammar *)object rules] isEqualToArray:[self rules]]);
}

@end
