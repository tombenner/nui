//
//  NUIPTokenStream.m
//  NUIParse
//
//  Created by Tom Davie on 10/02/2011.
//  Copyright 2011 In The Beginning... All rights reserved.
//

#import "NUIPTokenStream.h"

@interface NUIPTokenStream ()

@property (readwrite,copy) NSArray *tokens;

- (void)unlockTokenStream;

@end

typedef enum
{
    NUIPTokenStreamAvailable = 0,
    NUIPTokenStreamUnavailable
} NUIPTokenStreamLockCondition;

@implementation NUIPTokenStream
{
    BOOL isClosed;
    NSMutableArray *tokens;
    NSConditionLock *readWriteLock;
}

+ (id)tokenStreamWithTokens:(NSArray *)tokens
{
    return [[[self alloc] initWithTokens:tokens] autorelease];
}

- (id)initWithTokens:(NSArray *)initTokens
{
    self = [self init];
    
    if (nil != self)
    {
        [self setTokens:[[initTokens mutableCopy] autorelease]];
    }
    
    return self;
}

- (id)init
{
    self = [super init];
    
    if (nil != self)
    {
        isClosed = NO;
        readWriteLock = [[NSConditionLock alloc] initWithCondition:NUIPTokenStreamUnavailable];
        [self setTokens:[NSMutableArray array]];
    }
    
    return self;
}

- (void)dealloc
{
    [tokens release];
    [readWriteLock release];
    
    [super dealloc];
}

- (NUIPToken *)peekToken
{
    [readWriteLock lockWhenCondition:NUIPTokenStreamAvailable];
    NUIPToken *token = nil;
    
    if ([tokens count] > 0)
    {
        token = [[[tokens objectAtIndex:0] retain] autorelease];
    }
    [readWriteLock unlockWithCondition:NUIPTokenStreamAvailable];
    
    return token;
}

- (NUIPToken *)popToken
{
    [readWriteLock lockWhenCondition:NUIPTokenStreamAvailable];
    NUIPToken *token = nil;
    if ([tokens count] > 0)
    {
        token = [[[tokens objectAtIndex:0] retain] autorelease];
        [tokens removeObjectAtIndex:0];
    }
    [self unlockTokenStream];
    return token;
}


- (NSArray *)tokens
{
    return [[tokens copy] autorelease];
}

- (void)setTokens:(NSMutableArray *)newTokens
{
    [readWriteLock lock];
    if (tokens != newTokens)
    {
        [tokens release];
        tokens = [newTokens mutableCopy];
    }
    [self unlockTokenStream];
}

- (void)pushToken:(NUIPToken *)token
{
    [readWriteLock lock];
    [tokens addObject:token];
    [readWriteLock unlockWithCondition:NUIPTokenStreamAvailable];
}

- (void)pushTokens:(NSArray *)newTokens
{
    [readWriteLock lock];
    [tokens addObjectsFromArray:newTokens];
    [self unlockTokenStream];
}

- (void)closeTokenStream
{
    [readWriteLock lock];
    isClosed = YES;
    [readWriteLock unlockWithCondition:NUIPTokenStreamAvailable];
}

- (NSString *)description
{
    NSMutableString *desc = [NSMutableString string];
    
    for (NUIPToken *tok in [self tokens])
    {
        [desc appendFormat:@"%@ ", tok];
    }
    
    return desc;
}

- (void)unlockTokenStream
{
    [readWriteLock unlockWithCondition:isClosed || [tokens count] > 0 ? NUIPTokenStreamAvailable : NUIPTokenStreamUnavailable];
}

- (NSUInteger)hash
{
    return [[self tokens] hash];
}

- (BOOL)isTokenStream
{
    return YES;
}

- (BOOL)isEqual:(id)object
{
    return ([object isTokenStream] &&
            [((NUIPTokenStream *)object)->tokens isEqualToArray:tokens]);
}

@end

@implementation NSObject (NUIPIsTokenStream)

- (BOOL)isTokenStream
{
    return NO;
}

@end
