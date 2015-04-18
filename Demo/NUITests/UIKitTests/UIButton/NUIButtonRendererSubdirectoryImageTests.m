//
//  NUIButtonRendererSubdirectoryImageTests.m
//  NUIDemo
//
//  Created by Paul Williamson on 06/08/2014.
//  Copyright (c) 2014 John McIntosh. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "UIButton+NUI.h"
#import <UIImage+Compare.h>

static NSString * const NUIButtonSubdirectoryImageTestsStyleClass = @"ButtonWithImageFromSubdirectory";

@interface NUIButtonRendererSubdirectoryImageTests : XCTestCase
@property (strong, nonatomic) UIButton *sut;
@end

@implementation NUIButtonRendererSubdirectoryImageTests

- (void)setUp
{
    [super setUp];
    
    [NUISettings initWithStylesheet:@"TestTheme.NUI"];
    
    _sut = [[UIButton alloc] init];
    _sut.nuiClass = NUIButtonSubdirectoryImageTestsStyleClass;
    [_sut setTitle:@"button" forState:UIControlStateNormal];
    
    [_sut applyNUI];
}

- (void)tearDown
{
    _sut = nil;
    
    [super tearDown];
}

#pragma mark - Background Image

- (BOOL)equalBackgroundImagesWithState:(UIControlState)state
{
    UIImage *image = [UIImage imageNamed:@"Assets/subdirectory_image"];
    UIImage *buttonImage = [_sut backgroundImageForState:state];
    
    return [buttonImage compareWithImage:image];
}

- (BOOL)equalForegroundImagesWithState:(UIControlState)state
{
    UIImage *image = [UIImage imageNamed:@"Assets/subdirectory_image"];
    UIImage *buttonImage = [_sut imageForState:state];
    
    return [buttonImage compareWithImage:image];
}

// background-image (Image)
- (void)testSetBackgroundImage
{
    XCTAssertTrue([self equalBackgroundImagesWithState:UIControlStateNormal], @"NUI should set button background image");
}

// background-image-disabled (Image)
- (void)testSetBackgroundImageDisabled
{
    XCTAssertTrue([self equalBackgroundImagesWithState:UIControlStateDisabled], @"NUI should set button background image for disabled state");
}

// background-image-highlighted (Image)
- (void)testSetBackgroundImageHighlighted
{
    XCTAssertTrue([self equalBackgroundImagesWithState:UIControlStateHighlighted], @"NUI should set button background image for highlighted state");
}

// background-image-selected (Image)
- (void)testSetBackgroundImageSelected
{
    XCTAssertTrue([self equalBackgroundImagesWithState:UIControlStateSelected], @"NUI should set button background image for selected state");
}

// background-image-selected-disabled (Image)
- (void)testSetBackgroundImageSelectedDisabled
{
    XCTAssertTrue([self equalBackgroundImagesWithState:UIControlStateSelected|UIControlStateDisabled], @"NUI should set button background image when selected and disabled");
}

// background-image-selected-highlighted (Image)
- (void)testSetBackgroundImageSelectedHighlighted
{
    XCTAssertTrue([self equalBackgroundImagesWithState:UIControlStateSelected|UIControlStateHighlighted], @"NUI should set button background image when selected and highlighted");
}

#pragma mark - Foreground Image

// image (Image)
- (void)testSetImage
{
    XCTAssertTrue([self equalForegroundImagesWithState:UIControlStateNormal], @"NUI should set button image");
}

// -image-disabled (Image)
- (void)testSetImageDisabled
{
    XCTAssertTrue([self equalForegroundImagesWithState:UIControlStateDisabled], @"NUI should set button image for disabled state");
}

// -image-highlighted (Image)
- (void)testSetImageHighlighted
{
    XCTAssertTrue([self equalForegroundImagesWithState:UIControlStateHighlighted], @"NUI should set button image for highlighted state");
}

// -image-selected (Image)
- (void)testSetImageSelected
{
    XCTAssertTrue([self equalForegroundImagesWithState:UIControlStateSelected], @"NUI should set button image for selected state");
}

// -image-selected-disabled (Image)
- (void)testSetImageSelectedDisabled
{
    XCTAssertTrue([self equalForegroundImagesWithState:UIControlStateSelected|UIControlStateDisabled], @"NUI should set button image when selected and disabled");
}

// -image-selected-highlighted (Image)
- (void)testSetImageSelectedHighlighted
{
    XCTAssertTrue([self equalForegroundImagesWithState:UIControlStateSelected|UIControlStateHighlighted], @"NUI should set button image when selected and highlighted");
}

@end
