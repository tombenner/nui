//
//  NUIButtonTests.m
//  NUIDemo
//
//  Created by Paul Williamson on 29/05/2014.
//  Copyright (c) 2014 Tom Benner. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "NUIRenderer.h"

@interface NUIButtonRendererTests : XCTestCase
@property (strong, nonatomic) UIButton *sut;
@end

@implementation NUIButtonRendererTests

- (void)setUp
{
    [super setUp];
    
    [NUISettings initWithStylesheet:@"TestTheme.NUI"];
    
    _sut = [[UIButton alloc] init];
    [_sut setTitle:@"button" forState:UIControlStateNormal];
    [_sut applyNUI];
}

- (void)tearDown
{
    self.sut = nil;
    [super tearDown];
}

#pragma mark - Borders

// border-color (Color)
- (void)testBorderColor
{
    UIColor *layerColor = [UIColor colorWithCGColor:_sut.layer.borderColor];
    UIColor *shadowColor = [UIColor orangeColor];
    XCTAssertEqualObjects(layerColor, shadowColor, @"NUI should set button border color");
}

// border-width (Number)
- (void)testSetBorderWidth
{
    XCTAssertEqual(_sut.layer.borderWidth, 2, @"NUI should set button border width");
}

// content-insets (Box)
- (void)testSetContentInsets
{
    UIEdgeInsets insets = UIEdgeInsetsMake(8, 8, 8, 8);
    XCTAssertTrue(UIEdgeInsetsEqualToEdgeInsets(_sut.contentEdgeInsets, insets), @"NUI should set button content insets");
}

// corner-radius (Number)
- (void)testSetCornerRadius
{
    XCTAssertEqual(_sut.layer.cornerRadius, 4, @"NUI should set button corner radius");
}

#pragma mark - Fonts

// font-color (Color)
- (void)testFontColor
{
    UIColor *fontColor = [UIColor blackColor];
    XCTAssertEqualObjects([_sut titleColorForState:UIControlStateNormal], fontColor, @"NUI should set button font color");
}

// font-color-disabled (Color)
- (void)testFontColorDisabled
{
    UIColor *fontColor = [UIColor grayColor];
    XCTAssertEqualObjects([_sut titleColorForState:UIControlStateDisabled], fontColor, @"NUI should set button font color disabled");
}

// font-color-highlighted (Color)
- (void)testFontColorHighlighted
{
    UIColor *fontColor = [UIColor lightGrayColor];
    XCTAssertEqualObjects([_sut titleColorForState:UIControlStateHighlighted], fontColor, @"NUI should set button font color highlighted");
}

// font-color-selected (Color)
- (void)testFontColorSelected
{
    UIColor *fontColor = [UIColor darkGrayColor];
    XCTAssertEqualObjects([_sut titleColorForState:UIControlStateSelected], fontColor, @"NUI should set button font color selected");
}

// font-color-selected-disabled (Color)
- (void)testFontColorSelectedDisabled
{
    UIColor *fontColor = [UIColor redColor];
    
    XCTAssertEqualObjects([_sut titleColorForState:UIControlStateSelected|UIControlStateDisabled], fontColor, @"NUI should set button font color whtn selected and disabled");
}

// font-color-selected-highlighted (Color)
- (void)testFontColorSelectedHighlighted
{
    UIColor *fontColor = [UIColor greenColor];
    
    XCTAssertEqualObjects([_sut titleColorForState:UIControlStateSelected|UIControlStateHighlighted], fontColor, @"NUI should set button font color when selected and highlighted");
}

// font-name (FontName)
- (void)testSetFontName
{
    UIFont *font = _sut.titleLabel.font;
    XCTAssertEqualObjects(font.familyName, @"Avenir", @"NUI should set button font name");
}

// font-size (Number)
- (void)testSetFontSize
{
    UIFont *font = _sut.titleLabel.font;
    XCTAssertEqual(font.pointSize, 16, @"NUI should set button font size");
}

#pragma mark - Padding

// padding (Box)
- (void)testSetPadding
{
    UIEdgeInsets insets = UIEdgeInsetsMake(7, 7, 7, 7);
    XCTAssertTrue(UIEdgeInsetsEqualToEdgeInsets(_sut.titleEdgeInsets, insets), @"NUI should set button padding");
}

#pragma mark - Shadows

// shadow-color (Color)
- (void)testShadowColor
{
    UIColor *layerColor = [UIColor colorWithCGColor:_sut.layer.shadowColor];
    UIColor *shadowColor = [UIColor blackColor];
    XCTAssertEqualObjects(layerColor, shadowColor, @"NUI should set button shadow color");
}

