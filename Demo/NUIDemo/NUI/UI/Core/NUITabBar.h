//
//  NUITabBar.h
//  NUI
//
//  Created by Tom Benner on 11/22/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NUIGraphics.h"
#import "NUIRenderer.h"
#import "NUISettings.h"

@interface NUITabBar : UITabBar {
    NSString* nuiClass;
}

@property(strong, nonatomic) NSString* nuiClass;
- (void)initNUI;

@end
