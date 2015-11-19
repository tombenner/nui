//
//  NUILabelRendererTests.m
//  NUIDemo
//
//  Created by Paul Williamson on 01/06/2014.
//  Copyright (c) 2014 Tom Benner. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "NUIRenderer.h"

@interface NUILabelRendererTests : XCTestCase
@property (strong, nonatomic) UILabel *sut;
@end

@implementation NUILabelRendererTests

- (void)setUp
{
    [super setUp];
    
    [NUISettings initWithStylesheet:@"TestTheme.NUI"];
    
    _sut = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 12, 12)];
    _sut.text = @"label";
    
    [_sut applyNUI];
}

- (void)tearDown
{
    self.sut = nil;
    [super tearDown];
}

// background-color (Color)
- (void)testSetBackgroundColor
{
    XCTAssertEqualObjects(_sut.backgroundColor, [UIColor redColor], @"NUI should set label background color");
}

// border-color (Color)
- (void)testSetBorderColor
{
    UIColor *borderColor = [UIColor colorWithCGColor:_sut.layer.borderColor];
    XCTAssertEqualObjects(borderColor, [UIColor greenColor], @"NUI should set label border color");
}

// border-width (Number)
- (void)testSetBorderWidth
{
    XCTAssertEqualObjects(@(_sut.layer.borderWidth), @2, @"NUI should set label border width");
}

// corner-radius (Number)
- (void)testSetCornerRadius
{
    XCTAssertEqualObjects(@(_sut.layer.cornerRadius), @2, @"NUI should set label border width");
}

// font-color (Color)
- (void)testSetFontColor
{
    XCTAssertEqualObjects(_sut.textColor, [UIColor blueColor], @"NUI should set label font color");
}

// font-color-highlighted (Color)
- (void)testSetFontColorHighlighted
{
    XCTAssertEqualObjects(_sut.highlightedTextColor, [UIColor yellowColor], @"NUI should set label font color when highlighted");
}

// font-name (FontName)
- (void)testSetFontName
{
    XCTAssertEqualObjects(_sut.font.familyName, @"Avenir", @"NUI should set label font name");
}

// font-size (Number)
- (void)testSetFontSize
{
    XCTAssertEqual(_sut.font.pointSize, 15, @"NUI should set label font size");
}

// height (Number)
- (void)testSetHeight
{
    XCTAssertEqual(CGRectGetHeight(_sut.frame), 50, @"NUI should set label height");
}

// shadow-color (Color)
- (void)testSetShadowColor
{
    UIColor *shadowColor = [UIColor colorWithCGColor:_sut.layer.shadowColor];
    XCTAssertEqualObjects(shadowColor, [UIColor blackColor], @"NUI should set label shadow color");
}

// shadow-offset (Offset)
- (void)testSetShadowOffset
{
    CGSize offset = CGSizeMake(1, 2);
    XCTAssertTrue(CGSizeEqualToSize(_sut.layer.shadowOffset, offset), @"NUI should set label shadow offset");
}

// shadow-opacity (Number)
- (void)testSetShadowOpacity
{
    XCTAssertEqualWithAccuracy(_sut.layer.shadowOpacity, 0.5, 0.0001, @"NUI should set label shadow opacity");
}

// shadow-radius (Number)
- (void)testSetShadowRadius
{
    XCTAssertEqualWithAccuracy(_sut.layer.shadowRadius, 2.0, 0.0001, @"NUI should set label shadow radius");
}

// text-align (TextAlign)
- (void)testSetTextAlign
{
    XCTAssertEqual(_sut.textAlignment, NSTextAlignmentCenter, @"NUI should set label text align");
}

// text-alpha (Number)
- (void)testSetTextAlpha
{
    XCTAssertEqualWithAccuracy(_sut.alpha, 0.9, 0.0001, @"NUI should set label alpha");
}

// text-auto-fit (Boolean)
- (void)testSetTextAutoFit
{
    XCTAssertTrue(_sut.adjustsFontSizeToFitWidth, @"NUI should set label text auto fit");
}

// text-shadow-color (Color)
- (void)testTextShadowColor
{
    XCTAssertEqualObjects(_sut.shadowColor, [UIColor blackColor], @"NUI should set label text shadow color");
}

// text-shadow-offset (Offset)
- (void)testTextShadowOffset
{
    CGSize offset = CGSizeMake(1, 2);
    XCTAssertTrue(CGSizeEqualToSize(_sut.shadowOffset, offset), @"NUI should set label text shadow offset");
}

// text-transform (TextTransform)
- (void)testTextTransform
{
    XCTAssertEqualObjects(_sut.text, @"LABEL", @"NUI should set label text transform");
}

// width (Number)
- (void)testSetWidth
{
    XCTAssertEqual(CGRectGetWidth(_sut.frame), 100, @"NUI should set label width");
}

@end
