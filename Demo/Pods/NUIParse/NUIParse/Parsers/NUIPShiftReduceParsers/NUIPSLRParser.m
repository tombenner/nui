//
//  NUIPSLRParser.m
//  NUIParse
//
//  Created by Tom Davie on 06/03/2011.
//  Copyright 2011 In The Beginning... All rights reserved.
//

#import "NUIPSLRParser.h"

#import "NUIPGrammarInternal.h"

#import "NUIPItem.h"
#import "NUIPGrammarSymbol.h"
#import "NUIPShiftReduceAction.h"
#import "NUIPShiftReduceParserProtectedMethods.h"

#import "NSSetFunctional.h"

@interface NUIPSLRParser ()

- (BOOL)constructShiftReduceTables;

@end

@implementation NUIPSLRParser

- (BOOL)constructShiftReduceTables
{
    NUIPGrammar *aug = [[self grammar] augmentedGrammar];
    NSArray *kernels = [aug lr0Kernels];
    NSUInteger itemCount = [kernels count];
    NSString *startSymbol = [aug start];
    
    [self setActionTable:[[[NUIPShiftReduceActionTable alloc] initWithCapacity:itemCount] autorelease]];
    [self setGotoTable:  [[[NUIPShiftReduceGotoTable   alloc] initWithCapacity:itemCount] autorelease]];
    
    NSArray *allNonTerminalNames = [[self grammar] allNonTerminalNames];
    NSUInteger idx = 0;
    for (NSSet *kernel in kernels)
    {
        NSSet *itemSet = [aug lr0Closure:kernel];
        for (NUIPItem *item in itemSet)
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
                    NSSet *follow = [aug follow:[[item rule] name]];
                    for (NSString *f in follow)
                    {
                        BOOL success = [[self actionTable] setAction:[NUIPShiftReduceAction reduceAction:[item rule]] forState:idx name:f];
                        if (!success)
                        {
                            return NO;
                        }
                    }
                }
            }
            else if ([next isTerminal])
            {
                NSSet *g = [aug lr0GotoKernelWithItems:itemSet symbol:next];
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
            NSSet *g = [aug lr0GotoKernelWithItems:itemSet symbol:[NUIPGrammarSymbol nonTerminalWithName:nonTerminalName]];
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


@end
