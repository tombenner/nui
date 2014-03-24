//
//  NUIRuleSet.m
//  ParseTest
//
//  Created by Tony Mann on 1/14/14.
//  Copyright (c) 2014 Tom Benner. All rights reserved.
//

#import "NUIRuleSet.h"
#import "NUIDeclaration.h"

@implementation NUIRuleSet

- (id)initWithSyntaxTree:(NUIPSyntaxTree *)syntaxTree
{
    self = [self init];
    
    if (nil != self)
    {
        self.selectors = [[syntaxTree valueForTag:@"selectors"] selectors];
        
        NSArray *declarationList = [syntaxTree valueForTag:@"declarations"];
        
        NSMutableDictionary *declarations = [NSMutableDictionary dictionary];
        
        for (NUIDeclaration *declaration in declarationList) {
            declarations[declaration.property] = declaration.value;
        }
        
        self.declarations = declarations;
    }
    
    return self;
}

- (NSString *) description
{
    return [NSString stringWithFormat:@"<NUIRuleSet: %@ { %@ } >", self.selectors, self.declarations];
}

@end
