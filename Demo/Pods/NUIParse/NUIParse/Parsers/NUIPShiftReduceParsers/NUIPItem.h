//
//  NUIPItem.h
//  NUIParse
//
//  Created by Tom Davie on 06/03/2011.
//  Copyright 2011 In The Beginning... All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NUIPRule.h"
#import "NUIPGrammarSymbol.h"

@interface NUIPItem : NSObject <NSCopying>
{}

@property (readonly,retain) NUIPRule *rule;
@property (readonly,assign) NSUInteger position;

+ (id)itemWithRule:(NUIPRule *)rule position:(NSUInteger)position;
- (id)initWithRule:(NUIPRule *)rule position:(NSUInteger)position;

- (NUIPGrammarSymbol *)nextSymbol;
- (NSArray *)followingSymbols;

- (id)itemByMovingDotRight;

- (BOOL)isEqualToItem:(NUIPItem *)item;

@end

@interface NSObject (NUIPIsItem)

- (BOOL)isItem;

@end
