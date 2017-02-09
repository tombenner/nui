//
//  UIBarButtonRendererBackgroundColorTests.m
//  NUIDemo
//
//  Created by Paul Williamson on 30/05/2014.
//  Copyright (c) 2014 Tom Benner. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "NUIRenderer.h"
#import <UIImage+ColorFromImage/UIImage+ColorFromImage.h>

@interface UIBarButtonRendererBackgroundColorTests : XCTestCase
@property (strong, nonatomic) UIBarButtonItem *sut;
@end

@implementation UIBarButtonRendererBackgroundColorTests

- (void)setUp
{
    [super setUp];
    [NUISettings initWithStylesheet:@"TestTheme.NUI"];
    
    _sut = [[UIBarButtonItem alloc] init];
    [_sut setTitle:@"button"];
    [_sut applyNUI];
}

- (void)tearDown
{
    _sut = nil;
    [super tearDown];
}

#pragma mark - Test Helpers

- (UIImage *)backgroundImageForState:(UIControlState)state
{
    return [_sut backgroundImageForState:state barMetrics:UIBarMetricsDefault];
}

// background-color (Color)
- (void)testSetBackgroundColor
{
    _sut.nuiClass = @"BarButtonWithBackgroundColor";
    [_sut applyNUI];
    
    UIImage *backgroundImage = [self backgroundImageForState:UIControlStateNormal];
    
    XCTAssertEqualObjects([backgroundImage sqf_colorFromImage], [UIColor greenColor], @"NUI should set button background color");
}

// background-color-highlighted (Color)
- (void)testSetBackgroundColorHighlighted
{
    _sut.nuiClass = @"BarButtonWithBackgroundColor";
    [_sut applyNUI];
    
    UIImage *backgroundImage = [self backgroundImageForState:UIControlStateHighlighted];
    
    XCTAssertEqualObjects([backgroundImage sqf_colorFromImage], [UIColor yellowColor], @"NUI should set button background color for highlighted state");
}

@end
