//
//  NUITextField.h
//  NUI
//
//  Created by Tom Benner on 11/20/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NUIRenderer.h"

@interface NUITextField : UITextField {
    NSString* nuiClass;
}

@property(strong, nonatomic) NSString* nuiClass;
- (void)initNUI;

@end
