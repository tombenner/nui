//
//  NUIStyleSheetItem.m
//  ParseTest
//
//  Created by Tony Mann on 1/14/14.
//  Copyright (c) 2014 Tom Benner. All rights reserved.
//

#import "NUIStylesheetItem.h"
#import "NUIMediaBlock.h"

@implementation NUIStyleSheetItem

- (id)initWithSyntaxTree:(NUIPSyntaxTree *)syntaxTree
{
    self = [self init];
    
    if (nil != self)
    {
        NUIMediaBlock *mediaBlock = [syntaxTree valueForTag:@"mediaBlock"];
        NUIRuleSet *ruleSet       = [syntaxTree valueForTag:@"ruleSet"];
        NUIDefinition *definition = [syntaxTree valueForTag:@"definition"];
        
        if (mediaBlock) {
            self.ruleSets    = mediaBlock.ruleSets;
            self.definitions = mediaBlock.definitions;
        } else if (ruleSet) {
            self.ruleSets    = @[ruleSet];
        } else if (definition) {
            self.definitions = @[definition];
        }
    }
    
    return self;
}

- (NSString *) description
{
    return [NSString stringWithFormat:@"<NUIStylesheetItem: %@ %@>", self.ruleSets, self.definitions];
}

@end
