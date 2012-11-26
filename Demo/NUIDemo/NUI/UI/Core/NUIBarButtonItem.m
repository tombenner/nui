//
//  NUIBarButtonItem.m
//  NUIDemo
//
//  Created by Tom Benner on 11/24/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import "NUIBarButtonItem.h"

@implementation NUIBarButtonItem

@synthesize nuiClass = _nuiClass;

- (void)initNUI
{
    self.nuiClass = @"BarButton";
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self initNUI];
    [self awakeFromNibNUI];
}

- (void)awakeFromNibNUI
{
    [NUIRenderer renderBarButtonItem:self withClass:self.nuiClass];
}

@end
