//
//  NUIStyleSheet.m
//  ParseTest
//
//  Created by Tony Mann on 1/14/14.
//  Copyright (c) 2014 Tom Benner. All rights reserved.
//

#import "NUIStyleSheet.h"
#import "NUIDefinition.h"

@implementation NUIStyleSheet

- (id)initWithSyntaxTree:(CPSyntaxTree *)syntaxTree
{
    self = [self init];
    
    if (nil != self)
    {
        self.ruleSets = [syntaxTree valueForTag:@"ruleSets"];
        
        NSArray *definitionList = [syntaxTree valueForTag:@"definitions"];
        
        NSMutableDictionary *definitions = [NSMutableDictionary dictionary];
        
        for (NUIDefinition *definition in definitionList) {
            definitions[definition.variable] = definition.value;
        }
        
        self.definitions = definitions;
    }
    
    return self;
}

- (NSString *) description
{
    return [NSString stringWithFormat:@"<NUIStyleSheet ruleSets: %@, definitions: %@>", self.ruleSets, self.definitions];
}

@end
