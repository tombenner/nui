//
//  NUITableViewCell.m
//  NUI
//
//  Created by Tom Benner on 11/21/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import "NUITableViewCell.h"

@implementation NUITableViewCell

@synthesize nuiClass = _nuiClass;

- (void)initNUI
{
    self.nuiClass = @"TableCell";
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self initNUI];
    [NUIRenderer renderTableViewCell:self withClass:_nuiClass];
}

- (void)layoutSubviews {     
    [super layoutSubviews];
    
    // Make the background of the subviews clear, as they would otherwise lie on top of the cell's
    // primary background color/gradient 
    [self setBackgroundColor:[UIColor clearColor]];
}

@end
