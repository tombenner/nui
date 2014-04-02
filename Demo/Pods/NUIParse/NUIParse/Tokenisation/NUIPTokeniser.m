//
//  NUIPTokeniser.m
//  NUIParse
//
//  Created by Tom Davie on 10/02/2011.
//  Copyright 2011 In The Beginning... All rights reserved.
//

#import "NUIPTokeniser.h"

#import "NUIPEOFToken.h"
#import "NUIPErrorToken.h"

typedef struct
{
    unsigned int shouldConsumeToken:1;
    unsigned int requestsPush:1;
    unsigned int willProduceToken:1;
    unsigned int didNotFindTokenOnInputPositionError:1;
    
} NUIPTokeniserDelegateResponseCache;

@interface NUIPTokeniser ()

@property (readwrite, retain) NSMutableArray *tokenRecognisers;

- (void)addToken:(NUIPToken *)tok toStream:(NUIPTokenStream *)stream;
- (void)advanceLineNumber:(NSUInteger *)ln columnNumber:(NSUInteger *)cn withInput:(NSString *)input range:(CFRange)range;

@end

@implementation NUIPTokeniser
{
    NUIPTokeniserDelegateResponseCache delegateRespondsTo;
}

@synthesize tokenRecognisers;
@synthesize delegate;

- (id)init
{
    self = [super init];
    
    if (nil != self)
    {
        [self setTokenRecognisers:[NSMutableArray array]];
    }
    
    return self;
}

#define NUIPTokeniserTokenRecognisersKey @"T.r"

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    
    if (nil != self)
    {
        [self setTokenRecognisers:[aDecoder decodeObjectForKey:NUIPTokeniserTokenRecognisersKey]];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:[self tokenRecognisers] forKey:NUIPTokeniserTokenRecognisersKey];
}

- (void)dealloc
{
    [tokenRecognisers release];
    
    [super dealloc];
}

- (void)addTokenRecogniser:(id<NUIPTokenRecogniser>)recogniser
{
    [[self tokenRecognisers] addObject:recogniser];
}

- (void)insertTokenRecogniser:(id<NUIPTokenRecogniser>)recogniser atPriority:(NSInteger)pri
{
    [[self tokenRecognisers] insertObject:recogniser atIndex:pri];
}

- (void)insertTokenRecogniser:(id<NUIPTokenRecogniser>)recogniser beforeRecogniser:(id<NUIPTokenRecogniser>)other
{
    NSUInteger idx = [[self tokenRecognisers] indexOfObject:other];
    if (NSNotFound == idx)
    {
        [NSException raise:NSInvalidArgumentException format:@"Token recogniser to insert before was not found"];
    }
    [self insertTokenRecogniser:recogniser atPriority:idx];
}

- (void)removeTokenRecogniser:(id<NUIPTokenRecogniser>)recogniser
{
    [[self tokenRecognisers] removeObject:recogniser];
}

- (NUIPTokenStream *)tokenise:(NSString *)input
{
    NUIPTokenStream *stream = [[[NUIPTokenStream alloc] init] autorelease];
    
    [self tokenise:input into:stream];
    
    return stream;
}

