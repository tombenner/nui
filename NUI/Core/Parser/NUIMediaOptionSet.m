//
//  NUIMediaOptionSet.m
//  ParseTest
//
//  Created by Tony Mann on 1/14/14.
//  Copyright (c) 2014 Tom Benner. All rights reserved.
//

#import "NUIMediaOptionSet.h"

@interface NUIDelimitedMediaOption : NSObject<NUIPParseResult>
@property (strong) NUIMediaOption *mediaOption;
@end

@implementation NUIMediaOption

- (id)initWithSyntaxTree:(NUIPSyntaxTree *)syntaxTree
{
    self = [self init];
    
    if (self) {
        self.property = [[syntaxTree valueForTag:@"property"] identifier];
        self.value    = [[syntaxTree valueForTag:@"value"] identifier];
    }
    
    return self;
}

- (NSString *) description
{
    return [NSString stringWithFormat:@"<NUIMediaOption: %@ = %@>", self.property, self.value];
}

@end

@implementation NUIDelimitedMediaOption

- (id)initWithSyntaxTree:(NUIPSyntaxTree *)syntaxTree
{
    self = [self init];
    
    if (self) {
        self.mediaOption = [syntaxTree valueForTag:@"mediaOption"];
    }
    
    return self;
}

- (NSString *) description
{
    return [NSString stringWithFormat:@"<NUIDelimitedMediaOption: %@>", self.mediaOption];
}

@end

@implementation NUIMediaOptionSet

- (id)initWithSyntaxTree:(NUIPSyntaxTree *)syntaxTree
{
    self = [self init];
    
    if (self) {
        NUIMediaOption *firstMediaOption = [syntaxTree valueForTag:@"firstMediaOption"];
        NSMutableDictionary *mediaOptions = [@{firstMediaOption.property: firstMediaOption.value} mutableCopy];
        
        NSArray *delimitedMediaOptions = [syntaxTree valueForTag:@"otherMediaOptions"];
        
        if (delimitedMediaOptions) {
            for (NUIDelimitedMediaOption *delimitedMediaOption in delimitedMediaOptions) {
                NUIMediaOption *mediaOption = delimitedMediaOption.mediaOption;
                mediaOptions[mediaOption.property] = mediaOption.value;
            }
        }
        
        self.mediaOptions = mediaOptions;
    }
    
    return self;
}

- (NSString *) description
{
    return [NSString stringWithFormat:@"<NUIMediaOptionSet: %@>", self.mediaOptions];
}

@end
