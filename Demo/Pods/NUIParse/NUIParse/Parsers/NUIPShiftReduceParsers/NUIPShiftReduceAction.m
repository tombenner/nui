//
//  NUIPShiftReduceAction.m
//  NUIParse
//
//  Created by Tom Davie on 05/03/2011.
//  Copyright 2011 In The Beginning... All rights reserved.
//

#import "NUIPShiftReduceAction.h"

#import "NUIPGrammarInternal.h"

typedef enum
{
    kActionTypeShift = 0,
    kActionTypeReduce   ,
    kActionTypeAccept
} ActionType;

typedef union
{
    NSUInteger shift;
    NUIPRule *reductionRule;
}
ActionDetails;

@implementation NUIPShiftReduceAction
{
    ActionType type;
    ActionDetails details;
}

+ (id)shiftAction:(NSUInteger)shiftLocation
{
    return [[[self alloc] initWithShift:shiftLocation] autorelease];
}

+ (id)reduceAction:(NUIPRule *)reduction
{
    return [[[self alloc] initWithReductionRule:reduction] autorelease];
}

+ (id)acceptAction
{
    return [[[self alloc] init] autorelease];
}

- (id)initWithShift:(NSUInteger)shiftLocation
{
    self = [super init];
    
    if (nil != self)
    {
        type = kActionTypeShift;
        details.shift = shiftLocation;
    }
    
    return self;
}

- (id)initWithReductionRule:(NUIPRule *)reduction
{
    self = [super init];
    
    if (nil != self)
    {
        type = kActionTypeReduce;
        details.reductionRule = [reduction retain];
    }
    
    return self;
}

- (id)init
{
    self = [super init];
    
    if (nil != self)
    {
        type = kActionTypeAccept;
    }
    
    return self;
}

#define NUIPShiftReduceActionTypeKey  @"t"
#define NUIPShiftReduceActionShiftKey @"s"
#define NUIPShiftReduceActionRuleKey  @"r"

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    
    if (nil != self)
    {
        type = [aDecoder decodeIntForKey:NUIPShiftReduceActionTypeKey];
        switch (type)
        {
            case kActionTypeShift:
                details.shift = [aDecoder decodeIntegerForKey:NUIPShiftReduceActionShiftKey];
                break;
            case kActionTypeReduce:
                details.reductionRule = [[aDecoder decodeObjectForKey:NUIPShiftReduceActionRuleKey] retain];
            case kActionTypeAccept:
            default:
                break;
        }
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeInt:type forKey:NUIPShiftReduceActionTypeKey];
    switch (type)
    {
        case kActionTypeShift:
            [aCoder encodeInteger:details.shift forKey:NUIPShiftReduceActionShiftKey];
            break;
        case kActionTypeReduce:
            [aCoder encodeObject:details.reductionRule forKey:NUIPShiftReduceActionRuleKey];
        case kActionTypeAccept:
        default:
            break;
    }
}

- (void)dealloc
{
    if (kActionTypeReduce == type)
    {
        [details.reductionRule release];
    }
    
    [super dealloc];
}

- (BOOL)isShiftAction
{
    return kActionTypeShift == type;
}

- (BOOL)isReduceAction
{
    return kActionTypeReduce == type;
}

- (BOOL)isAccept
{
    return kActionTypeAccept == type;
}

- (NSUInteger)newState
{
    return details.shift;
}

- (NUIPRule *)reductionRule
{
    return details.reductionRule;
}

- (NSUInteger)hash
{
    return type;
}

- (BOOL)isShiftReduceAction
{
    return YES;
}

- (BOOL)isEqual:(id)object
{
    if ([object isShiftReduceAction] && ((NUIPShiftReduceAction *)object)->type == type)
    {
        NUIPShiftReduceAction *other = (NUIPShiftReduceAction *)object;
        switch (type)
        {
            case kActionTypeShift:
                return [other newState] == details.shift;
            case kActionTypeReduce:
                return [other reductionRule] == details.reductionRule;
            case kActionTypeAccept:
                return YES;
        }
    }
    
    return NO;
}

- (BOOL)isEqualToShiftReduceAction:(NUIPShiftReduceAction *)object
{
    if (object != nil && object->type == type)
    {
        switch (type)
        {
            case kActionTypeShift:
                return [object newState] == details.shift;
            case kActionTypeReduce:
                return [object reductionRule] == details.reductionRule;
            case kActionTypeAccept:
                return YES;
        }
    }
    
    return NO;
}

- (NSString *)description
{
    switch (type)
    {
        case kActionTypeShift:
            return [NSString stringWithFormat:@"s%ld", (long)details.shift];
        case kActionTypeReduce:
            return [NSString stringWithFormat:@"r%@", [details.reductionRule name]];
        case kActionTypeAccept:
            return @"acc";
    }
}

- (NSString *)descriptionWithGrammar:(NUIPGrammar *)g
{
    switch (type)
    {
        case kActionTypeShift:
            return [NSString stringWithFormat:@"s%ld", (long)details.shift];
        case kActionTypeReduce:
            return [NSString stringWithFormat:@"r%ld", (long)[g indexOfRule:details.reductionRule]];
        case kActionTypeAccept:
            return @"acc";
    }
}

@end

@implementation NSObject(NUIPIsShiftReduceAction)

- (BOOL)isShiftReduceAction
{
    return NO;
}

@end
