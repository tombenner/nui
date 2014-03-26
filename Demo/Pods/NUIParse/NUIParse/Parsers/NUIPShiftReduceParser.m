//
//  NUIPLALR1Parser.m
//  NUIParse
//
//  Created by Tom Davie on 05/03/2011.
//  Copyright 2011 In The Beginning... All rights reserved.
//

#import "NUIPShiftReduceParserProtectedMethods.h"

#import "NUIPErrorToken.h"

#import "NUIPShiftReduceAction.h"
#import "NUIPShiftReduceState.h"

#import "NUIPGrammarSymbol.h"

#import "NUIPRHSItemResult.h"

@interface NUIPShiftReduceParser ()

- (NUIPShiftReduceAction *)actionForState:(NSUInteger)state token:(NUIPToken *)token;
- (NSSet *)acceptableTokenNamesForState:(NSUInteger)state;
- (NSUInteger)gotoForState:(NSUInteger)state rule:(NUIPRule *)rule;

- (NUIPRecoveryAction *)error:(NUIPTokenStream *)tokenStream expecting:(NSSet *)acceptableTokens;

@end

@implementation NUIPShiftReduceParser

@synthesize actionTable;
@synthesize gotoTable;

- (id)initWithGrammar:(NUIPGrammar *)grammar
{
    self = [super initWithGrammar:grammar];
    
    if (nil != self)
    {
        BOOL succes = [self constructShiftReduceTables];
        if (!succes)
        {
            [self release];
            return nil;
        }
    }
    
    return self;
}

#define NUIPShiftReduceParserGrammarKey     @"g"
#define NUIPShiftReduceParserActionTableKey @"at"
#define NUIPShiftReduceParserGotoTableKey   @"gt"

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithGrammar:[aDecoder decodeObjectForKey:NUIPShiftReduceParserGrammarKey]];
    
    if (nil != self)
    {
        [self setActionTable:[aDecoder decodeObjectForKey:NUIPShiftReduceParserActionTableKey]];
        [self setGotoTable:[aDecoder decodeObjectForKey:NUIPShiftReduceParserGotoTableKey]];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:[self grammar]     forKey:NUIPShiftReduceParserGrammarKey];
    [aCoder encodeObject:[self actionTable] forKey:NUIPShiftReduceParserActionTableKey];
    [aCoder encodeObject:[self gotoTable]   forKey:NUIPShiftReduceParserGotoTableKey];
}

- (void)dealloc
{
    [actionTable release];
    [gotoTable release];
    
    [super dealloc];
}

- (BOOL)constructShiftReduceTables
{
    NSLog(@"NUIPShiftReduceParser is abstract, use one of it's concrete subclasses instead");
    return NO;
}

#define kNUIPStopParsingException @"NUIPStopParsingException"

