//
//  Parser.m
//  NUIParse
//
//  Created by Tom Davie on 04/03/2011.
//  Copyright 2011 In The Beginning... All rights reserved.
//

#import "NUIPParser.h"

@interface NUIPParser ()

@property (readwrite,retain) NUIPGrammar *grammar;

@end

@implementation NUIPParser

@synthesize grammar;
@synthesize delegate;

+ (id)parserWithGrammar:(NUIPGrammar *)grammar
{
    return [[[self alloc] initWithGrammar:grammar] autorelease];
}

- (id)initWithGrammar:(NUIPGrammar *)initGrammar
{
    self = [super init];
    
    if (nil != self)
    {
        [self setGrammar:initGrammar];
    }
    
    return self;
}

- (id)init
{
    return [self initWithGrammar:nil];
}

- (void)dealloc
{
    [grammar release];
    
    [super dealloc];
}

- (id)parse:(NUIPTokenStream *)tokenStream
{
    [NSException raise:@"Abstract Class Exception"
                format:@"NUIPParser is an abstract class, use one of the concrete subclasses to parse your token stream"];
    
    return nil;
}

- (void)setDelegate:(id<NUIPParserDelegate>)aDelegate
{
    if (delegate != aDelegate)
    {
        delegate = aDelegate;
        
        delegateRespondsTo.didProduceSyntaxTree = [delegate respondsToSelector:@selector(parser:didProduceSyntaxTree:)];
        delegateRespondsTo.didEncounterErrorOnInput = [delegate respondsToSelector:@selector(parser:didEncounterErrorOnInput:)];
        delegateRespondsTo.didEncounterErrorOnInputExpecting = [delegate respondsToSelector:@selector(parser:didEncounterErrorOnInput:expecting:)];
    }
}

@end
