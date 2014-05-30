//
//  UIBarButtonRendererBackgroundImageTests.m
//  NUIDemo
//
//  Created by Paul Williamson on 30/05/2014.
//  Copyright (c) 2014 Tom Benner. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "NUIRenderer.h"
#import <FBSnapshotTestCase/UIImage+Compare.h>

static NSString * const NUIBarButtonBackgroundImageTestsStyleClass = @"BarButtonWithBackgroundImage";

@interface UIBarButtonRendererBackgroundImageTests : XCTestCase
@property (strong, nonatomic) UIBarButtonItem *sut;
@end

@implementation UIBarButtonRendererBackgroundImageTests

- (void)setUp
{
    [super setUp];
    [NUISettings initWithStylesheet:@"TestTheme.NUI"];
    
    _sut = [[UIBarButtonItem alloc] init];
    [_sut setTitle:@"button"];
    _sut.nuiClass = NUIBarButtonBackgroundImageTestsStyleClass;
    [_sut applyNUI];
}

- (void)tearDown
{
    _sut = nil;
    
    [super tearDown];
}

#pragma mark - Test Helpers

- (UIEdgeInsets)insetsForState:(UIControlState)state
{
    UIImage *buttonImage = [_sut backgroundImageForState:state barMetrics:UIBarMetricsDefault];
    
    return [buttonImage capInsets];
}

#pragma mark - Background Image Tests

// background-image (Image)
- (void)testSetBackgroundImage
{
    UIImage *image = [UIImage imageNamed:@"background_image"];
    UIImage *buttonImage = [_sut backgroundImageForState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    XCTAssertTrue([buttonImage compareWithImage:image], @"NUI should set bar button background image");
}

// background-image-insets (Box)
- (void)testSetBackgroundImageInsets
{
    UIEdgeInsets imageInsets = [self insetsForState:UIControlStateNormal];
    UIEdgeInsets expectedInsets = UIEdgeInsetsMake(2, 2, 2, 2);
    
    XCTAssertTrue(UIEdgeInsetsEqualToEdgeInsets(imageInsets, expectedInsets), @"NUI should set bar button background image insets");
}

@end
