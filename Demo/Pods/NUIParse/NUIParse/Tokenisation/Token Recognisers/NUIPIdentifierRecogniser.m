//
//  NUIPIdentifierTokeniser.m
//  NUIParse
//
//  Created by Tom Davie on 12/02/2011.
//  Copyright 2011 In The Beginning... All rights reserved.
//

#import "NUIPIdentifierRecogniser.h"

#import "NUIPIdentifierToken.h"

@implementation NUIPIdentifierRecogniser

@synthesize initialCharacters;
@synthesize identifierCharacters;

+ (id)identifierRecogniser
{
    return [[[NUIPIdentifierRecogniser alloc] initWithInitialCharacters:nil identifierCharacters:nil] autorelease];
}

+ (id)identifierRecogniserWithInitialCharacters:(NSCharacterSet *)initialCharacters identifierCharacters:(NSCharacterSet *)identifierCharacters
{
    return [[[NUIPIdentifierRecogniser alloc] initWithInitialCharacters:initialCharacters identifierCharacters:identifierCharacters] autorelease];
}

- (id)initWithInitialCharacters:(NSCharacterSet *)initInitialCharacters identifierCharacters:(NSCharacterSet *)initIdentifierCharacters
{
    self = [super init];
    
    if (nil != self)
    {
        [self setInitialCharacters:initInitialCharacters];
        [self setIdentifierCharacters:initIdentifierCharacters];
    }
    
    return self;
}

#define NUIPIdentifierRecogniserInitialCharactersKey @"I.i"
#define NUIPIdentifierRecogniserIdentifierCharactersKey @"I.c"

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    
    if (nil != self)
    {
        [self setInitialCharacters:[aDecoder decodeObjectForKey:NUIPIdentifierRecogniserInitialCharactersKey]];
        [self setIdentifierCharacters:[aDecoder decodeObjectForKey:NUIPIdentifierRecogniserIdentifierCharactersKey]];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:[self initialCharacters] forKey:NUIPIdentifierRecogniserInitialCharactersKey];
    [aCoder encodeObject:[self identifierCharacters] forKey:NUIPIdentifierRecogniserIdentifierCharactersKey];
}

- (void)dealloc
{
    [initialCharacters release];
    [identifierCharacters release];
    
    [super dealloc];
}

- (NUIPToken *)recogniseTokenInString:(NSString *)tokenString currentTokenPosition:(NSUInteger *)tokenPosition
{
    NSCharacterSet *identifierStartCharacters = nil == [self initialCharacters] ? [NSCharacterSet characterSetWithCharactersInString:
                                                                                   @"abcdefghijklmnopqrstuvwxyz"
                                                                                   @"ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                                                                                   @"_"] : [self initialCharacters];
    NSCharacterSet *idCharacters = nil == [self identifierCharacters] ? [NSCharacterSet characterSetWithCharactersInString:
                                                                         @"abcdefghijklmnopqrstuvwxyz"
                                                                         @"ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                                                                         @"_-1234567890"] : [self identifierCharacters];
    
    unichar firstChar = [tokenString characterAtIndex:*tokenPosition];
    if ([identifierStartCharacters characterIsMember:firstChar])
    {
        NSString *identifierString;
        NSScanner *scanner = [NSScanner scannerWithString:tokenString];
        [scanner setScanLocation:*tokenPosition + 1];
        [scanner setCharactersToBeSkipped:nil];
        BOOL success = [scanner scanCharactersFromSet:idCharacters intoString:&identifierString];
        if (success)
        {
            identifierString = [[[[NSString alloc] initWithCharacters:&firstChar length:1] autorelease] stringByAppendingString:identifierString];
            *tokenPosition = [scanner scanLocation];
        }
        else
        {
            identifierString = [[[NSString alloc] initWithCharacters:&firstChar length:1] autorelease];
            *tokenPosition += 1;
        }
        return [NUIPIdentifierToken tokenWithIdentifier:identifierString];
    }
    
    return nil;
}

@end
