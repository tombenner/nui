//
//  NUIStyleParser.h
//  NUIDemo
//
//  Created by Tom Benner on 12/4/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NUIStyleParser : NSObject

- (NSMutableDictionary*)getStylesFromFile:(NSString*)content;
- (NSMutableDictionary*)getStylesFromPath:(NSString*)path;

@end
