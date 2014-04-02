//
//  NUIPErrorToken.h
//  NUIParse
//
//  Created by Thomas Davie on 05/02/2012.
//  Copyright (c) 2012 In The Beginning... All rights reserved.
//

#import "NUIPToken.h"

/**
 * The NUIPErrorToken class reperesents an error during tokenisation.
 *
 * These tokens return `@"Error"` as their name.  They may carry an error message with them.
 */
@interface NUIPErrorToken : NUIPToken

/**
 * The error message generated when the tokeniser failed.
 */
@property (readwrite, copy) NSString *errorMessage;

/**
 * Creates and initializes a new NUIPErrorToken with a given message.
 *
 * @param errorMessage The message for the error.
 * @return A NUIPErrorToken with the message.
 */
+ (id)errorWithMessage:(NSString *)errorMessage;

/**
 * Returns a NUIPErrorToken initialized with a given message.
 *
 * @param errorMessage The message for the error.
 * @return A NUIPErrorToken with the message.
 */
- (id)initWithMesage:(NSString *)errorMessage;

@end

@interface NSObject (NUIPErrorToken)

- (BOOL)isErrorToken;

@end
