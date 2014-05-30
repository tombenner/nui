//
//  UIBarButtonRendererTests.m
//  NUIDemo
//
//  Created by Paul Williamson on 30/05/2014.
//  Copyright (c) 2014 Tom Benner. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "NUIRenderer.h"

@interface UIBarButtonRendererTests : XCTestCase
@property (strong, nonatomic) UIBarButtonItem *sut;
@property (strong, nonatomic) NSDictionary *attributes;
@end

@implementation UIBarButtonRendererTests

- (void)setUp
{
    [super setUp];
    
    [NUISettings initWithStylesheet:@"TestTheme.NUI"];
    
    _sut = [[UIBarButtonItem alloc] init];
    [_sut setTitle:@"button"];
    [_sut applyNUI];
    
    _attributes = [_sut titleTextAttributesForState:UIControlStateNormal];
}

- (void)tearDown
{
    _sut = nil;
    [super tearDown];
}

// background-tint-color (Color)
- (void)testSetTintColor
{
    XCTAssertEqualObjects(_sut.tintColor, [UIColor orangeColor], @"NUI should set bar button tint color");
}

#pragma mark - Fonts

// font-color (Color)
- (void)testSetFontColor
{
    XCTAssertEqualObjects(_attributes[NSForegroundColorAttributeName], [UIColor blackColor], @"NUI should set bar button font color");
}

// font-name (FontName)
- (void)testSetFontName
{
    UIFont *font = _attributes[NSFontAttributeName];
    XCTAssertEqualObjects(font.familyName, @"Avenir", @"NUI should set bar button font name");
}

// font-size (Number)
- (void)testSetFontSize
{
    UIFont *font = _attributes[NSFontAttributeName];
    XCTAssertEqual(font.pointSize, 12, @"NUI should set bar button font size");
}

// text-shadow-color (Color)
- (void)testSetShadowColor
{
    NSShadow *shadow = _attributes[NSShadowAttributeName];
    XCTAssertEqualObjects(shadow.shadowColor, [UIColor darkGrayColor], @"NUI should set bar button shadow color");
}

// text-shadow-offset (Offset)
- (void)testSetShadowOffset
{
    NSShadow *shadow = _attributes[NSShadowAttributeName];
    CGSize offset = CGSizeMake(1, 2);
    XCTAssertTrue(CGSizeEqualToSize(shadow.shadowOffset, offset), @"NUI should set bar button shadow offset");
}

@end
