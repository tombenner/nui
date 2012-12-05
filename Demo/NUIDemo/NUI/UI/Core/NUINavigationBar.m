//
//  NUINavigationBar.m
//  NUI
//
//  Created by Tom Benner on 11/20/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import "NUINavigationBar.h"

@implementation NUINavigationBar

@synthesize nuiClass = _nuiClass;

- (void)initNUI
{
    self.nuiClass = @"NavigationBar";
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self initNUI];
    [self awakeFromNibNUI];
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    [self initNUI];
    [self drawRectNUI:rect];
}

- (void)awakeFromNibNUI
{
    [NUIRenderer renderNavigationBar:self withClass:_nuiClass];
}

- (void)drawRectNUI:(CGRect)rect
{   
    [self initNUI];
    
    if ([NUISettings hasProperty:@"background-color-top" withClass:_nuiClass]) {
        CAGradientLayer *gradient = [NUIGraphics
                             gradientLayerWithTop:[NUISettings getColor:@"background-color-top" withClass:_nuiClass] 
                             withBottom:[NUISettings getColor:@"background-color-bottom" withClass:_nuiClass]
                             withFrame:self.frame];
        [gradient renderInContext:UIGraphicsGetCurrentContext()];
    } else if ([NUISettings hasProperty:@"background-color" withClass:_nuiClass]) {
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetFillColor(context, CGColorGetComponents([[NUISettings getColor:@"background-color" withClass:_nuiClass] CGColor]));
        CGContextFillRect(context, rect);
    }
}

@end
