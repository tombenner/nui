//
//  NUIPRHSItemResult.h
//  NUIParse
//
//  Created by Thomas Davie on 23/10/2011.
//  Copyright (c) 2011 In The Beginning... All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NUIPParser.h"

@interface NUIPRHSItemResult : NSObject <NUIPParseResult>

@property (readwrite, retain) NSMutableArray *contents;
@property (readwrite, assign) BOOL shouldCollapse;
@property (readwrite, copy  ) NSSet *tagNames;
@property (readwrite, copy  ) NSDictionary *tagValues;

@end

@interface NSObject (NUIPIsRHSItemResult)

- (BOOL)isRHSItemResult;

@end
