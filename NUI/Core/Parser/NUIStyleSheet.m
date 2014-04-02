//
//  NUIStyleSheet.m
//  ParseTest
//
//  Created by Tony Mann on 1/14/14.
//  Copyright (c) 2014 Tom Benner. All rights reserved.
//

#import "NUIStyleSheet.h"
#import "NUIStyleSheetItem.h"
#import "NUIDefinition.h"

@implementation NUIStyleSheet

- (id)initWithSyntaxTree:(NUIPSyntaxTree *)syntaxTree
{
    self = [self init];
    
    if (nil != self)
    {
        NSArray *items = [syntaxTree valueForTag:@"items"];
        
        NSMutableArray *ruleSets    = [NSMutableArray array];
        NSMutableArray *definitions = [NSMutableArray array];
        
        for (NUIStyleSheetItem *item in items) {
            if (item.ruleSets)
                [ruleSets addObjectsFromArray:item.ruleSets];
            
            if (item.definitions)
                [definitions addObjectsFromArray:item.definitions];
        }
        
        self.ruleSets    = ruleSets;
        self.definitions = definitions;
    }
    
    return self;
}

- (NSString *) description
{
    return [NSString stringWithFormat:@"<NUIStyleSheet ruleSets: %@, definitions: %@>", self.ruleSets, self.definitions];
}

@end
