//
//  NUITabBarRendererBackgroundImageTests.m
//  NUIDemo
//
//  Created by Paul Williamson on 03/06/2014.
//  Copyright (c) 2014 Tom Benner. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "NUIRenderer.h"
#import <FBSnapshotTestCase/UIImage+Compare.h>

@interface NUITabBarRendererBackgroundImageTests : XCTestCase
@property (strong, nonatomic) UITabBar *sut;
@end

@implementation NUITabBarRendererBackgroundImageTests

- (void)setUp
{
    [super setUp];
    [NUISettings initWithStylesheet:@"TestTheme.NUI"];
    
    _sut = [[UITabBar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    _sut.nuiClass = @"TabBarWithImages";
    [_sut applyNUI];
}

- (void)tearDown
{
    _sut = nil;
    [super tearDown];
}

// background-image (Image)
- (void)testSetBackgroundImage
{
    UIImage *image = [UIImage imageNamed:@"background_image"];
    UIImage *backgroundImage = _sut.backgroundImage;
    XCTAssertTrue([backgroundImage compareWithImage:image], @"NUI should set tab bar background image");
}

// background-image-insets (Box)
- (void)testSetBackgroundImageInsets
{
    UIImage *backgroundImage = _sut.backgroundImage;
    UIEdgeInsets insets = UIEdgeInsetsMake(2, 2, 2, 2);
    XCTAssertTrue(UIEdgeInsetsEqualToEdgeInsets(backgroundImage.capInsets, insets), @"NUI should set tab bar background image insets");
}

// selected-image (Image)
- (void)testSetSelectedImage
{
    UIImage *image = [UIImage imageNamed:@"foreground_image"];
    UIImage *selectedImage = _sut.selectionIndicatorImage;
    XCTAssertTrue([selectedImage compareWithImage:image], @"NUI should set tab bar selected image");
}

@end
