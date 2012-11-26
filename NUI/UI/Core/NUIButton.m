//
//  NUIButton.m
//  NUI
//
//  Created by Tom Benner on 11/20/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import "NUIButton.h"

@implementation NUIButton

@synthesize nuiClass = _nuiClass;

- (void)initNUI
{
    self.nuiClass = @"Button";
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self initNUI];
    [self awakeFromNibNUI];
}

- (void)awakeFromNibNUI
{
    [NUIRenderer renderButton:self withClass:self.nuiClass];
}

@end
