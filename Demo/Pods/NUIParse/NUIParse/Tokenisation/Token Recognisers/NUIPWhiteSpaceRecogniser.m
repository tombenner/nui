//
//  NUIPWhiteSpaceRecogniser.m
//  NUIParse
//
//  Created by Tom Davie on 12/02/2011.
//  Copyright 2011 In The Beginning... All rights reserved.
//

#import "NUIPWhiteSpaceRecogniser.h"

#import "NUIPWhiteSpaceToken.h"

@implementation NUIPWhiteSpaceRecogniser

- (id)initWithCoder:(NSCoder *)aDecoder
{
    return [super init];
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
}

+ (id)whiteSpaceRecogniser
{
    return [[[NUIPWhiteSpaceRecogniser alloc] init] autorelease];
}

- (NUIPToken *)recogniseTokenInString:(NSString *)tokenString currentTokenPosition:(NSUInteger *)tokenPosition
{
    NSScanner *scanner = [NSScanner scannerWithString:tokenString];
    [scanner setCharactersToBeSkipped:nil];
    [scanner setScanLocation:*tokenPosition];
    NSString *scannedString;
    BOOL success = [scanner scanCharactersFromSet:[NSCharacterSet whitespaceAndNewlineCharacterSet] intoString:&scannedString];
    if (success)
    {
        *tokenPosition = [scanner scanLocation];
        return [NUIPWhiteSpaceToken whiteSpace:scannedString];
    }
    
    return nil;
}

@end
