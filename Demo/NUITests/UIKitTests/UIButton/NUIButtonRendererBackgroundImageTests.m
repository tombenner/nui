//
//  NUIButtonBackgroundImageRendererTests.m
//  NUIDemo
//
//  Created by Paul Williamson on 30/05/2014.
//  Copyright (c) 2014 Tom Benner. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "UIButton+NUI.h"
#import <UIImage+Compare.h>

static NSString * const NUIButtonBackgroundImageTestsStyleClass = @"ButtonWithBackgroundImage";

@interface NUIButtonRendererBackgroundImageTests : XCTestCase
@property (strong, nonatomic) UIButton *sut;
@end

@implementation NUIButtonRendererBackgroundImageTests

- (void)setUp
{
    [super setUp];
    
    [NUISettings initWithStylesheet:@"TestTheme.NUI"];
    
    _sut = [[UIButton alloc] init];
    _sut.nuiClass = NUIButtonBackgroundImageTestsStyleClass;
    [_sut setTitle:@"button" forState:UIControlStateNormal];
    
    [_sut applyNUI];
}

- (void)tearDown
{
    _sut = nil;
    
    [super tearDown];
}

#pragma mark - Background Image

- (BOOL)equalImagesWithState:(UIControlState)state
{
    UIImage *image = [UIImage imageNamed:@"background_image"];
    UIImage *buttonImage = [_sut backgroundImageForState:state];
    
    return [buttonImage compareWithImage:image];
}

- (UIEdgeInsets)insetsForState:(UIControlState)state
{
    UIImage *buttonImage = [_sut backgroundImageForState:state];
    
    return [buttonImage capInsets];
}

// background-image (Image)
- (void)testSetBackgroundImage
{
    XCTAssertTrue([self equalImagesWithState:UIControlStateNormal], @"NUI should set button background image");
}

// background-image-insets (Box)
- (void)testSetBackgroundImageInsets
{
    UIEdgeInsets imageInsets = [self insetsForState:UIControlStateNormal];
    UIEdgeInsets expectedInsets = UIEdgeInsetsMake(2, 2, 2, 2);
    
    XCTAssertTrue(UIEdgeInsetsEqualToEdgeInsets(imageInsets, expectedInsets), @"NUI should set button background image insets");
}

// background-image-disabled (Image)
- (void)testSetBackgroundImageDisabled
{
    XCTAssertTrue([self equalImagesWithState:UIControlStateDisabled], @"NUI should set button background image for disabled state");
}

// background-image-disabled-insets (Box)
- (void)testSetBackgroundImageInsetsDisabled
{
    UIEdgeInsets imageInsets = [self insetsForState:UIControlStateDisabled];
    UIEdgeInsets expectedInsets = UIEdgeInsetsMake(2, 2, 2, 2);
    
    XCTAssertTrue(UIEdgeInsetsEqualToEdgeInsets(imageInsets, expectedInsets), @"NUI should set button background image insets for disabled state");
}

// background-image-highlighted (Image)
- (void)testSetBackgroundImageHighlighted
{
    XCTAssertTrue([self equalImagesWithState:UIControlStateHighlighted], @"NUI should set button background image for highlighted state");
}

// background-image-highlighted-insets (Box)
- (void)testSetBackgroundImageInsetsHighlighted
{
    UIEdgeInsets imageInsets = [self insetsForState:UIControlStateHighlighted];
    UIEdgeInsets expectedInsets = UIEdgeInsetsMake(2, 2, 2, 2);
    
    XCTAssertTrue(UIEdgeInsetsEqualToEdgeInsets(imageInsets, expectedInsets), @"NUI should set button background image insets for highlighted state");
}

// background-image-selected (Image)
- (void)testSetBackgroundImageSelected
{
    XCTAssertTrue([self equalImagesWithState:UIControlStateSelected], @"NUI should set button background image for selected state");
}

// background-image-selected-insets (Box)
- (void)testSetBackgroundImageInsetsSelected
{
    UIEdgeInsets imageInsets = [self insetsForState:UIControlStateSelected];
    UIEdgeInsets expectedInsets = UIEdgeInsetsMake(2, 2, 2, 2);
    
    XCTAssertTrue(UIEdgeInsetsEqualToEdgeInsets(imageInsets, expectedInsets), @"NUI should set button background image insets for selected state");
}

// background-image-selected-disabled (Image)
- (void)testSetBackgroundImageSelectedDisabled
{
    XCTAssertTrue([self equalImagesWithState:UIControlStateSelected|UIControlStateDisabled], @"NUI should set button background image when selected and disabled");
}

// background-image-selected-disabled-insets (Box)
- (void)testSetBackgroundImageInsetsSelectedDisabled
{
    UIEdgeInsets imageInsets = [self insetsForState:UIControlStateSelected|UIControlStateDisabled];
    UIEdgeInsets expectedInsets = UIEdgeInsetsMake(2, 2, 2, 2);
    
    XCTAssertTrue(UIEdgeInsetsEqualToEdgeInsets(imageInsets, expectedInsets), @"NUI should set button background image insets when selected and disabled");
}

// background-image-selected-highlighted (Image)
- (void)testSetBackgroundImageSelectedHighlighted
{
    XCTAssertTrue([self equalImagesWithState:UIControlStateSelected|UIControlStateHighlighted], @"NUI should set button background image when selected and highlighted");
}

// background-image-selected-highlighted-insets (Box)
- (void)testSetBackgroundImageInsetsSelectedHighlighted
{
    UIEdgeInsets imageInsets = [self insetsForState:UIControlStateSelected|UIControlStateHighlighted];
    UIEdgeInsets expectedInsets = UIEdgeInsetsMake(2, 2, 2, 2);
    
    XCTAssertTrue(UIEdgeInsetsEqualToEdgeInsets(imageInsets, expectedInsets), @"NUI should set button background image insets when selected and highlighted");
}

@end
