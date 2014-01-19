//
//  NUISelectorSet.m
//  ParseTest
//
//  Created by Tony Mann on 1/14/14.
//  Copyright (c) 2014 Tom Benner. All rights reserved.
//

#import "NUISelectorSet.h"

@interface NUISelector : NSObject<CPParseResult>
@property (strong) NSString *name;
@end

@interface NUIDelimitedSelector : NSObject<CPParseResult>
@property (strong) NUISelector *selector;
@end

@implementation NUISelector

- (id)initWithSyntaxTree:(CPSyntaxTree *)syntaxTree
{
    self = [self init];
    
    if (self) {
        self.name = [[syntaxTree valueForTag:@"name"] identifier];
    }
    
    return self;
}

- (NSString *) description
{
    return [NSString stringWithFormat:@"<NUISelector: %@>", self.name];
}

@end

@implementation NUIDelimitedSelector

- (id)initWithSyntaxTree:(CPSyntaxTree *)syntaxTree
{
    self = [self init];
    
    if (self) {
        self.selector = [syntaxTree valueForTag:@"selector"];
    }
    
    return self;
}

- (NSString *) description
{
    return [NSString stringWithFormat:@"<NUIDelimitedSelector: %@>", self.selector.name];
}

@end

@implementation NUISelectorSet

- (id)initWithSyntaxTree:(CPSyntaxTree *)syntaxTree
{
    self = [self init];
    
    if (self) {
        NUISelector *firstSelector = [syntaxTree valueForTag:@"firstSelector"];
        NSMutableArray *selectors = [NSMutableArray arrayWithObject:firstSelector.name];
        
        NSArray *delimitedSelectors = [syntaxTree valueForTag:@"otherSelectors"];
        
        if (delimitedSelectors) {
            for (NUIDelimitedSelector *delimitedSelector in delimitedSelectors) {
                [selectors addObject:delimitedSelector.selector.name];
            }
        }
        
        self.selectors = selectors;
    }
    
    return self;
}

- (NSString *) description
{
    return [NSString stringWithFormat:@"<NUISelectorSet: %@>", self.selectors];
}

@end
