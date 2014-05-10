//
//  NUIButtonRendererForegroundImageTests.m
//  NUIDemo
//
//  Created by Paul Williamson on 30/05/2014.
//  Copyright (c) 2014 Tom Benner. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "UIButton+NUI.h"
#import <UIImage+Compare.h>

static NSString * const NUIButtonForegroundImageTestsStyleClass = @"ButtonWithImage";

@interface NUIButtonRendererForegroundImageTests : XCTestCase
@property (strong, nonatomic) UIButton *sut;
@end

@implementation NUIButtonRendererForegroundImageTests

- (void)setUp
{
    [super setUp];
    
    [NUISettings initWithStylesheet:@"TestTheme.NUI"];
    
    _sut = [[UIButton alloc] init];
    _sut.nuiClass = NUIButtonForegroundImageTestsStyleClass;
    [_sut applyNUI];
}

- (void)tearDown
{
    _sut = nil;
    
    [super tearDown];
}

#pragma mark - Test Helpers

- (BOOL)equalImagesWithState:(UIControlState)state
{
    UIImage *image = [UIImage imageNamed:@"foreground_image"];
    UIImage *buttonImage = [_sut imageForState:state];
    
    return [buttonImage compareWithImage:image];
}

- (UIEdgeInsets)insetsForState:(UIControlState)state
{
    UIImage *buttonImage = [_sut imageForState:state];
    
    return [buttonImage capInsets];
}

#pragma mark - Image

// image (Image)
- (void)testSetImage
{
    XCTAssertTrue([self equalImagesWithState:UIControlStateNormal], @"NUI should set button image");
}

// image-insets (Box)
- (void)testSetImageInsets
{
    UIEdgeInsets imageInsets = [self insetsForState:UIControlStateNormal];
    UIEdgeInsets expectedInsets = UIEdgeInsetsMake(2, 2, 2, 2);
    
    XCTAssertTrue(UIEdgeInsetsEqualToEdgeInsets(imageInsets, expectedInsets), @"NUI should set button image insets");
}

// -image-disabled (Image)
- (void)testSetImageDisabled
{
    XCTAssertTrue([self equalImagesWithState:UIControlStateDisabled], @"NUI should set button image for disabled state");
}

// -image-disabled-insets (Box)
- (void)testSetImageInsetsDisabled
{
    UIEdgeInsets imageInsets = [self insetsForState:UIControlStateDisabled];
    UIEdgeInsets expectedInsets = UIEdgeInsetsMake(2, 2, 2, 2);
    
    XCTAssertTrue(UIEdgeInsetsEqualToEdgeInsets(imageInsets, expectedInsets), @"NUI should set button image insets for disabled state");
}

// -image-highlighted (Image)
- (void)testSetImageHighlighted
{
    XCTAssertTrue([self equalImagesWithState:UIControlStateHighlighted], @"NUI should set button image for highlighted state");
}

// -image-highlighted-insets (Box)
- (void)testSetImageInsetsHighlighted
{
    UIEdgeInsets imageInsets = [self insetsForState:UIControlStateHighlighted];
    UIEdgeInsets expectedInsets = UIEdgeInsetsMake(2, 2, 2, 2);
    
    XCTAssertTrue(UIEdgeInsetsEqualToEdgeInsets(imageInsets, expectedInsets), @"NUI should set button image insets for highlighted state");
}

// -image-selected (Image)
- (void)testSetImageSelected
{
    XCTAssertTrue([self equalImagesWithState:UIControlStateSelected], @"NUI should set button image for selected state");
}

// -image-selected-insets (Box)
- (void)testSetImageInsetsSelected
{
    UIEdgeInsets imageInsets = [self insetsForState:UIControlStateSelected];
    UIEdgeInsets expectedInsets = UIEdgeInsetsMake(2, 2, 2, 2);
    
    XCTAssertTrue(UIEdgeInsetsEqualToEdgeInsets(imageInsets, expectedInsets), @"NUI should set button image insets for selected state");
}

// -image-selected-disabled (Image)
- (void)testSetImageSelectedDisabled
{
    XCTAssertTrue([self equalImagesWithState:UIControlStateSelected|UIControlStateDisabled], @"NUI should set button image when selected and disabled");
}

// -image-selected-disabled-insets (Box)
- (void)testSetImageInsetsSelectedDisabled
{
    UIEdgeInsets imageInsets = [self insetsForState:UIControlStateSelected|UIControlStateDisabled];
    UIEdgeInsets expectedInsets = UIEdgeInsetsMake(2, 2, 2, 2);
    
    XCTAssertTrue(UIEdgeInsetsEqualToEdgeInsets(imageInsets, expectedInsets), @"NUI should set button image insets when selected and disabled");
}

// -image-selected-highlighted (Image)
- (void)testSetImageSelectedHighlighted
{
    XCTAssertTrue([self equalImagesWithState:UIControlStateSelected|UIControlStateHighlighted], @"NUI should set button image when selected and highlighted");
}

// -image-selected-highlighted-insets (Box)
- (void)testSetImageInsetsSelectedHighlighted
{
    UIEdgeInsets imageInsets = [self insetsForState:UIControlStateSelected|UIControlStateHighlighted];
    UIEdgeInsets expectedInsets = UIEdgeInsetsMake(2, 2, 2, 2);
    
    XCTAssertTrue(UIEdgeInsetsEqualToEdgeInsets(imageInsets, expectedInsets), @"NUI should set button image insets when selected and highlighted");
}

@end