- (id)parse:(NUIPTokenStream *)tokenStream
{
    @try
    {
        NSMutableArray *stateStack = [NSMutableArray arrayWithObject:[NUIPShiftReduceState shiftReduceStateWithObject:nil state:0]];
        NUIPToken *nextToken = [[tokenStream peekToken] retain];
        BOOL hasErrorToken = NO;
        while (1)
        {
            @autoreleasepool
            {
                NUIPShiftReduceAction *action = [self actionForState:[(NUIPShiftReduceState *)[stateStack lastObject] state] token:nextToken];
                
                if ([action isShiftAction])
                {
                    [stateStack addObject:[NUIPShiftReduceState shiftReduceStateWithObject:nextToken state:[action newState]]];
                    if (!hasErrorToken)
                    {
                        [tokenStream popToken];
                    }
                    [nextToken release];
                    nextToken = [[tokenStream peekToken] retain];
                    hasErrorToken = NO;
                }
                else if ([action isReduceAction])
                {
                    NUIPRule *reductionRule = [action reductionRule];
                    NSUInteger numElements = [[reductionRule rightHandSideElements] count];
                    NSMutableArray *components = [NSMutableArray arrayWithCapacity:numElements];
                    NSRange stateStackRange = NSMakeRange([stateStack count] - numElements, numElements);
                    NSMutableDictionary *tagValues = [NSMutableDictionary dictionary];
                    [stateStack enumerateObjectsAtIndexes:[NSIndexSet indexSetWithIndexesInRange:stateStackRange]
                                                  options:NSEnumerationReverse
                                               usingBlock:^(NUIPShiftReduceState *state, NSUInteger idx, BOOL *stop)
                     {
                         id o = [state object];
                         if ([o isRHSItemResult])
                         {
                             NUIPRHSItemResult *r = o;
                             
                             if ([o shouldCollapse])
                             {
                                 NSArray *comps = [r contents];
                                 [components insertObjects:comps atIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, [comps count])]];
                                 
                                 if ([r tagNames] != nil && [comps count] == 1)
                                 {
                                     for (NSString *tagName in [r tagNames])
                                     {
                                         [tagValues setObject:[comps objectAtIndex:0] forKey:tagName];
                                     }
                                 }
                             }
                             else
                             {
                                 [components insertObject:[r contents] atIndex:0];
                                 if ([r tagNames] != nil)
                                 {
                                     for (NSString *tagName in [r tagNames])
                                     {
                                         [tagValues setObject:[r contents] forKey:tagName];
                                     }
                                 }
                             }
                             
                             [tagValues addEntriesFromDictionary:[r tagValues]];
                         }
                         else
                         {
                             [components insertObject:o atIndex:0];
                         }
                     }];
                    [stateStack removeObjectsInRange:stateStackRange];
                    
                    NUIPSyntaxTree *tree = [NUIPSyntaxTree syntaxTreeWithRule:reductionRule children:components tagValues:tagValues];
                    id result = nil;
                    
                    Class c = [reductionRule representitiveClass];
                    if (nil != c)
                    {
                        result = [[(id<NUIPParseResult>)[c alloc] initWithSyntaxTree:tree] autorelease];
                    }
                    
                    if (nil == result)
                    {
                        result = tree;
                        if (delegateRespondsTo.didProduceSyntaxTree)
                        {
                            result = [[self delegate] parser:self didProduceSyntaxTree:tree];
                        }
                    }
                    
                    NSUInteger newState = [self gotoForState:[(NUIPShiftReduceState *)[stateStack lastObject] state] rule:reductionRule];
                    [stateStack addObject:[NUIPShiftReduceState shiftReduceStateWithObject:result state:newState]];
                }
                else if ([action isAccept])
                {
                    [nextToken release];
                    return [(NUIPShiftReduceState *)[stateStack lastObject] object];
                }
                else
                {
                    NUIPRecoveryAction *recoveryAction = [self error:tokenStream expecting:[self acceptableTokenNamesForState:[(NUIPShiftReduceState *)[stateStack lastObject] state]]];
                    if (nil == recoveryAction)
                    {
                        if ([nextToken isErrorToken] && [stateStack count] > 0)
                        {
                            [stateStack removeLastObject];
                        }
                        else
                        {
                            [nextToken release];
                            return nil;
                        }
                    }
                    else
                    {
                        switch ([recoveryAction recoveryType])
                        {
                            case NUIPRecoveryTypeAddToken:
                                [nextToken release];
                                nextToken = [[recoveryAction additionalToken] retain];
                                hasErrorToken = YES;
                                break;
                            case NUIPRecoveryTypeRemoveToken:
                                [tokenStream popToken];
                                [nextToken release];
                                nextToken = [[tokenStream peekToken] retain];
                                hasErrorToken = NO;
                                break;
                            case NUIPRecoveryTypeBail:
                                [NSException raise:kNUIPStopParsingException format:@""];
                                break;
                            default:
                                break;
                        }
                    }
                }
            }
        }
    }
    @catch (NSException *e)
    {
        if (![[e name] isEqualToString:kNUIPStopParsingException])
        {
            [e raise];
        }
        return nil;
    }
}

- (NUIPRecoveryAction *)error:(NUIPTokenStream *)tokenStream expecting:(NSSet *)acceptableTokens
{
    if (delegateRespondsTo.didEncounterErrorOnInputExpecting)
    {
        return [[self delegate] parser:self didEncounterErrorOnInput:tokenStream expecting:acceptableTokens];
    }
    else if (delegateRespondsTo.didEncounterErrorOnInput)
    {
        return [[self delegate] performSelector:@selector(parser:didEncounterErrorOnInput:) withObject:self withObject:tokenStream];
//        return [[self delegate] parser:self didEncounterErrorOnInput:tokenStream];
    }
    else
    {
        NUIPToken *t = [tokenStream peekToken];
        NSLog(@"%ld:%ld: parse error.  Expected %@, found %@", (long)[t lineNumber] + 1, (long)[t columnNumber] + 1, acceptableTokens, t);
        return nil;
    }
}

- (NUIPShiftReduceAction *)actionForState:(NSUInteger)state token:(NUIPToken *)token
{
    return [[self actionTable] actionForState:state token:token];
}

- (NSSet *)acceptableTokenNamesForState:(NSUInteger)state
{
    return [[self actionTable] acceptableTokenNamesForState:state];
}

- (NSUInteger)gotoForState:(NSUInteger)state rule:(NUIPRule *)rule
{
    return [[self gotoTable] gotoForState:state rule:rule];
}

@end
