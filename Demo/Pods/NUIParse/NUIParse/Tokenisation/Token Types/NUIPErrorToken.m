//
//  NUIPErrorToken.m
//  NUIParse
//
//  Created by Thomas Davie on 05/02/2012.
//  Copyright (c) 2012 In The Beginning... All rights reserved.
//

#import "NUIPErrorToken.h"

@implementation NUIPErrorToken

@synthesize errorMessage;

+ (id)errorWithMessage:(NSString *)errorMessage
{
    return [[[self alloc] initWithMesage:errorMessage] autorelease];
}

- (id)initWithMesage:(NSString *)initErrorMessage
{
    self = [super init];
    
    if (nil != self)
    {
        [self setErrorMessage:initErrorMessage];
    }
    
    return self;
}

- (void)dealloc
{
    [errorMessage release];
    
    [super dealloc];
}

- (NSString *)name
{
    return @"Error";
}

- (NSUInteger)hash
{
    return 0;
}

- (BOOL)isErrorToken
{
    return YES;
}

- (BOOL)isEqual:(id)object
{
    return [object isErrorToken];
}

@end

@implementation NSObject (NUIPIsErrorToken)

- (BOOL)isErrorToken
{
    return NO;
}

@end
