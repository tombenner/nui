//
//  NUIPEOFToken.m
//  NUIParse
//
//  Created by Tom Davie on 12/02/2011.
//  Copyright 2011 In The Beginning... All rights reserved.
//

#import "NUIPEOFToken.h"

@implementation NUIPEOFToken

+ (id)eof
{
    return [[[NUIPEOFToken alloc] init] autorelease];
}

- (NSString *)name
{
    return @"EOF";
}

- (NSUInteger)hash
{
    return 0;
}

- (BOOL)isEOFToken
{
    return YES;
}

- (BOOL)isEqual:(id)object
{
    return [object isEOFToken];
}

@end

@implementation NSObject (NUIPIsEOFToken)

- (BOOL)isEOFToken
{
    return NO;
}

@end
