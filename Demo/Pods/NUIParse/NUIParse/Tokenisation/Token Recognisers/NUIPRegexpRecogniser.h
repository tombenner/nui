//
//  NUIPRegexpRecogniser.h
//  NUIParse
//
//  Created by Francis Chong on 1/22/14.
//  Copyright (c) 2014 Ignition Soft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NUIPTokenRecogniser.h"

typedef NUIPToken* (^NUIPRegexpKeywordRecogniserMatchHandler)(NSString* tokenString, NSTextCheckingResult* match);

/**
 * The NUIPRegexpRecogniser class attempts to recognise a specific NSRegularExpression.
 *
 * A regexp recogniser attempts to recognise a regexp.
 *
 * This recogniser produces a token via matchHandler.
 */
@interface NUIPRegexpRecogniser : NSObject <NUIPTokenRecogniser>

@property (nonatomic, retain) NSRegularExpression* regexp;

///---------------------------------------------------------------------------------------
/// @name Creating and Initialising a Regexp Keyword Recogniser
///---------------------------------------------------------------------------------------

/**
 * Initialises a Regexp Recogniser to recognise a specific regexp.
 *
 * @param regexp The NSRegularExpression to recognise.
 * @param matchHandler A block that process first match result of the regular expression, and return a NUIPToken.
 *
 * @return Returns the regexp recogniser initialised to recognise the passed regexp.
 *
 * @see recogniserForRegexp:
 */
- (id)initWithRegexp:(NSRegularExpression *)regexp matchHandler:(NUIPRegexpKeywordRecogniserMatchHandler)matchHandler;

/**
 * Initialises a Regexp Recogniser to recognise a specific regexp.
 *
 * @param regexp The NSRegularExpression to recognise.
 * @param matchHandler A block that process first match result of the regular expression, and return a NUIPToken.
 *
 * @return Returns the regexp recogniser initialised to recognise the passed regexp.
 *
 * @see initWithRegexp:
 */
+ (id)recogniserForRegexp:(NSRegularExpression *)regexp matchHandler:(NUIPRegexpKeywordRecogniserMatchHandler)matchHandler;

@end
