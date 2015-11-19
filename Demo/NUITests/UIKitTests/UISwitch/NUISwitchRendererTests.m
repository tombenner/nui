//
//  NUISwitchRendererTests.m
//  NUIDemo
//
//  Created by Paul Williamson on 03/06/2014.
//  Copyright (c) 2014 Tom Benner. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "NUIRenderer.h"
#import <FBSnapshotTestCase/UIImage+Compare.h>

@interface NUISwitchRendererTests : XCTestCase
@property (strong, nonatomic) UISwitch *sut;
@end

@implementation NUISwitchRendererTests

- (void)setUp
{
    [super setUp];
    [NUISettings initWithStylesheet:@"TestTheme.NUI"];
    
    _sut = [[UISwitch alloc] init];
    [_sut applyNUI];
}

- (void)tearDown
{
    _sut = nil;
    [super tearDown];
}

#pragma mark - Background Color

// background-color (Color)
- (void)testSetBackgroundColor
{
    XCTAssertEqualObjects(_sut.backgroundColor, [UIColor orangeColor], @"NUI should set switch background color");
}

#pragma mark - Images

// off-image (Image)
- (void)testSetOffImage
{
    UIImage *offImage = _sut.offImage;
    UIImage *image = [UIImage imageNamed:@"background_image"];
    XCTAssertTrue([offImage compareWithImage:image], @"NUI should set switch off image");
}

// off-image-insets (Box)
- (void)testSetOffImageInsets
{
    UIEdgeInsets insets = UIEdgeInsetsMake(2, 2, 2, 2);
    XCTAssertTrue(UIEdgeInsetsEqualToEdgeInsets(_sut.offImage.capInsets, insets), @"NUI should set switch off image insets");
}

// on-image (Image)
- (void)testSetOnImage
{
    UIImage *onImage = _sut.onImage;
    UIImage *image = [UIImage imageNamed:@"foreground_image"];
    XCTAssertTrue([onImage compareWithImage:image], @"NUI should set switch on image");
}

// on-image-insets (Box)
- (void)testSetOnImageInsets
{
    UIEdgeInsets insets = UIEdgeInsetsMake(3, 3, 3, 3);
    XCTAssertTrue(UIEdgeInsetsEqualToEdgeInsets(_sut.onImage.capInsets, insets), @"NUI should set switch on image insets");
}

#pragma mark - Tint Color

// on-tint-color (Color)
- (void)testSetOnTintColor
{
    XCTAssertEqualObjects(_sut.onTintColor, [UIColor redColor], @"NUI should set switch on tint color");
}

// thumb-tint-color (Color)
- (void)testSetThumbTintColor
{
    XCTAssertEqualObjects(_sut.thumbTintColor, [UIColor yellowColor], @"NUI should set switch thumb tint color");
}

// tint-color (Color)
- (void)testSetTintColor
{
    XCTAssertEqualObjects(_sut.tintColor, [UIColor greenColor], @"NUI should set switch thumb tint color");
}

@end