// shadow-offset (Offset)
- (void)testShadowOffset
{
    CGSize offset = CGSizeMake(1, 2);
    XCTAssertTrue(CGSizeEqualToSize(_sut.layer.shadowOffset, offset), @"NUI should set button shadow offset");
}

// shadow-opacity (Number)
- (void)testShadowOpacity
{
    XCTAssertEqual(_sut.layer.shadowOpacity, 0.5, @"NUI should set button shadow opacity");
}

// shadow-radius (Number)
- (void)testShadowRadius
{
    XCTAssertEqual(_sut.layer.shadowRadius, 4, @"NUI should set button shadow radius");
}

#pragma mark - Text
// text-align (TextAlign)
- (void)testTextAlign
{
    XCTAssertEqual(_sut.contentHorizontalAlignment, UIControlContentHorizontalAlignmentLeft, @"NUI should set button text-align");
}

// text-alpha (Number)
- (void)testTextAlpha
{
    XCTAssertEqualWithAccuracy(_sut.titleLabel.alpha, 0.8, 0.0001, @"NUI should set button text alpha");
}

// text-auto-fit (Boolean)
- (void)testTextAutoFit
{
    XCTAssertTrue(_sut.titleLabel.adjustsFontSizeToFitWidth, @"NUI should set button text auto fit");
}

// text-shadow-color (Color)
- (void)testTextShadowColor
{
    UIColor *shadowColor = [UIColor blackColor];
    XCTAssertEqualObjects(_sut.titleLabel.shadowColor, shadowColor, @"NUI should set button text shadow color");
}

// text-shadow-color-disabled (Color)
- (void)testTextShadowColorDisabled
{
    UIColor *shadowColor = [UIColor grayColor];
    XCTAssertEqualObjects([_sut titleShadowColorForState:UIControlStateDisabled], shadowColor, @"NUI should set button text shadow disabled color");
}

// text-shadow-color-highlighted (Color)
- (void)testTextShadowColorHighlighted
{
    UIColor *shadowColor = [UIColor lightGrayColor];
    XCTAssertEqualObjects([_sut titleShadowColorForState:UIControlStateHighlighted], shadowColor, @"NUI should set button text shadow highlighted color");
}

// text-shadow-color-selected (Color)
- (void)testTextShadowColorSelected
{
    UIColor *shadowColor = [UIColor darkGrayColor];
    XCTAssertEqualObjects([_sut titleShadowColorForState:UIControlStateSelected], shadowColor, @"NUI should set button text shadow selected color");
}

// text-shadow-color-selected-disabled (Color)
- (void)testTextShadowColorSelectedDisabled
{
    UIColor *shadowColor = [UIColor greenColor];
    
    XCTAssertEqualObjects([_sut titleShadowColorForState:UIControlStateSelected|UIControlStateDisabled], shadowColor, @"NUI should set button text shadow selected and disabled color");
}

// text-shadow-color-selected-highlighted (Color)
- (void)testTextShadowColorSelectedHighlighted
{
    UIColor *shadowColor = [UIColor redColor];
    
    XCTAssertEqualObjects([_sut titleShadowColorForState:UIControlStateSelected|UIControlStateHighlighted], shadowColor, @"NUI should set button text shadow selected and highlighted color");
}

// text-shadow-offset (Offset)
- (void)testTextShadowOffset
{
    CGSize offset = CGSizeMake(2, 1);
    XCTAssertTrue(CGSizeEqualToSize(_sut.titleLabel.shadowOffset, offset), @"NUI should set button text shadow offset");
}

// text-transform (TextTransform)
- (void)testTextTransform
{
    NSString *labelText = _sut.titleLabel.text;
    XCTAssertEqualObjects(labelText, @"BUTTON", @"NUI should set button text transform");
}

// title-insets (Box)
- (void)testSetTitleEdgeInsets
{
    UIEdgeInsets insets = UIEdgeInsetsMake(7, 7, 7, 7);
    XCTAssertTrue(UIEdgeInsetsEqualToEdgeInsets(_sut.titleEdgeInsets, insets), @"NUI should set button title insets");
}

#pragma mark - Size

// height (Number)
- (void)testSetHeight
{
    CGFloat height = CGRectGetHeight(_sut.frame);
    XCTAssertEqual(height, 37, @"NUI should set button height");
}

// width (Number)
- (void)testSetWidth
{
    CGFloat width = CGRectGetWidth(_sut.frame);
    XCTAssertEqual(width, 80, @"NUI should set button width");
}

@end
