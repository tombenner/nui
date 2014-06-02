//
//  NUISegmentedControlRendererBackgroundImagesTests.m
//  NUIDemo
//
//  Created by Paul Williamson on 02/06/2014.
//  Copyright (c) 2014 Tom Benner. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "NUIRenderer.h"
#import <FBSnapshotTestCase/UIImage+Compare.h>
#import <UIImage+ColorFromImage/UIImage+ColorFromImage.h>

static NSString * const NUISegmentedControlBackgroundImageTestsStyleClass = @"SegmentedControlWithImages";

@interface NUISegmentedControlRendererBackgroundImagesTests : XCTestCase
@property (strong, nonatomic) UISegmentedControl *sut;
@property (strong, nonatomic) NSDictionary *textAttributes;
@end

@implementation NUISegmentedControlRendererBackgroundImagesTests

- (void)setUp
{
    [super setUp];
    
    [NUISettings initWithStylesheet:@"TestTheme.NUI"];
    
    _sut = [[UISegmentedControl alloc] initWithItems:@[@"one", @"two"]];
    _sut.frame = CGRectMake(0, 0, 200, 44);
    _sut.nuiClass = NUISegmentedControlBackgroundImageTestsStyleClass;
    [_sut applyNUI];
    
    _textAttributes = [_sut titleTextAttributesForState:UIControlStateNormal];
}

- (void)tearDown
{
    _sut = nil;
    [super tearDown];
}

#pragma mark - Background Images

// background-image (Image)
- (void)testSetBackgroundImage
{
    UIImage *image = [UIImage imageNamed:@"background_image"];
    
    _sut.nuiClass = @"SegmentedControlWithImages";
    [_sut applyNUI];
    
    UIImage *backgroundImage = [_sut backgroundImageForState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    XCTAssertTrue([backgroundImage compareWithImage:image], @"NUI should set segmented control background image");
}

// background-image-insets (Box)
- (void)testSetBackgroundImageInsets
{
    UIImage *backgroundImage = [_sut backgroundImageForState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    UIEdgeInsets insets = UIEdgeInsetsMake(2, 2, 2, 2);
    
    XCTAssertTrue(UIEdgeInsetsEqualToEdgeInsets(backgroundImage.capInsets, insets), @"NUI should set segmented control background image insets");
}

// background-image-selected (Image)
- (void)testSetBackgroundImageSelected
{
    UIImage *image = [UIImage imageNamed:@"foreground_image"];
    
    _sut.nuiClass = @"SegmentedControlWithImages";
    [_sut applyNUI];
    
    UIImage *backgroundImage = [_sut backgroundImageForState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    
    XCTAssertTrue([backgroundImage compareWithImage:image], @"NUI should set segmented control background image when selected");
}

// background-image-selected-insets (Box)
- (void)testSetBackgroundImageInsetsSelected
{
    UIImage *backgroundImage = [_sut backgroundImageForState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    UIEdgeInsets insets = UIEdgeInsetsMake(2, 2, 2, 2);
    
    XCTAssertTrue(UIEdgeInsetsEqualToEdgeInsets(backgroundImage.capInsets, insets), @"NUI should set segmented control background image insets when selected");
}

// divider-image (Image)
- (void)testSetDividerImage
{
    UIImage *divider = [_sut dividerImageForLeftSegmentState:UIControlStateNormal rightSegmentState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    UIImage *image = [UIImage imageNamed:@"foreground_image"];
    XCTAssertEqualObjects(divider, image, @"NUI should set segmented control divider image");
}

@end
