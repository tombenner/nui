//
//  NUIMediaBlock.m
//  ParseTest
//
//  Created by Tony Mann on 1/14/14.
//  Copyright (c) 2014 Tom Benner. All rights reserved.
//

#import "NUIMediaBlock.h"
#import "NUIRuleSet.h"
#import "NUIDefinition.h"
#import "NUIMediaOptionSet.h"

@interface NUIMediaBlockItem : NSObject<NUIPParseResult>
@property (strong) NUIRuleSet *ruleSet;
@property (strong) NUIDefinition *definition;
@end

@implementation NUIMediaBlockItem

- (id)initWithSyntaxTree:(NUIPSyntaxTree *)syntaxTree
{
    self = [self init];
    
    if (nil != self)
    {
        self.ruleSet    = [syntaxTree valueForTag:@"ruleSet"];
        self.definition = [syntaxTree valueForTag:@"definition"];
    }
    
    return self;
}

- (NSString *) description
{
    return [NSString stringWithFormat:@"<NUIMediaBlockItem: %@, %@>", self.ruleSet, self.definition];
}

@end

@implementation NUIMediaBlock

- (id)initWithSyntaxTree:(NUIPSyntaxTree *)syntaxTree
{
    self = [self init];
    
    if (nil != self)
    {
        NUIMediaOptionSet *mediaOptionSet = [syntaxTree valueForTag:@"mediaOptions"];
        
        NSMutableArray *ruleSets    = [NSMutableArray array];
        NSMutableArray *definitions = [NSMutableArray array];
        
        NSArray *items = [syntaxTree valueForTag:@"items"];
        
        for (NUIMediaBlockItem *item in items) {
            if (item.ruleSet) {
                item.ruleSet.mediaOptions = mediaOptionSet.mediaOptions;
                [ruleSets addObject:item.ruleSet];
            } else if (item.definition) {
                item.definition.mediaOptions = mediaOptionSet.mediaOptions;
                [definitions addObject:item.definition];
            }
        }
        
        self.ruleSets    = ruleSets;
        self.definitions = definitions;
    }
    
    return self;
}

- (NSString *) description
{
    return [NSString stringWithFormat:@"<NUIMediaBlock: %@, %@>", self.ruleSets, self.definitions];
}

@end
