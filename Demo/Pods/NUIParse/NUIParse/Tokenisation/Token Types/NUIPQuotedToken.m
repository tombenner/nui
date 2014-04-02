//
//  NUIPQuotedToken.m
//  NUIParse
//
//  Created by Tom Davie on 13/02/2011.
//  Copyright 2011 In The Beginning... All rights reserved.
//

#import "NUIPQuotedToken.h"


@implementation NUIPQuotedToken
{
@private
    NSString *content;
    NSString *quoteType;
    NSString *name;
}

@synthesize content;
@synthesize quoteType;

+ (id)content:(NSString *)content quotedWith:(NSString *)quoteType name:(NSString *)name
{
    return [[[NUIPQuotedToken alloc] initWithContent:content quoteType:quoteType name:name] autorelease];
}

- (id)initWithContent:(NSString *)initContent quoteType:(NSString *)initQuoteType name:(NSString *)initName
{
    self = [super init];
    
    if (nil != self)
    {
        [self setContent:initContent];
        [self setQuoteType:initQuoteType];
        name = [initName copy];
    }
    
    return self;
}

- (id)init
{
    return [self initWithContent:@"" quoteType:@"" name:@""];
}

- (void)dealloc
{
    [content release];
    [quoteType release];
    [name release];
    
    [super dealloc];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@: %@>", [self name], [self content]];
}

- (NSString *)name
{
    return name;
}

- (NSUInteger)hash
{
    return [[self content] hash];
}

- (BOOL)isQuotedToken
{
    return YES;
}

- (BOOL)isEqual:(id)object
{
    return ([object isQuotedToken] &&
            [((NUIPQuotedToken *)object)->content isEqualToString:content] &&
            [((NUIPQuotedToken *)object)->name isEqualToString:name] &&
            [((NUIPQuotedToken *)object)->quoteType isEqualToString:quoteType]);
}

@end

@implementation NSObject (NUIPIsQuotedToken)

- (BOOL)isQuotedToken
{
    return NO;
}

@end
