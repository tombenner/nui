//
//  UISliderRendererTests.m
//  NUIDemo
//
//  Created by Paul Williamson on 02/06/2014.
//  Copyright (c) 2014 Tom Benner. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "NUIRenderer.h"

@interface UISliderRendererTests : XCTestCase
@property (strong, nonatomic) UISlider *sut;
@end

@implementation UISliderRendererTests

- (void)setUp
{
    [super setUp];
    [NUISettings initWithStylesheet:@"TestTheme.NUI"];
    
    _sut = [[UISlider alloc] init];
    [_sut applyNUI];
}

- (void)tearDown
{
    _sut = nil;
    [super tearDown];
}

#pragma mark - Track Color

// minimum-track-tint-color (Color)
- (void)testSetMinimumTrackTintColor
{
    XCTAssertEqualObjects(_sut.minimumTrackTintColor, [UIColor orangeColor], @"NUI should set slider minimum track tint color");
}

// maximum-track-tint-color (Color)
- (void)testSetMaximumTrackTintColor
{
    NSString* version = [[UIDevice currentDevice] systemVersion];
    if ([@"9.0" compare:version options:NSNumericSearch] == NSOrderedDescending
        && [@"8.2" compare:version options:NSNumericSearch] == NSOrderedAscending) {
        // maximumTrackTintColor getter is broken on iOS 8.3 and 8.4
        return;
    }
    
    XCTAssertEqualObjects(_sut.maximumTrackTintColor, [UIColor redColor], @"NUI should set slider maximum track tint color");
}

#pragma mark - Images

// minimum-value-image (Image)
- (void)testSetMinimumValueImage
{
    UIImage *image = [UIImage imageNamed:@"background_image"];
    XCTAssertEqualObjects(_sut.minimumValueImage, image, @"NUI should set slider minimum value image");
}

// maximum-value-image (Image)
- (void)testSetMaximumValueImage
{
    UIImage *image = [UIImage imageNamed:@"foreground_image"];
    XCTAssertEqualObjects(_sut.maximumValueImage, image, @"NUI should set slider maximum value image");
}

// thumb-image (Image)
- (void)testSetThumbImage
{
    _sut.nuiClass = @"SliderWithImage";
    [_sut applyNUI];
    
    UIImage *image = [UIImage imageNamed:@"background_image"];
    XCTAssertEqualObjects([_sut thumbImageForState:UIControlStateNormal], image, @"NUI should set slider thumb image");
}

#pragma mark - Tint Color

// thumb-tint-color (Color)
- (void)testSetThumbTintColor
{
    XCTAssertEqualObjects(_sut.thumbTintColor, [UIColor blueColor], @"NUI should set slider thumb tint color");
}

@end
