//
//  NUIPKeywordToken.m
//  NUIParse
//
//  Created by Tom Davie on 12/02/2011.
//  Copyright 2011 In The Beginning... All rights reserved.
//

#import "NUIPKeywordToken.h"

@implementation NUIPKeywordToken

@synthesize keyword;

+ (id)tokenWithKeyword:(NSString *)keyword
{
    return [[[NUIPKeywordToken alloc] initWithKeyword:keyword] autorelease];
}

- (id)initWithKeyword:(NSString *)initKeyword
{
    self = [super init];
    
    if (nil != self)
    {
        [self setKeyword:initKeyword];
    }
    
    return self;
}

- (id)init
{
    return [self initWithKeyword:@" "];
}

- (void)dealloc
{
    [keyword release];
    [super dealloc];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"<Keyword: %@>", [self keyword]];
}

- (NSString *)name
{
    return [self keyword];
}

- (NSUInteger)hash
{
    return [[self keyword] hash];
}

- (BOOL)isKeywordToken
{
    return YES;
}

- (BOOL)isEqual:(id)object
{
    return ([object isKeywordToken] &&
            [((NUIPKeywordToken *)object)->keyword isEqualToString:keyword]);
}

@end

@implementation NSObject (NUIPIsKeywordToken)

- (BOOL)isKeywordToken
{
    return NO;
}

@end
