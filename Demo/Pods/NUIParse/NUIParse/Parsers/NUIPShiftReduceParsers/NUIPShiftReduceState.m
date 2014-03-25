//
//  NUIPShiftReduceState.m
//  NUIParse
//
//  Created by Tom Davie on 05/03/2011.
//  Copyright 2011 In The Beginning... All rights reserved.
//

#import "NUIPShiftReduceState.h"

@interface NUIPShiftReduceState ()

@property (readwrite,retain) NSObject *object;
@property (readwrite,assign) NSUInteger state;

@end

@implementation NUIPShiftReduceState

@synthesize object;
@synthesize state;

+ (id)shiftReduceStateWithObject:(NSObject *)object state:(NSUInteger)state
{
    return [[[self alloc] initWithObject:object state:state] autorelease];
}

- (id)initWithObject:(NSObject *)initObject state:(NSUInteger)initState
{
    self = [super init];
    
    if (nil != self)
    {
        [self setObject:initObject];
        [self setState:initState];
    }
    
    return self;
}

- (void)dealloc
{
    [object release];
    
    [super dealloc];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"<NUIPShiftReduceState: %@ (%ld)", [self object], (long)[self state]];
}

@end
