//
//  NUIPRegexpRecogniser.m
//  NUIParse
//
//  Created by Francis Chong on 1/22/14.
//  Copyright (c) 2014 Ignition Soft. All rights reserved.
//

#import "NUIPRegexpRecogniser.h"
#import "NUIPToken.h"
#import "NUIPKeywordToken.h"

@interface NUIPRegexpRecogniser()
@property (nonatomic, copy) NUIPRegexpKeywordRecogniserMatchHandler matchHandler;
@end

@implementation NUIPRegexpRecogniser

@synthesize regexp;
@synthesize matchHandler;

- (id)initWithRegexp:(NSRegularExpression *)initRegexp matchHandler:(NUIPRegexpKeywordRecogniserMatchHandler)initMatchHandler
{
    self = [super init];
    if (self) {
        [self setRegexp:initRegexp];
        [self setMatchHandler:initMatchHandler];
    }
    return self;
}

+ (id)recogniserForRegexp:(NSRegularExpression *)regexp matchHandler:(NUIPRegexpKeywordRecogniserMatchHandler)initMatchHandler
{
    return [[[self alloc] initWithRegexp:regexp matchHandler:initMatchHandler] autorelease];
}

- (void)dealloc
{
    [matchHandler release];
    [regexp release];
    [super dealloc];
}

#pragma mark - NSCoder

#define NUIPRegexpRecogniserRegexpKey @"R.r"

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    
    if (nil != self)
    {
        [self setRegexp:[aDecoder decodeObjectForKey:NUIPRegexpRecogniserRegexpKey]];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:[self regexp] forKey:NUIPRegexpRecogniserRegexpKey];
}

#pragma mark - NUIPRecognizer

- (NUIPToken *)recogniseTokenInString:(NSString *)tokenString currentTokenPosition:(NSUInteger *)tokenPosition
{
    long inputLength = [tokenString length];
    NSRange searchRange = NSMakeRange(*tokenPosition, inputLength - *tokenPosition);
    NSTextCheckingResult* result = [[self regexp] firstMatchInString:tokenString options:NSMatchingAnchored range:searchRange];
    if (nil != result && nil != matchHandler && result.range.location == *tokenPosition && result.range.length > 0)
    {
        NUIPToken* token = matchHandler(tokenString, result);
        if (token)
        {
             *tokenPosition = result.range.location + result.range.length;
            return token;
        }
    }
    return nil;
}

@end
