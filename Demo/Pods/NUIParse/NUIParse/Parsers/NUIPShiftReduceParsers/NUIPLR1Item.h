//
//  NUIPLR1Item.h
//  NUIParse
//
//  Created by Tom Davie on 12/03/2011.
//  Copyright 2011 In The Beginning... All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NUIPItem.h"
#import "NUIPGrammarSymbol.h"

@interface NUIPLR1Item : NUIPItem
{}

@property (readonly,retain) NUIPGrammarSymbol *terminal;

+ (id)lr1ItemWithRule:(NUIPRule *)rule position:(NSUInteger)position terminal:(NUIPGrammarSymbol *)terminal;
- (id)initWithRule:(NUIPRule *)rule position:(NSUInteger)position terminal:(NUIPGrammarSymbol *)terminal;

@end

@interface NSObject (NUIPIsLR1Item)

- (BOOL)isLR1Item;

@end
