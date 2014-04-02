//
//  Definition.m
//  ParseTest
//
//  Created by Tony Mann on 1/14/14.
//  Copyright (c) 2014 Tom Benner. All rights reserved.
//

#import "NUIDefinition.h"
#import "NUIVariableToken.h"

@implementation NUIDefinition

- (id)initWithSyntaxTree:(NUIPSyntaxTree *)syntaxTree
{
    self = [self init];
    
    if (nil != self)
    {
        self.variable = [[syntaxTree valueForTag:@"variable"] variable];
        self.value    = [syntaxTree valueForTag:@"value"];
    }
    
    return self;
}

- (NSString *) description
{
    return [NSString stringWithFormat:@"<NUIDefinition: %@ = %@>", self.variable, self.value];
}

@end
