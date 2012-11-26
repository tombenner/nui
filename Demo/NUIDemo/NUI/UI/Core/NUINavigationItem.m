//
//  NUINavigationItem.m
//  NUIDemo
//
//  Created by Tom Benner on 11/24/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import "NUINavigationItem.h"

@implementation NUINavigationItem

@synthesize nuiClass = _nuiClass;

- (void)initNUI
{
    self.nuiClass = @"NavigationItem";
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self initNUI];
    [self awakeFromNibNUI];
}

- (void)awakeFromNibNUI
{
    [NUIRenderer renderNavigationItem:self withClass:_nuiClass];
}

@end
