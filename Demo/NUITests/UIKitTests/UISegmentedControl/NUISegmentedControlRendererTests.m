//
//  NUISegmentedControlRendererTests.m
//  NUIDemo
//
//  Created by Paul Williamson on 02/06/2014.
//  Copyright (c) 2014 Tom Benner. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "NUIRenderer.h"
#import <FBSnapshotTestCase/UIImage+Compare.h>
#import <UIImage+ColorFromImage/UIImage+ColorFromImage.h>

@interface NUISegmentedControlRendererTests : XCTestCase
@property (strong, nonatomic) UISegmentedControl *sut;
@property (strong, nonatomic) NSDictionary *textAttributes;
@property (strong, nonatomic) NSDictionary *textAttributesSelected;
@end

@implementation NUISegmentedControlRendererTests

- (void)setUp
{
    [super setUp];
    
    [NUISettings initWithStylesheet:@"TestTheme.NUI"];
    
    _sut = [[UISegmentedControl alloc] initWithItems:@[@"one", @"two"]];
    _sut.frame = CGRectMake(0, 0, 200, 44);
    [_sut applyNUI];
    
    _textAttributes = [_sut titleTextAttributesForState:UIControlStateNormal];
    _textAttributesSelected = [_sut titleTextAttributesForState:UIControlStateSelected];
}

- (void)tearDown
{
    _sut = nil;
    [super tearDown];
}

#pragma mark - Tint Color

// background-tint-color (Color)
- (void)testSetBackgroundTintColor
{
    XCTAssertEqualObjects(_sut.tintColor, [UIColor yellowColor], @"NUI should set segmented control background tint color");
}

#pragma mark - Font Attributes

// font-color (Color)
- (void)testSetFontColor
{
    XCTAssertEqualObjects(_textAttributes[NSForegroundColorAttributeName], [UIColor blackColor], @"NUI should set segmented control font color");
}

// font-color-selected (Color)
- (void)testSetFontColorSelected
{
    XCTAssertEqualObjects(_textAttributesSelected[NSForegroundColorAttributeName], [UIColor grayColor], @"NUI should set segmented control font color when selected");
}

// font-name (FontName)
- (void)testSetFontName
{
    UIFont *font = _textAttributes[NSFontAttributeName];
    XCTAssertEqualObjects(font.familyName, @"Avenir", @"NUI should set segmented control font name");
}

// font-size (Number)
- (void)testSetFontSize
{
    UIFont *font = _textAttributes[NSFontAttributeName];
    XCTAssertEqual(font.pointSize, 12, @"NUI should set segmented control font size");
}

// text-shadow-color (Color)
- (void)testSetShadowColor
{
    NSShadow *shadow = _textAttributes[NSShadowAttributeName];
    XCTAssertEqualObjects(shadow.shadowColor, [UIColor darkGrayColor], @"NUI should set segmented control shadow color");
}

// text-shadow-color-selected (Color)
- (void)testSetShadowColorSelected
{
    NSShadow *shadow = _textAttributesSelected[NSShadowAttributeName];
    XCTAssertEqualObjects(shadow.shadowColor, [UIColor lightGrayColor], @"NUI should set segmented control shadow color when selected");
}

// text-shadow-offset (Offset)
- (void)testSetShadowOffset
{
    NSShadow *shadow = _textAttributes[NSShadowAttributeName];
    CGSize offset = CGSizeMake(1, 2);
    XCTAssertTrue(CGSizeEqualToSize(shadow.shadowOffset, offset), @"NUI should set segmented control shadow offset");
}

// text-shadow-offset-selected (Offset)
- (void)testSetShadowOffsetSelected
{
    NSShadow *shadow = _textAttributesSelected[NSShadowAttributeName];
    CGSize offset = CGSizeMake(2, 3);
    XCTAssertTrue(CGSizeEqualToSize(shadow.shadowOffset, offset), @"NUI should set segmented control shadow offset when selected");
}

@end
