//
//  NUIView.m
//  NUI
//
//  Created by Tom Benner on 11/20/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import "NUIView.h"

@implementation NUIView

@synthesize nuiClass = _nuiClass;

- (void)initNUI
{
    self.nuiClass = @"View";
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self initNUI];
    [self awakeFromNibNUI];
}

- (void)awakeFromNibNUI
{   
    [NUIRenderer renderView:self withClass:_nuiClass];
}

@end
