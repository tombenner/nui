//
//  NUIPTokenStream.h
//  NUIParse
//
//  Created by Tom Davie on 10/02/2011.
//  Copyright 2011 In The Beginning... All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NUIPToken.h"

/**
 * NUIPTokenStreams store the output of a tokeniser ready for parsing.
 * 
 * This class manages a thread safe buffer between tokenising and parsing threads, blocking as apropriate to wait for new tokens.
 * When a tokeniser has consumed its entire input it should call -closeTokenStream to notify parsers that no further input will be found.
 * Tokenisers that consume their entire input with no errors should produce a NUIPEOFToken at the end of the stream to inform parsers that the stream is complete.
 */
@interface NUIPTokenStream : NSObject

///---------------------------------------------------------------------------------------
/// @name Creating and Initialising Token Streams
///---------------------------------------------------------------------------------------

/**
 * Creates a token stream with a set of tokens already ready for parsing.
 *
 * @param tokens A set of tokens to place at the start of the token stream.
 * @return Returns a token stream containing tokens at its start.
 * @see initWithTokens:
 */
+ (id)tokenStreamWithTokens:(NSArray *)tokens;

/**
 * Initialises a token stream with a set of tokens already ready for parsing.
 *
 * @param tokens A set of tokens to place at the start of the token stream.
 * @return Returns the token stream, now containing tokens at its start.
 * @see tokenStreamWithTokens:
 */
- (id)initWithTokens:(NSArray *)tokens;

///---------------------------------------------------------------------------------------
/// @name Adding and Removing Tokens
///---------------------------------------------------------------------------------------

/**
 * Returns the first token in the stream but does not remove it from the stream.
 * 
 * This method will not block waiting for a token to become available.  If no token is available the method returns `nil`.  If the token stream is closed the method returns `nil`.
 *
 * @return The first NUIPToken in the stream.
 * @see popToken
 */
- (NUIPToken *)peekToken;

/**
 * Returns the first token in the stream and removes it from the stream.
 * 
 * This method will block waiting for a token to become available if the token stream is empty.  If the token stream is closed the method returns `nil`.
 *
 * @return The first NUIPToken in the stream.
 * @see peekToken
 */
- (NUIPToken *)popToken;

/**
 * Adds a NUIPToken to the end of the token stream.
 *
 * @param token The token to add to the stream.
 * @see pushTokens:
 */
- (void)pushToken:(NUIPToken *)token;

/**
 * Adds several NUIPTokens to the end of the token stream.
 *
 * The tokens are added in order.
 * 
 * @param tokens The array of tokens to add to the token stream.
 * @see pushToken:
 */
- (void)pushTokens:(NSArray *)tokens;

///---------------------------------------------------------------------------------------
/// @name Finishing Tokenisation
///---------------------------------------------------------------------------------------

/**
 * Closes the token stream, causing popToken to return `nil` when all tokens have been exhausted rather than blocking waiting for new input.
 */
- (void)closeTokenStream;

@end

@interface NSObject (NUIPIsTokenStream)

- (BOOL)isTokenStream;

@end
