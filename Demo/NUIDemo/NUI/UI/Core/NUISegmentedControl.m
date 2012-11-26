//
//  NUISegmentedControl.m
//      
//
//  Created by Tom Benner on 11/22/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import "NUISegmentedControl.h"

@implementation NUISegmentedControl

@synthesize nuiClass = _nuiClass;

- (void)initNUI
{
    self.nuiClass = @"SegmentedControl";
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self initNUI];
    [self awakeFromNibNUI];
}

- (void)awakeFromNibNUI
{
    [NUIRenderer renderSegmentedControl:self withClass:_nuiClass];
}

@end
