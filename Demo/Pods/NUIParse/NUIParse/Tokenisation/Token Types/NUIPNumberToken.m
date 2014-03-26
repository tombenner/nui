//
//  NUIPNumberToken.m
//  NUIParse
//
//  Created by Tom Davie on 12/02/2011.
//  Copyright 2011 In The Beginning... All rights reserved.
//

#import "NUIPNumberToken.h"

@implementation NUIPNumberToken

@synthesize number;

+ (id)tokenWithNumber:(NSNumber *)number
{
    return [[[NUIPNumberToken alloc] initWithNumber:number] autorelease];
}

- (id)initWithNumber:(NSNumber *)initNumber
{
    self = [super init];
    
    if (nil != self)
    {
        [self setNumber:initNumber];
    }
    
    return self;    
}

- (id)init
{
    return [self initWithNumber:[NSNumber numberWithInteger:0]];
}

- (void)dealloc
{
    [number release];
    [super dealloc];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"<Number: %@>", [self number]];
}

- (NSString *)name
{
    return @"Number";
}

- (NSUInteger)hash
{
    return [[self number] hash];
}

- (BOOL)isNumberToken
{
    return YES;
}

- (BOOL)isEqual:(id)object
{
    return ([object isNumberToken] &&
            [((NUIPNumberToken *)object)->number isEqualToNumber:number]);
}

@end

@implementation NSObject (NUIPIsNumberToken)

- (BOOL)isNumberToken
{
    return NO;
}

@end
