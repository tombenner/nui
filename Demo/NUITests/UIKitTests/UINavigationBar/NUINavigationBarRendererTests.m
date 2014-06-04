//
//  NUINavigationBarRendererTests.m
//  NUIDemo
//
//  Created by Paul Williamson on 02/06/2014.
//  Copyright (c) 2014 Tom Benner. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "NUIRenderer.h"
#import <FBSnapshotTestCase/UIImage+Compare.h>

@interface NUINavigationBarRendererTests : XCTestCase
@property (strong, nonatomic) UINavigationBar *sut;
@property (strong, nonatomic) NSDictionary *textAttributes;
@end

@implementation NUINavigationBarRendererTests

- (void)setUp
{
    [super setUp];
    
    [NUISettings initWithStylesheet:@"TestTheme.NUI"];
    
    // Have to set frame to avoid invalid context warnings
    _sut = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    [_sut applyNUI];
    _textAttributes = [_sut titleTextAttributes];
}

- (void)tearDown
{
    self.sut = nil;
    [super tearDown];
}

// bar-tint-color (Color)
- (void)testSetBarTintColor
{
    XCTAssertEqualObjects(_sut.barTintColor, [UIColor orangeColor], @"NUI should set navigation bar bar tint color");
}

// background-color (Color)
- (void)testSetBackgroundColor
{
    XCTAssertEqualObjects(_sut.backgroundColor, [UIColor yellowColor], @"NUI should set navigation bar background color");
}

// background-image (Image)
- (void)testSetBackgroundImage
{
    _sut.nuiClass = @"NavigationBarWithBackgroundImage";
    [_sut applyNUI];
    
    UIImage *barBackgroundImage = [_sut backgroundImageForBarMetrics:UIBarMetricsDefault];
    UIImage *backgroundImage = [UIImage imageNamed:@"background_image"];
    
    // Images must be compared using FBSnapshotTestCase category
    // as resizable images always have unique pointers.
    XCTAssertTrue([barBackgroundImage compareWithImage:backgroundImage], @"NUI should set navigation bar background image");
}

// background-image-insets (Box)
- (void)testSetBackgroundImageInsets
{
    _sut.nuiClass = @"NavigationBarWithBackgroundImage";
    [_sut applyNUI];
    
    UIImage *barBackgroundImage = [_sut backgroundImageForBarMetrics:UIBarMetricsDefault];
    UIEdgeInsets insets = UIEdgeInsetsMake(2, 2, 2, 2);
    
    XCTAssertTrue(UIEdgeInsetsEqualToEdgeInsets([barBackgroundImage capInsets], insets), @"NUI should set navigation bar background image insets");
}

// background-tint-color (Color)
- (void)testSetBackgroundTintColor
{
    XCTAssertEqualObjects(_sut.tintColor, [UIColor redColor], @"NUI should set navigation bar tint color");
}

// font-color (Color)
- (void)testSetFontColor
{
    XCTAssertEqualObjects(_textAttributes[NSForegroundColorAttributeName], [UIColor greenColor], @"NUI should set navigation bar font color");
}

// font-name (FontName)
- (void)testSetFontName
{
    UIFont *font = _textAttributes[NSFontAttributeName];
    XCTAssertEqualObjects(font.familyName, @"Avenir", @"NUI should set navigation bar font name");
}

// font-size (Number)
- (void)testSetFontSize
{
    UIFont *font = _textAttributes[NSFontAttributeName];
    XCTAssertEqual(font.pointSize, 13, @"NUI should set navigation bar font size");
}

// shadow-image (Image)
- (void)testSetShadowImage
{
    UIImage *shadowImage = [UIImage imageNamed:@"shadow_image"];
    
    // Images must be compared using FBSnapshotTestCase category
    // as resizable images always have unique pointers.
    XCTAssertTrue([_sut.shadowImage compareWithImage:shadowImage], @"NUI should set navigation bar shadow image");
}

// text-shadow-color (Color)
- (void)testSetShadowColor
{
    NSShadow *shadow = _textAttributes[NSShadowAttributeName];
    XCTAssertEqualObjects(shadow.shadowColor, [UIColor darkGrayColor], @"NUI should set navigation bar shadow color");
}

// text-shadow-offset (Offset)
- (void)testSetShadowOffset
{
    NSShadow *shadow = _textAttributes[NSShadowAttributeName];
    CGSize offset = CGSizeMake(1, 2);
    XCTAssertTrue(CGSizeEqualToSize(shadow.shadowOffset, offset), @"NUI should set navigation bar shadow offset");
}

// title-vertical-offset (Number)
- (void)testSetTitleVerticalOffset
{
    XCTAssertEqualWithAccuracy([_sut titleVerticalPositionAdjustmentForBarMetrics:UIBarMetricsDefault], 2, 0.0001, @"NUI should set navigation bar title vertical offset");
}

@end
