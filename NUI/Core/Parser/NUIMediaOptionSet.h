//
//  NUIMediaOptionSet.h
//  ParseTest
//
//  Created by Tony Mann on 1/14/14.
//  Copyright (c) 2014 Tom Benner. All rights reserved.
//

#import "NUIParse.h"

@interface NUIMediaOption : NSObject<NUIPParseResult>

@property (strong) NSString *property;
@property (strong) NSString *value;

@end


@interface NUIMediaOptionSet : NSObject<NUIPParseResult>

@property (strong) NSDictionary *mediaOptions;

@end


