//
//  NUISelectorSet.h
//  ParseTest
//
//  Created by Tony Mann on 1/14/14.
//  Copyright (c) 2014 Tom Benner. All rights reserved.
//

#if __has_include(<NUIParse/NUIParse.h>)
#    import <NUIParse/NUIParse.h>
#else
#    import "NUIParse.h"
#endif

@interface NUISelectorSet : NSObject<NUIPParseResult>

@property (strong) NSArray *selectors;

@end
