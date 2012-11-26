//
//  NUILabel.m
//  NUI
//
//  Created by Tom Benner on 11/22/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import "NUILabel.h"

@implementation NUILabel

@synthesize nuiClass = _nuiClass;

- (void)initNUI
{
    self.nuiClass = @"Label";
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self initNUI];
    [self awakeFromNibNUI];
}

- (void)awakeFromNibNUI
{
    [NUIRenderer renderLabel:self withClass:_nuiClass];
}

@end
