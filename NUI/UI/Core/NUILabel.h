//
//  NUILabel.h
//  NUI
//
//  Created by Tom Benner on 11/22/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NUIRenderer.h"

@interface NUILabel : UILabel {
    NSString* nuiClass;
}

@property(strong, nonatomic) NSString* nuiClass;
- (void)initNUI;

@end
