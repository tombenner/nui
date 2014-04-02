//
//  NUIPItem.m
//  NUIParse
//
//  Created by Tom Davie on 06/03/2011.
//  Copyright 2011 In The Beginning... All rights reserved.
//

#import "NUIPItem.h"

@interface NUIPItem ()

@property (readwrite,retain) NUIPRule *rule;
@property (readwrite,assign) NSUInteger position;

@end

@implementation NUIPItem

@synthesize rule;
@synthesize position;

+ (id)itemWithRule:(NUIPRule *)rule position:(NSUInteger)position
{
    return [[[self alloc] initWithRule:rule position:position] autorelease];
}

- (id)initWithRule:(NUIPRule *)initRule position:(NSUInteger)initPosition
{
    self = [super init];
    
    if (nil != self)
    {
        rule = [initRule retain];
        position = initPosition;
    }
    
    return self;
}

- (id)copyWithZone:(NSZone *)zone
{
    return [[NUIPItem allocWithZone:zone] initWithRule:rule position:position];
}

- (void)dealloc
{
    [rule release];
    
    [super dealloc];
}

- (NUIPGrammarSymbol *)nextSymbol
{
    NSArray *rse = [rule rightHandSideElements];
    if (position >= [rse count])
    {
        return nil;
    }
    else
    {
        return [rse objectAtIndex:position];
    }
}

- (NSArray *)followingSymbols
{
    NSArray *rse = [rule rightHandSideElements];
    return [rse subarrayWithRange:NSMakeRange(position, [rse count] - position)];
}

- (id)itemByMovingDotRight
{
    NUIPItem *c = [self copy];
    [c setPosition:[self position] + 1];
    return [c autorelease];
}

- (BOOL)isItem
{
    return YES;
}

- (BOOL)isEqual:(id)object
{
    return [object isItem] && ((NUIPItem *)object)->position == position && ((NUIPItem *)object)->rule == rule;
}

- (BOOL)isEqualToItem:(NUIPItem *)item
{
    return item != nil && item->position == position && item->rule == rule;
}

- (NSUInteger)hash
{
    return ((NSUInteger)rule << 4) + position;
}

- (NSString *)description
{
    NSMutableString *desc = [NSMutableString stringWithFormat:@"%@ ::= ", [[self rule] name]];
    NSUInteger pos = 0;
    NSArray *rse = [[self rule] rightHandSideElements];
    for (NSObject *obj in rse)
    {
        if (pos == [self position])
        {
            [desc appendString:@"• "];
        }
        [desc appendFormat:@"%@ ", obj];
        pos++;
    }
    if (pos == [self position])
    {
        [desc appendString:@"•"];
    }
    return desc;
}

@end

@implementation NSObject (NUIPIsItem)

- (BOOL)isItem
{
    return NO;
}

@end
