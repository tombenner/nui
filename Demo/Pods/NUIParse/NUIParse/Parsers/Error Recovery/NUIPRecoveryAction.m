//
//  NUIPRecoveryAction.m
//  NUIParse
//
//  Created by Thomas Davie on 05/02/2012.
//  Copyright (c) 2012 In The Beginning... All rights reserved.
//

#import "NUIPRecoveryAction.h"

@implementation NUIPRecoveryAction

@synthesize recoveryType;
@synthesize additionalToken;

+ (id)recoveryActionWithAdditionalToken:(NUIPToken *)token
{
    return [[[self alloc] initWithAdditionalToken:token] autorelease];
}

+ (id)recoveryActionDeletingCurrentToken
{
    return [[[self alloc] initWithDeleteAction] autorelease];
}

+ (id)recoveryActionStop
{
    return [[[self alloc] initWithStopAction] autorelease];
}

- (id)initWithAdditionalToken:(NUIPToken *)token
{
    self = [super init];
    
    if (nil != self)
    {
        [self setRecoveryType:NUIPRecoveryTypeAddToken];
        [self setAdditionalToken:token];
    }
    
    return self;
}

- (id)initWithDeleteAction
{
    self = [super init];
    
    if (nil != self)
    {
        [self setRecoveryType:NUIPRecoveryTypeRemoveToken];
    }
    
    return self;
}

- (id)initWithStopAction
{
    self = [super init];
    
    if (nil != self)
    {
        [self setRecoveryType:NUIPRecoveryTypeBail];
    }
    
    return self;
}

- (void)dealloc
{
    [additionalToken release];
    
    [super dealloc];
}

@end
