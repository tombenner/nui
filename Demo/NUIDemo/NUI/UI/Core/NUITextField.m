//
//  NUITextField.m
//  NUI
//
//  Created by Tom Benner on 11/20/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import "NUITextField.h"

@implementation NUITextField

@synthesize nuiClass = _nuiClass;

- (void)initNUI
{
    self.nuiClass = @"TextField";
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self initNUI];
    [self awakeFromNibNUI];
}

- (void)awakeFromNibNUI
{
    [NUIRenderer renderTextField:self withClass:_nuiClass];
}

@end
