//
//  NUIPLR1Item.m
//  NUIParse
//
//  Created by Tom Davie on 12/03/2011.
//  Copyright 2011 In The Beginning... All rights reserved.
//

#import "NUIPLR1Item.h"

@interface NUIPLR1Item ()

@property (readwrite,retain) NUIPGrammarSymbol *terminal;

@end

@implementation NUIPLR1Item

@synthesize terminal;

+ (id)lr1ItemWithRule:(NUIPRule *)rule position:(NSUInteger)position terminal:(NUIPGrammarSymbol *)terminal
{
    return [[[self alloc] initWithRule:rule position:position terminal:terminal] autorelease];
}

- (id)initWithRule:(NUIPRule *)rule position:(NSUInteger)position terminal:(NUIPGrammarSymbol *)initTerminal
{
    self = [super initWithRule:rule position:position];
    
    if (nil != self)
    {
        [self setTerminal:initTerminal];
    }
    
    return self;
}

- (id)initWithRule:(NUIPRule *)initRule position:(NSUInteger)initPosition
{
    return [self initWithRule:initRule position:initPosition terminal:nil];
}

- (id)copyWithZone:(NSZone *)zone
{
    return [[NUIPLR1Item allocWithZone:zone] initWithRule:[self rule] position:[self position] terminal:[self terminal]];
}

- (void)dealloc
{
    [terminal release];
    
    [super dealloc];
}

- (BOOL)isLR1Item
{
    return YES;
}

- (BOOL)isEqual:(id)object
{
    return ([object isLR1Item] &&
            [super isEqualToItem:(NUIPLR1Item *)object] &&
            [((NUIPLR1Item *)object)->terminal isEqualToGrammarSymbol:terminal]);
}

- (NSUInteger)hash
{
    return [[self rule] hash] ^ [terminal hash] ^ [self position];
}

- (NSString *)description
{
    return [[super description] stringByAppendingFormat:@", %@", [[self terminal] name]];
}

@end

@implementation NSObject(NUIPIsLR1Item)

- (BOOL)isLR1Item
{
    return NO;
}

@end
