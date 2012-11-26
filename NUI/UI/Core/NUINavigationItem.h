//
//  NUINavigationItem.h
//  NUIDemo
//
//  Created by Tom Benner on 11/24/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NUIRenderer.h"

@interface NUINavigationItem : UINavigationItem {
    NSString* nuiClass;
}

@property(strong, nonatomic) NSString* nuiClass;
- (void)initNUI;

@end

