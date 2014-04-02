//
//  NUIPLALR1Parser.m
//  NUIParse
//
//  Created by Tom Davie on 03/04/2011.
//  Copyright 2011 In The Beginning... All rights reserved.
//

#import "NUIPLALR1Parser.h"

#import "NUIPShiftReduceParserProtectedMethods.h"

#import "NUIPLR1Item.h"
#import "NSSetFunctional.h"
#import "NSArray+Functional.h"

#import "NUIPShiftReduceAction.h"

#import "NUIPGrammarInternal.h"

@interface NUIPLALR1Parser ()

- (NSArray *)kernelsForGrammar:(NUIPGrammar *)aug;

@end

@implementation NUIPLALR1Parser

- (BOOL)constructShiftReduceTables
{
    NUIPGrammar *aug = [[self grammar] augmentedGrammar];
    NSArray *kernels = [self kernelsForGrammar:aug];
    NSArray *lr0Kernels = [kernels cp_map:^ NSSet * (NSSet *s) { return [s cp_map:^ id (NUIPLR1Item *i) { return [NUIPItem itemWithRule:[i rule] position:[i position]]; }]; }];
    NSUInteger itemCount = [kernels count];
    NSArray *allNonTerminalNames = [[self grammar] allNonTerminalNames];
    NSString *startSymbol = [aug start];
    
    [self setActionTable:[[[NUIPShiftReduceActionTable alloc] initWithCapacity:itemCount] autorelease]];
    [self setGotoTable:  [[[NUIPShiftReduceGotoTable   alloc] initWithCapacity:itemCount] autorelease]];
    
    NSUInteger idx = 0;
    for (NSSet *kernel in kernels)
    {
        @autoreleasepool
        {
            NSSet *itemsSet = [aug lr1Closure:kernel];
            for (NUIPLR1Item *item in itemsSet)
            {
                @autoreleasepool
                {
                    NUIPGrammarSymbol *next = [item nextSymbol];
                    if (nil == next)
                    {
                        if ([[[item rule] name] isEqualToString:startSymbol])
                        {
                            BOOL success = [[self actionTable] setAction:[NUIPShiftReduceAction acceptAction] forState:idx name:@"EOF"];
                            if (!success)
                            {
                                NSLog(@"Could not insert shift in action table for state %lu, token %@", (unsigned long)idx, @"EOF");
                                return NO;
                            }
                        }
                        else
                        {
                            BOOL success = [[self actionTable] setAction:[NUIPShiftReduceAction reduceAction:[item rule]] forState:idx name:[[item terminal] name]];
                            if (!success)
                            {
                                NSLog(@"Could not insert reduce in action table for state %lu, token %@", (unsigned long)idx, [[item terminal] name]);
                                return NO;
                            }
                        }
                    }
                    else if ([next isTerminal])
                    {
                        NSSet *g = [aug lr0GotoKernelWithItems:itemsSet symbol:next];
                        NSSet *lr0G = [g cp_map:^ id (NUIPLR1Item *i) { return [NUIPItem itemWithRule:[i rule] position:[i position]]; }];
                        NSUInteger indx = 0;
                        NSUInteger ix = NSNotFound;
                        for (NSSet *lr0Kernel in lr0Kernels)
                        {
                            if ([lr0Kernel isEqualToSet:lr0G])
                            {
                                ix = indx;
                                break;
                            }
                            indx++;
                        }
                        BOOL success = [[self actionTable] setAction:[NUIPShiftReduceAction shiftAction:ix] forState:idx name:[next name]];
                        if (!success)
                        {
                            NSLog(@"Could not insert shift in action table for state %lu, token %@", (unsigned long)idx, [next name]);
                            return NO;
                        }
                    }
                }
            }
            
            for (NSString *nonTerminalName in allNonTerminalNames)
            {
                NSSet *g = [aug lr0GotoKernelWithItems:itemsSet symbol:[NUIPGrammarSymbol nonTerminalWithName:nonTerminalName]];
                NSSet *lr0G = [g cp_map:^ id (NUIPLR1Item *i) { return [NUIPItem itemWithRule:[i rule] position:[i position]]; }];
                NSUInteger indx = 0;
                NSUInteger gotoIndex = NSNotFound;
                for (NSSet *lr0Kernel in lr0Kernels)
                {
                    if ([lr0Kernel isEqualToSet:lr0G])
                    {
                        gotoIndex = indx;
                        break;
                    }
                    indx++;
                }
                BOOL success = [[self gotoTable] setGoto:gotoIndex forState:idx nonTerminalNamed:nonTerminalName];
                if (!success)
                {
                    NSLog(@"Could not insert into goto table for state %lu, token %@", (unsigned long)idx, nonTerminalName);
                    return NO;
                }
            }
        }
        
        idx++;
    }
    
    return YES;
}

