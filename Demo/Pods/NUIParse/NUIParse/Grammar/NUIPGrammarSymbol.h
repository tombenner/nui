//
//  NUIPGrammarSymbol.h
//  NUIParse
//
//  Created by Tom Davie on 13/03/2011.
//  Copyright 2011 In The Beginning... All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * The NUIPGrammarSymbol class represents a terminal or non-terminal grammar symbol.
 * 
 * All grammar symbols carry a name which is used in constructing NUIPRules.
 */
@interface NUIPGrammarSymbol : NSObject <NSCoding>

///---------------------------------------------------------------------------------------
/// @name Creating and Initialising a Rule
///---------------------------------------------------------------------------------------

/**
 * Creates a non-terminal grammar symbol.
 *
 * @param name The non-terminal name.
 * @return Returns a non-terminal NUIPGrammarSymbol with the specified name.
 *
 * @see terminalWithName:
 * @see initWithName:isTerminal:
 */
+ (id)nonTerminalWithName:(NSString *)name;

/**
 * Creates a terminal grammar symbol.
 *
 * @param name The terminal name.
 * @return Returns a terminal NUIPGrammarSymbol with the specified name.
 *
 * @see nonTerminalWithName:
 * @see initWithName:isTerminal:
 */
+ (id)terminalWithName:(NSString *)name;

/**
 * Initialises a grammar symbol.
 *
 * @param name     The non-terminal name.
 * @param terminal Specifies whether the grammar symbol is a terminal or non-terminal.
 * @return Returns a NUIPGrammarSymbol with the specified name.
 *
 * @see terminalWithName:
 * @see nonTerminalWithName:
 */
- (id)initWithName:(NSString *)name isTerminal:(BOOL)terminal;

///---------------------------------------------------------------------------------------
/// @name Configuring a Rule
///---------------------------------------------------------------------------------------

/**
 * The grammar symbol's name.
 */
@property (readwrite, copy  ) NSString *name;

/**
 * Whether the grammar symbol is a terminal or non-terminal.
 */
@property (readwrite, assign, getter=isTerminal) BOOL terminal;

/**
 * Determines whether the grammar symbol is equal to another.
 * @param object The other grammar symbol to compare.
 * @return Whether the two symbols are equal.
 */
- (BOOL)isEqualToGrammarSymbol:(NUIPGrammarSymbol *)object;

@end

@interface NSObject (NUIPGrammarSymbol)

- (BOOL)isGrammarSymbol;

@end
