//
//  NUIPSyntaxTree.m
//  NUIParse
//
//  Created by Tom Davie on 04/03/2011.
//  Copyright 2011 In The Beginning... All rights reserved.
//

#import "NUIPSyntaxTree.h"

@interface NUIPSyntaxTree ()

@property (readwrite,retain) NUIPRule *rule;
@property (readwrite,copy) NSArray *children;
@property (readwrite,copy) NSDictionary *tagValues;

@end

@implementation NUIPSyntaxTree

@synthesize rule;
@synthesize children;
@synthesize tagValues;

+ (id)syntaxTreeWithRule:(NUIPRule *)rule children:(NSArray *)children
{
    return [[[self alloc] initWithRule:rule children:children tagValues:[NSDictionary dictionary]] autorelease];
}

- (id)initWithRule:(NUIPRule *)initRule children:(NSArray *)initChildren;
{
    return [self initWithRule:initRule children:initChildren tagValues:[NSDictionary dictionary]];
}

+ (id)syntaxTreeWithRule:(NUIPRule *)rule children:(NSArray *)children tagValues:(NSDictionary *)tagValues;
{
    return [[[self alloc] initWithRule:rule children:children tagValues:tagValues] autorelease];
}

- (id)initWithRule:(NUIPRule *)initRule children:(NSArray *)initChildren tagValues:(NSDictionary *)initTagValues
{
    self = [super init];
    
    if (nil != self)
    {
        [self setRule:initRule];
        [self setChildren:initChildren];
        [self setTagValues:initTagValues];
    }
    
    return self;
}

- (id)init
{
    return [self initWithRule:nil children:[NSArray array] tagValues:[NSDictionary dictionary]];
}

- (void)dealloc
{
    [rule release];
    [children release];
    [tagValues release];
    
    [super dealloc];
}

- (id)valueForTag:(NSString *)tagName
{
    return [tagValues objectForKey:tagName];
}

- (id)childAtIndex:(NSUInteger)idx
{
    return [children objectAtIndex:idx];
}

- (NSUInteger)hash
{
    return [[self rule] hash];
}

- (BOOL)isSyntaxTree
{
    return YES;
}

- (BOOL)isEqual:(id)object
{
    return ([object isSyntaxTree] &&
            ((NUIPSyntaxTree *)object)->rule == rule &&
            [((NUIPSyntaxTree *)object)->children isEqualToArray:children]);
}

- (NSString *)description
{
    NSMutableString *desc = [NSMutableString stringWithString:@"("];
    for (id obj in children)
    {
        [desc appendFormat:@"%@ ", obj];
    }
    [desc replaceCharactersInRange:NSMakeRange([desc length] - 1, 1) withString:@")"];
    return desc;
}

@end

@implementation NSObject(NUIPIsSyntaxTree)

- (BOOL)isSyntaxTree
{
    return NO;
}

@end
