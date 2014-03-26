//
//  NUIPLR1Parser.m
//  NUIParse
//
//  Created by Tom Davie on 12/03/2011.
//  Copyright 2011 In The Beginning... All rights reserved.
//

#import "NUIPLR1Parser.h"

#import "NUIPShiftReduceParserProtectedMethods.h"

#import "NUIPLR1Item.h"
#import "NSSetFunctional.h"

#import "NUIPShiftReduceAction.h"

#import "NUIPGrammarInternal.h"

@interface NUIPLR1Parser ()

- (BOOL)constructShiftReduceTables;

- (NSArray *)kernelsForGrammar:(NUIPGrammar *)aug;

@end

@implementation NUIPLR1Parser

- (BOOL)constructShiftReduceTables
{
    NUIPGrammar *aug = [[self grammar] augmentedGrammar];
    NSArray *kernels = [self kernelsForGrammar:aug];
    NSUInteger itemCount = [kernels count];
    NSArray *allNonTerminalNames = [[self grammar] allNonTerminalNames];
    NSString *startSymbol = [aug start];
    
    [self setActionTable:[[[NUIPShiftReduceActionTable alloc] initWithCapacity:itemCount] autorelease]];
    [self setGotoTable:  [[[NUIPShiftReduceGotoTable   alloc] initWithCapacity:itemCount] autorelease]];
    
    NSUInteger idx = 0;
    for (NSSet *kernel in kernels)
    {
        NSSet *itemsSet = [aug lr1Closure:kernel];
        for (NUIPLR1Item *item in itemsSet)
        {
            NUIPGrammarSymbol *next = [item nextSymbol];
            if (nil == next)
            {
                if ([[[item rule] name] isEqualToString:startSymbol])
                {
                    BOOL success = [[self actionTable] setAction:[NUIPShiftReduceAction acceptAction] forState:idx name:@"EOF"];
                    if (!success)
                    {
                        return NO;
                    }
                }
                else
                {
                    BOOL success = [[self actionTable] setAction:[NUIPShiftReduceAction reduceAction:[item rule]] forState:idx name:[[item terminal] name]];
                    if (!success)
                    {
                        return NO;
                    }
                }
            }
            else if ([next isTerminal])
            {
                NSSet *g = [aug lr1GotoKernelWithItems:itemsSet symbol:next];
                NSUInteger ix = [kernels indexOfObject:g];
                BOOL success = [[self actionTable] setAction:[NUIPShiftReduceAction shiftAction:ix] forState:idx name:[next name]];
                if (!success)
                {
                    return NO;
                }
            }
        }
        
        for (NSString *nonTerminalName in allNonTerminalNames)
        {
            NSSet *g = [aug lr1GotoKernelWithItems:itemsSet symbol:[NUIPGrammarSymbol nonTerminalWithName:nonTerminalName]];
            NSUInteger gotoIndex = [kernels indexOfObject:g];
            BOOL success = [[self gotoTable] setGoto:gotoIndex forState:idx nonTerminalNamed:nonTerminalName];
            if (!success)
            {
                return NO;
            }
        }

        idx++;
    }
        
    return YES;
}

- (NSArray *)kernelsForGrammar:(NUIPGrammar *)aug
{
    NUIPRule *startRule = [[aug rulesForNonTerminalWithName:[aug start]] objectAtIndex:0];
    NSSet *initialKernel = [NSSet setWithObject:[NUIPLR1Item lr1ItemWithRule:startRule position:0 terminal:[NUIPGrammarSymbol terminalWithName:@"EOF"]]];
    NSMutableArray *c = [NSMutableArray arrayWithObject:initialKernel];
    NSMutableArray *processingQueue = [NSMutableArray arrayWithObject:initialKernel];
    
    while ([processingQueue count] > 0)
    {
        NSSet *kernels = [processingQueue objectAtIndex:0];
        NSSet *itemSet = [aug lr1Closure:kernels];
        NSSet *validNexts = [itemSet cp_map:^ id (NUIPItem *item)
                             {
                                 return [item nextSymbol];
                             }];
        
        for (NUIPGrammarSymbol *s in validNexts)
        {
            NSSet *g = [aug lr1GotoKernelWithItems:itemSet symbol:s];
            if (![c containsObject:g])
            {
                [processingQueue addObject:g];
                [c addObject:g];
            }
        }
        
        [processingQueue removeObjectAtIndex:0];
    }
    
    return c;
}

@end
