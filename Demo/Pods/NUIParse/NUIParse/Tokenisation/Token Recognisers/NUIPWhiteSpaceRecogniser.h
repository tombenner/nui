//
//  NUIPWhiteSpaceRecogniser.h
//  NUIParse
//
//  Created by Tom Davie on 12/02/2011.
//  Copyright 2011 In The Beginning... All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NUIPTokenRecogniser.h"

/**
 * The NUIPWhiteSpaceRecogniser class attempts to recognise white space on the input string.
 * 
 * This recogniser produces NUIPWhiteSpaceTokens.
 */
@interface NUIPWhiteSpaceRecogniser : NSObject <NUIPTokenRecogniser>

///---------------------------------------------------------------------------------------
/// @name Creating and Initialising a WhiteSpace Recogniser
///---------------------------------------------------------------------------------------

/**
 * Creates a whitespace recogniser.
 *
 * @return Returns a NUIPWhiteSpaceRecogniser.
 */
+ (id)whiteSpaceRecogniser;

@end
