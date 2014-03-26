//
//  NUIPToken.m
//  NUIParse
//
//  Created by Tom Davie on 12/02/2011.
//  Copyright 2011 In The Beginning... All rights reserved.
//

#import "NUIPToken.h"

@implementation NUIPToken

@synthesize lineNumber;
@synthesize columnNumber;
@synthesize characterNumber;
@synthesize length;

- (NSString *)name
{
    [NSException raise:@"Abstract method called exception" format:@"NUIPToken is abstract, and should not have name called."];
    return @"";
}

- (NSUInteger)hash
{
    return [[self name] hash];
}

- (BOOL)isEqual:(id)object
{
    return ([object isToken] &&
            [[self name] isEqualToString:[(NUIPToken *)object name]]);
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@>", [self name]];
}

@end

@implementation NSObject (NUIPIsToken)

- (BOOL)isToken
{
    return NO;
}

@end
