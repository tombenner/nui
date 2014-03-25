//
//  NUIPRecoveryAction.h
//  NUIParse
//
//  Created by Thomas Davie on 05/02/2012.
//  Copyright (c) 2012 In The Beginning... All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NUIPToken.h"

typedef enum
{
    NUIPRecoveryTypeAddToken    = 0,
    NUIPRecoveryTypeRemoveToken    ,
    NUIPRecoveryTypeBail
} NUIPRecoveryType;

/**
 * Represents an action to take to recover from an error.
 */
@interface NUIPRecoveryAction : NSObject

/**
 * The type of recovery action to take.  May be NUIPRecoveryTypeAddToken or NUIPRecoveryTypeRemoveToken.
 */
@property (readwrite, assign) NUIPRecoveryType recoveryType;

/**
 * The token to insert in the token streem if a NUIPRecoveryTypeAddToken action is taken.
 */
@property (readwrite, retain) NUIPToken *additionalToken;

/**
 * Allocates an initialises a new NUIPRecoveryAction asking the parser to add a new token to the token stream.
 *
 * @param token The token to add to the stream.
 * @return A new recovery action.
 */
+ (id)recoveryActionWithAdditionalToken:(NUIPToken *)token;

/**
 * Allocates an initialises a new NUIPRecoveryAction asking the parser to delete an offending token from the token stream.
 *
 * @return A new recovery action.
 */
+ (id)recoveryActionDeletingCurrentToken;

/**
 * Allocates and initialise a new NUIPRecovery action asking the parser to stop immediately.
 */
+ (id)recoveryActionStop;

/**
 * Initialises a NUIPRecoveryAction asking the parser to add a new token to the token stream.
 *
 * @param token The token to add to the stream.
 * @return An initialised recovery action.
 */
- (id)initWithAdditionalToken:(NUIPToken *)token;

/**
 * Initialises a NUIPRecoveryAction asking the parser to delete an offending token from the token stream.
 *
 * @return An initialised recovery action.
 */
- (id)initWithDeleteAction;

/**
 * Initialises a NUIPRecoveryAction asking the parser to stop immediately.
 */
- (id)initWithStopAction;

@end