- (void)tokenise:(NSString *)input into:(NUIPTokenStream *)stream
{
    NSUInteger currentTokenOffset = 0;
    NSUInteger currentLineNumber = 0;
    NSUInteger currentColumnNumber = 0;
    NSUInteger inputLength = [input length];
    NSArray *recs = [self tokenRecognisers];
    
    while (currentTokenOffset < inputLength)
    {
        @autoreleasepool
        {
            BOOL recognised = NO;
            for (id<NUIPTokenRecogniser> recogniser in recs)
            {
                NSUInteger lastTokenOffset = currentTokenOffset;
                NUIPToken *tok = [recogniser recogniseTokenInString:input currentTokenPosition:&currentTokenOffset];
                if (nil != tok)
                {
                    [tok setLineNumber:currentLineNumber];
                    [tok setColumnNumber:currentColumnNumber];
                    [tok setCharacterNumber:lastTokenOffset];
                    [tok setLength:currentTokenOffset - lastTokenOffset];
                    
                    if (delegateRespondsTo.shouldConsumeToken)
                    {
                        if ([delegate tokeniser:self shouldConsumeToken:tok])
                        {
                            [self addToken:tok toStream:stream];
                            [self advanceLineNumber:&currentLineNumber columnNumber:&currentColumnNumber withInput:input range:CFRangeMake(lastTokenOffset, currentTokenOffset - lastTokenOffset)];
                            recognised = YES;
                            break;
                        }
                        else
                        {
                            currentTokenOffset = lastTokenOffset;
                        }
                    }
                    else
                    {
                        [self addToken:tok toStream:stream];
                        [self advanceLineNumber:&currentLineNumber columnNumber:&currentColumnNumber withInput:input range:CFRangeMake(lastTokenOffset, currentTokenOffset - lastTokenOffset)];
                        recognised = YES;
                        break;
                    }
                }
            }
            
            if (!recognised)
            {
                if (delegateRespondsTo.didNotFindTokenOnInputPositionError)
                {
                    NSString *err = nil;
                    currentTokenOffset = [delegate tokeniser:self didNotFindTokenOnInput:input position:currentTokenOffset error:&err];
                    [self addToken:[NUIPErrorToken errorWithMessage:err] toStream:stream];
                    if (NSNotFound == currentTokenOffset)
                    {
                        break;
                    }
                }
                else
                {
                    NUIPErrorToken *t = [NUIPErrorToken errorWithMessage:[NSString stringWithFormat:@"The tokeniser encountered an invalid input \"%@\", and could not handle it.  Implement -tokeniser:didNotFindTokenAtInputPosition:error: to make this do something more useful", [input substringWithRange:NSMakeRange(currentTokenOffset, MIN((NSUInteger)10, [input length] - currentTokenOffset))]]];
                    [t setLineNumber:currentLineNumber];
                    [t setColumnNumber:currentColumnNumber];
                    [t setCharacterNumber:currentTokenOffset];
                    [self addToken:t toStream:stream];
                    break;
                }
            }
        }
    }
    if (inputLength <= currentTokenOffset)
    {
        NUIPEOFToken *token = [NUIPEOFToken eof];
        [token setLineNumber:currentLineNumber];
        [token setColumnNumber:currentColumnNumber];
        [token setCharacterNumber:inputLength];
        [stream pushToken:token];
    }
    [stream closeTokenStream];
}

- (void)addToken:(NUIPToken *)tok toStream:(NUIPTokenStream *)stream
{
    if (delegateRespondsTo.requestsPush)
    {
        [delegate tokeniser:self requestsToken:tok pushedOntoStream:stream];
    }
    else if (delegateRespondsTo.willProduceToken)
    {
        [stream pushTokens:[delegate performSelector:@selector(tokeniser:willProduceToken:) withObject:self withObject:tok]];
//        [stream pushTokens:[delegate tokeniser:self willProduceToken:tok]];
    }
    else
    {
        [stream pushToken:tok];
    }
}

static CFCharacterSetRef newlineCharset = nil;

- (void)advanceLineNumber:(NSUInteger *)ln columnNumber:(NSUInteger *)cn withInput:(NSString *)input range:(CFRange)range
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^
    {
        newlineCharset = (CFCharacterSetRef)[[NSCharacterSet characterSetWithCharactersInString:@"\n\r"] retain];
    });
    
    CFRange searchRange = range;
    NSUInteger rangeEnd = range.location + range.length;
    CFRange foundRange;
    BOOL found = CFStringFindCharacterFromSet((CFStringRef)input, newlineCharset, searchRange, 0L, &foundRange);
    NSUInteger lastNewLineLocation = NSNotFound;
    while (found)
    {
        *ln += foundRange.length;
        lastNewLineLocation = foundRange.location + foundRange.length;
        searchRange = CFRangeMake(lastNewLineLocation, rangeEnd - lastNewLineLocation);
        found = CFStringFindCharacterFromSet((CFStringRef)input, newlineCharset, searchRange, 0L, &foundRange);
    }
    if (lastNewLineLocation != NSNotFound)
    {
        *cn = rangeEnd - lastNewLineLocation;
    }
    else
    {
        *cn += range.length;
    }
}

- (void)setDelegate:(id<NUIPTokeniserDelegate>)aDelegate
{
    if (delegate != aDelegate) 
    {
        delegate = aDelegate;
        
        delegateRespondsTo.shouldConsumeToken = [delegate respondsToSelector:@selector(tokeniser:shouldConsumeToken:)];
        delegateRespondsTo.requestsPush = [delegate respondsToSelector:@selector(tokeniser:requestsToken:pushedOntoStream:)];
        delegateRespondsTo.willProduceToken = [delegate respondsToSelector:@selector(tokeniser:willProduceToken:)];
        delegateRespondsTo.didNotFindTokenOnInputPositionError = [delegate respondsToSelector:@selector(tokeniser:didNotFindTokenOnInput:position:error:)];
    }
}

@end
