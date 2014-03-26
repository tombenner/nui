//
//  NUIPShiftReduceParserProtectedMethods.h
//  NUIParse
//
//  Created by Tom Davie on 06/03/2011.
//  Copyright 2011 In The Beginning... All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NUIPShiftReduceParser.h"

#import "NUIPShiftReduceActionTable.h"
#import "NUIPShiftReduceGotoTable.h"

@interface NUIPShiftReduceParser ()

@property (readwrite,retain) NUIPShiftReduceActionTable *actionTable;
@property (readwrite,retain) NUIPShiftReduceGotoTable *gotoTable;

- (BOOL)constructShiftReduceTables;

@end
