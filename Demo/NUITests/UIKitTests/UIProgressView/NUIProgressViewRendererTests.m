//
//  NUIProgressViewRendererTests.m
//  NUIDemo
//
//  Created by Paul Williamson on 02/06/2014.
//  Copyright (c) 2014 Tom Benner. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "NUIRenderer.h"

@interface NUIProgressViewRendererTests : XCTestCase
@property (strong, nonatomic) UIProgressView *sut;
@end

@implementation NUIProgressViewRendererTests

- (void)setUp
{
    [super setUp];
    
    [NUISettings initWithStylesheet:@"TestTheme.NUI"];
    
    _sut = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    [_sut applyNUI];
}

- (void)tearDown
{
    _sut = nil;
    [super tearDown];
}

// progress-image (Image)
- (void)testSetProgressImage
{
    _sut.nuiClass = @"ProgressViewWithImages";
    [_sut applyNUI];
    
    UIImage *image = [UIImage imageNamed:@"background_image"];
    
    XCTAssertEqualObjects(_sut.progressImage, image, @"NUI should set progress view progress image");
}

// progress-tint-color (Color)
- (void)testSetProgressTintColor
{
    XCTAssertEqualObjects(_sut.progressTintColor, [UIColor orangeColor], @"NUI should set progress view progress tint color");
}

// track-image (Image)
- (void)testSetTrackImage
{
    _sut.nuiClass = @"ProgressViewWithImages";
    [_sut applyNUI];
    
    UIImage *image = [UIImage imageNamed:@"foreground_image"];
    
    XCTAssertEqualObjects(_sut.trackImage, image, @"NUI should set progress view track image");
}

// track-tint-color (Color)
- (void)testSetTrackTintColor
{
    XCTAssertEqualObjects(_sut.trackTintColor, [UIColor yellowColor], @"NUI should set progress view tint tint color");
}

// width (Number)
- (void)testSetWidth
{
    XCTAssertEqualWithAccuracy(CGRectGetWidth(_sut.frame), 80, 0.0001, @"NUI should set progress view width");
}

@end
