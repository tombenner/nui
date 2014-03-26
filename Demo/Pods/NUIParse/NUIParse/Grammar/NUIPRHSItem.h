//
//  NUIPRHSItem.h
//  NUIParse
//
//  Created by Thomas Davie on 26/06/2011.
//  Copyright 2011 In The Beginning... All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NUIPRHSItem : NSObject <NSCopying>

@property (readwrite,copy  ) NSArray *alternatives;

@property (readwrite,assign) BOOL repeats;
@property (readwrite,assign) BOOL mayNotExist;

@property (readwrite,copy  ) NSSet *tags;

@property (readwrite,assign) BOOL shouldCollapse;

- (NSSet *)nonTerminalsUsed;

@end

@interface NSObject (NUIPIsRHSItem)

- (BOOL)isRHSItem;

@end