- (NSArray *)kernelsForGrammar:(NUIPGrammar *)aug
{
    NSArray *lr0Kernels = [aug lr0Kernels];
    NSMutableArray *lr1Kernels = [NSMutableArray arrayWithCapacity:[lr0Kernels count]];
    NSMutableDictionary *propogations = [NSMutableDictionary dictionary];
    NSMutableDictionary *spontaneous = [NSMutableDictionary dictionary];
    NSString *grammarStartSymbol = [aug start];
    
    for (NSSet *kernel in lr0Kernels)
    {
        [spontaneous  setObject:[NSMutableDictionary dictionary] forKey:kernel];
    }
    
    NSString *uniqueName = [aug uniqueSymbolNameBasedOnName:@"#"];
    
    for (NSSet *kernel in lr0Kernels)
    {
        for (NUIPItem *item in kernel)
        {
            if ([[[item rule] name] isEqualToString:grammarStartSymbol] && 0 == [item position])
            {
                NSMutableDictionary *gotoSpontaneous = [spontaneous objectForKey:kernel];
                NSMutableSet *itemSpontaneous = [gotoSpontaneous objectForKey:item];
                if (nil == itemSpontaneous)
                {
                    itemSpontaneous = [NSMutableSet set];
                    [gotoSpontaneous setObject:itemSpontaneous forKey:item];
                }
                [itemSpontaneous addObject:[NUIPGrammarSymbol terminalWithName:@"EOF"]];
            }
            
            NSSet *j = [aug lr1Closure:[NSSet setWithObject:[NUIPLR1Item lr1ItemWithRule:[item rule] position:[item position] terminal:[NUIPGrammarSymbol terminalWithName:uniqueName]]]];
            for (NUIPLR1Item *lr1Item in j)
            {
                NSString *name = [[lr1Item terminal] name];
                NUIPGrammarSymbol *nextSymbol = [lr1Item nextSymbol];
                if (nil != nextSymbol)
                {
                    NSSet *g = [aug lr0GotoKernelWithItems:[aug lr0Closure:kernel] symbol:nextSymbol];
                    if ([uniqueName isEqualToString:name])
                    {
                        NSMutableDictionary *fromKernelPropogations = [propogations objectForKey:kernel];
                        if (nil == fromKernelPropogations)
                        {
                            fromKernelPropogations = [NSMutableDictionary dictionary];
                            [propogations setObject:fromKernelPropogations forKey:kernel];
                        }
                        NSMutableDictionary *itemPropogations = [fromKernelPropogations objectForKey:item];
                        if (nil == itemPropogations)
                        {
                            itemPropogations = [NSMutableDictionary dictionary];
                            [fromKernelPropogations setObject:itemPropogations forKey:item];
                        }
                        NSMutableSet *gotoPropogations = [itemPropogations objectForKey:g];
                        if (nil == gotoPropogations)
                        {
                            gotoPropogations = [NSMutableSet set];
                            [itemPropogations setObject:gotoPropogations forKey:g];
                        }
                        [gotoPropogations addObject:[NUIPItem itemWithRule:[lr1Item rule] position:[lr1Item position] + 1]];
                    }
                    else
                    {
                        NUIPItem *lr0Item = [NUIPItem itemWithRule:[lr1Item rule] position:[lr1Item position] + 1];
                        NSMutableDictionary *gotoSpontaneous = [spontaneous objectForKey:g];
                        NSMutableSet *itemSpontaneous = [gotoSpontaneous objectForKey:lr0Item];
                        if (nil == itemSpontaneous)
                        {
                            itemSpontaneous = [NSMutableSet set];
                            [gotoSpontaneous setObject:itemSpontaneous forKey:lr0Item];
                        }
                        [itemSpontaneous addObject:[lr1Item terminal]];
                    }
                }
            }
        }
    }
    
    BOOL finishedPropogating = NO;
    while (!finishedPropogating)
    {
        finishedPropogating = YES;
        for (NSSet *fromKernel in propogations)
        {
            NSDictionary *fromKernelPropogations = [propogations objectForKey:fromKernel];
            for (NUIPItem *from in fromKernelPropogations)
            {
                NSDictionary *itemPropogatiotns = [fromKernelPropogations objectForKey:from];
                for (NSSet *toKernel in itemPropogatiotns)
                {
                    NSDictionary *gotoPropogations = [itemPropogatiotns objectForKey:toKernel];
                    for (NUIPItem *toItem in gotoPropogations)
                    {
                        NSDictionary *gotoSpontaneous = [spontaneous objectForKey:fromKernel];
                        NSSet *symbols = [gotoSpontaneous objectForKey:from];
                        for (NUIPGrammarSymbol *symbol in symbols)
                        {
                            NSMutableDictionary *toGotoSpontaneous = [spontaneous objectForKey:toKernel];
                            if (nil == toGotoSpontaneous)
                            {
                                toGotoSpontaneous = [NSMutableDictionary dictionary];
                                [spontaneous setObject:toGotoSpontaneous forKey:toKernel];
                            }
                            NSMutableSet *toSpontaneous = [toGotoSpontaneous objectForKey:toItem];
                            if (nil == toSpontaneous)
                            {
                                [toGotoSpontaneous setObject:[NSMutableSet setWithObject:symbol] forKey:toItem];
                                finishedPropogating = NO;
                            }
                            else if (![toSpontaneous containsObject:symbol])
                            {
                                [toSpontaneous addObject:symbol];
                                finishedPropogating = NO;
                            }
                        }
                    }
                }
            }
        }
    }
    
    for (NSSet *kernel in lr0Kernels)
    {
        NSMutableSet *lr1Kernel = [NSMutableSet set];
        for (NUIPItem *item in kernel)
        {
            NSDictionary *kernelSymbols = [spontaneous objectForKey:kernel];
            NSSet *symbols = [kernelSymbols objectForKey:item];
            for (NUIPGrammarSymbol *symbol in symbols)
            {
                if (nil != [symbol name])
                {
                    [lr1Kernel addObject:[NUIPLR1Item lr1ItemWithRule:[item rule] position:[item position] terminal:symbol]];
                }
            }
        }
        [lr1Kernels addObject:lr1Kernel];
    }
    
    return lr1Kernels;
}

@end
