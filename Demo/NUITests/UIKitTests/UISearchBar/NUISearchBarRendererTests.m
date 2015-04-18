//
//  NUISearchBarRendererTests.m
//  NUIDemo
//
//  Created by Paul Williamson on 02/06/2014.
//  Copyright (c) 2014 Tom Benner. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "NUIRenderer.h"
#import <FBSnapshotTestCase/UIImage+Compare.h>
#import <UIImage+ColorFromImage/UIImage+ColorFromImage.h>

@interface NUISearchBarRendererTests : XCTestCase
@property (strong, nonatomic) UISearchBar *sut;
@end

@implementation NUISearchBarRendererTests

- (void)setUp
{
    [super setUp];
    
    [NUISettings initWithStylesheet:@"TestTheme.NUI"];
    
    _sut = [[UISearchBar alloc] init];
    [_sut applyNUI];
}

- (void)tearDown
{
    _sut = nil;
    [super tearDown];
}

// background-color (Color)
- (void)testSetBackgroundColor
{
    UIColor *backgroundColor = [_sut.backgroundImage sqf_colorFromImage];
    XCTAssertEqualObjects(backgroundColor, [UIColor redColor], @"NUI should set search bar background color");
}

// background-image (Image)
- (void)testSetBackgroundImage
{
    UIImage *image = [UIImage imageNamed:@"background_image"];
    
    _sut.nuiClass = @"SearchBarWithImages";
    [_sut applyNUI];
    
    UIImage *backgroundImage = _sut.backgroundImage;
    
    XCTAssertTrue([backgroundImage compareWithImage:image], @"NUI should set search bar background image");
}

// background-tint-color (Color)
- (void)testSetBackgroundTintColor
{
    XCTAssertEqualObjects(_sut.tintColor, [UIColor orangeColor], @"NUI should set search bar background tint color");
}

// scope-background-color (Color)
- (void)testSetScopeBackgroundColor
{
    UIColor *scopeColor = [_sut.scopeBarBackgroundImage sqf_colorFromImage];
    XCTAssertEqualObjects(scopeColor, [UIColor blueColor], @"NUI should set search bar scope background color");
}

// scope-background-image (Image)
- (void)testSetScopeBackgroundImage
{
    UIImage *image = [UIImage imageNamed:@"foreground_image"];
    
    _sut.nuiClass = @"SearchBarWithImages";
    [_sut applyNUI];
    
    XCTAssertEqualObjects(_sut.scopeBarBackgroundImage, image, @"NUI should set search bar scope background image");
}

@end
