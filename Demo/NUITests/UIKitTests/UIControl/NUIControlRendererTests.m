//
//  NUIControlRendererTests.m
//  NUIDemo
//
//  Created by Paul Williamson on 31/05/2014.
//  Copyright (c) 2014 Tom Benner. All rights reserved.
//

#import "FBSnapshotTestCase.h"

#import "NUIRenderer.h"

@interface NUIControlRendererTests : FBSnapshotTestCase
@property (strong, nonatomic) UIControl *sut;
@end

@implementation NUIControlRendererTests

- (void)setUp
{
    [super setUp];
    
    [NUISettings initWithStylesheet:@"TestTheme.NUI"];
    
    _sut = [[UIControl alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    [_sut applyNUI];
    
    self.recordMode = NO;
}

- (void)tearDown
{
    self.sut = nil;
    [super tearDown];
}

// background-color (Color)
- (void)testSetBackgroundColor
{
    UIColor *color = [UIColor greenColor];
    XCTAssertEqualObjects(_sut.backgroundColor, color, @"NUI should set control background color");
}

// background-image (Image)
- (void)testSetBackgroundImage
{
    _sut.nuiClass = @"ControlWithBackgroundImage";
    [_sut applyNUI];
    
    FBSnapshotVerifyView(_sut, nil);
}

// border-color (Color)
- (void)testSetBorderColor
{
    UIColor *borderColor = [UIColor colorWithCGColor:_sut.layer.borderColor];
    XCTAssertEqualObjects(borderColor, [UIColor redColor], @"NUI should set control border color");
}

// border-width (Number)
- (void)testSetBorderWidth
{
    XCTAssertEqualObjects(@(_sut.layer.borderWidth), @2, @"NUI should set control border width");
}

// corner-radius (Number)
- (void)testSetCornerRadius
{
    XCTAssertEqualObjects(@(_sut.layer.cornerRadius), @2, @"NUI should set control corner radius");
}

// shadow-color (Color)
- (void)testSetShadowColor
{
    UIColor *shadowColor = [UIColor colorWithCGColor:_sut.layer.shadowColor];
    XCTAssertEqualObjects(shadowColor, [UIColor blackColor], @"NUI should set control shadow color");
}

// shadow-offset (Offset)
- (void)testSetShadowOffset
{
    CGSize offset = CGSizeMake(1, 2);
    XCTAssertTrue(CGSizeEqualToSize(_sut.layer.shadowOffset, offset), @"NUI should set control shadow offset");
}

// shadow-opacity (Number)
- (void)testSetShadowOpacity
{
    XCTAssertEqualWithAccuracy(_sut.layer.shadowOpacity, 0.5, 0.0001, @"NUI should set control shadow opacity");
    
}

// shadow-radius (Number)
- (void)testSetShadowRadius
{
    XCTAssertEqualObjects(@(_sut.layer.shadowRadius), @2, @"NUI should set control shadow radius");
}

@end
