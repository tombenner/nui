//
//  NUIPIntegerRecogniser.m
//  NUIParse
//
//  Created by Tom Davie on 12/02/2011.
//  Copyright 2011 In The Beginning... All rights reserved.
//

#import "NUIPNumberRecogniser.h"

#import "NUIPNumberToken.h"

@implementation NUIPNumberRecogniser

@synthesize recognisesInts;
@synthesize recognisesFloats;

#define NUIPNumberRecogniserRecognisesIntsKey @"N.i"
#define NUIPNumberRecogniserRecognisesFloatsKey @"N.f"

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    
    if (nil != self)
    {
        [self setRecognisesInts:[aDecoder decodeBoolForKey:NUIPNumberRecogniserRecognisesIntsKey]];
        [self setRecognisesFloats:[aDecoder decodeBoolForKey:NUIPNumberRecogniserRecognisesFloatsKey]];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeBool:[self recognisesInts] forKey:NUIPNumberRecogniserRecognisesIntsKey];
    [aCoder encodeBool:[self recognisesFloats] forKey:NUIPNumberRecogniserRecognisesFloatsKey];
}

+ (id)integerRecogniser
{
    NUIPNumberRecogniser *rec = [[[NUIPNumberRecogniser alloc] init] autorelease];
    [rec setRecognisesInts:YES];
    [rec setRecognisesFloats:NO];
    return rec;
}

+ (id)floatRecogniser
{
    NUIPNumberRecogniser *rec = [[[NUIPNumberRecogniser alloc] init] autorelease];
    [rec setRecognisesInts:NO];
    [rec setRecognisesFloats:YES];
    return rec;
}

+ (id)numberRecogniser
{
    NUIPNumberRecogniser *rec = [[[NUIPNumberRecogniser alloc] init] autorelease];
    [rec setRecognisesInts:YES];
    [rec setRecognisesFloats:YES];
    return rec;
}

- (NUIPToken *)recogniseTokenInString:(NSString *)tokenString currentTokenPosition:(NSUInteger *)tokenPosition
{
    NSScanner *scanner = [NSScanner scannerWithString:tokenString];
    [scanner setCharactersToBeSkipped:nil];
    [scanner setScanLocation:*tokenPosition];

    if (![self recognisesFloats])
    {
        NSInteger i;
        BOOL success = [scanner scanInteger:&i];
        if (success)
        {
            *tokenPosition = [scanner scanLocation];
            return [NUIPNumberToken tokenWithNumber:[NSNumber numberWithInteger:i]];
        }
    }
    else
    {
        double d;
        BOOL success = [scanner scanDouble:&d];
        if (success && ![self recognisesInts])
        {
            NSRange numberRange = NSMakeRange(*tokenPosition, [scanner scanLocation] - *tokenPosition);
            if ([tokenString rangeOfString:@"." options:0x0 range:numberRange].location == NSNotFound &&
                [tokenString rangeOfString:@"e" options:0x0 range:numberRange].location == NSNotFound)
            {
                success = NO;
            }
        }
        if (success)
        {
            *tokenPosition = [scanner scanLocation];
            return [NUIPNumberToken tokenWithNumber:[NSNumber numberWithDouble:d]];
        }
    }
    
    return nil;
}

@end
