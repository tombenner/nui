//
//  NUIPEOFToken.h
//  NUIParse
//
//  Created by Tom Davie on 12/02/2011.
//  Copyright 2011 In The Beginning... All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NUIPToken.h"

/**
 * The NUIPEOFToken class reperesents the end of a token stream.
 *
 * These tokens return `@"EOF"` as their name.
 */
@interface NUIPEOFToken : NUIPToken

/**
 * Creates an end of file token.
 *
 * @return A token representing the end of the input stream.
 */
+ (id)eof;

@end

@interface NSObject (NUIPIsEOFToken)

- (BOOL)isEOFToken;

@end
