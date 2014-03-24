//
//  Declaration.m
//  ParseTest
//
//  Created by Tony Mann on 1/14/14.
//  Copyright (c) 2014 Tom Benner. All rights reserved.
//

#import "NUIDeclaration.h"

@implementation NUIDeclaration

- (id)initWithSyntaxTree:(NUIPSyntaxTree *)syntaxTree
{
    self = [self init];
    
    if (nil != self)
    {
        self.property = [[syntaxTree valueForTag:@"property"] identifier];
        self.value    = [syntaxTree valueForTag:@"value"];
    }
    
    return self;
}

- (NSString *) description
{
    return [NSString stringWithFormat:@"<NUIDeclaration: %@ = %@>", self.property, self.value];
}

@end
