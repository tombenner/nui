//
//  NUIButtonRendererBackgroundColorTests.m
//  NUIDemo
//
//  Created by Paul Williamson on 30/05/2014.
//  Copyright (c) 2014 Tom Benner. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "UIButton+NUI.h"
#import "NUIRenderer.h"

static NSString * const NUIButtonBackgroundColorTestsStyleClass = @"ButtonWithColor";

@interface NUIButtonRendererBackgroundColorTests : XCTestCase
@property (strong, nonatomic) UIButton *sut;
@end

@implementation NUIButtonRendererBackgroundColorTests

- (void)setUp
{
    [super setUp];
    
    [NUISettings initWithStylesheet:@"TestTheme.NUI"];
    
    _sut = [[UIButton alloc] init];
    _sut.nuiClass = NUIButtonBackgroundColorTestsStyleClass;
    [_sut applyNUI];
}

- (void)tearDown
{
    _sut = nil;
    
    [super tearDown];
}

- (UIColor *)backgroundColorForState:(UIControlState)state
{
    return [self colorFromImage:[_sut backgroundImageForState:state]];
}

- (UIColor *)colorFromImage:(UIImage *)image
{
    if (!image) {
        return nil;
    }
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    unsigned char *buffer = malloc(4);
    CGBitmapInfo bitmapInfo = kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big;
    CGContextRef context = CGBitmapContextCreate(buffer, 1, 1, 8, 4, colorSpace, bitmapInfo);
    CGColorSpaceRelease(colorSpace);
    CGContextDrawImage(context, CGRectMake(0.f, 0.f, 1.f, 1.f), image.CGImage);
    CGContextRelease(context);
    
    CGFloat r = buffer[0] / 255.f;
    CGFloat g = buffer[1] / 255.f;
    CGFloat b = buffer[2] / 255.f;
    CGFloat a = buffer[3] / 255.f;
    
    return [UIColor colorWithRed:r green:g blue:b alpha:a];
}

#pragma mark - Background Color

// background-color (Color)
- (void)testBackgroundColor
{
    XCTAssertEqualObjects([self backgroundColorForState:UIControlStateNormal], [UIColor redColor], @"NUI should set button background color");
}


// background-color-disabled (Color)
- (void)testBackgroundColorDisabled
{
    XCTAssertEqualObjects([self backgroundColorForState:UIControlStateDisabled], [UIColor greenColor], @"NUI should set button background color for disabled state");
}

// background-color-highlighted (Color)
- (void)testBackgroundColorHighlighted
{
    XCTAssertEqualObjects([self backgroundColorForState:UIControlStateHighlighted], [UIColor greenColor], @"NUI should set button background color for highlighted state");
}

// background-color-selected (Color)
- (void)testBackgroundColorSelected
{
    XCTAssertEqualObjects([self backgroundColorForState:UIControlStateSelected], [UIColor greenColor], @"NUI should set button background color for selected state");
}

// background-color-selected-disabled (Color)
- (void)testBackgroundColorSelectedDisabled
{
    XCTAssertEqualObjects([self backgroundColorForState:UIControlStateSelected|UIControlStateDisabled], [UIColor blueColor], @"NUI should set button background color when selected and disabled");
}
// background-color-selected-highlighted (Color)
- (void)testBackgroundColorSelectedHighlighted
{
    XCTAssertEqualObjects([self backgroundColorForState:UIControlStateSelected|UIControlStateHighlighted], [UIColor blueColor], @"NUI should set button background color when selected and highlighted");
}

#if defined(__IPHONE_OS_VERSION_MAX_ALLOWED) && __IPHONE_OS_VERSION_MAX_ALLOWED >= 80200

// font-name (FontName)
- (void)testSetFontName
{
    UIFont *font = _sut.titleLabel.font;
    NSString *expectedFontName = @".HelveticaNeueInterface-UltraLightP2";
    NSOperatingSystemVersion ios9_0_0 = (NSOperatingSystemVersion){9, 0, 0};
    if ([[NSProcessInfo processInfo] isOperatingSystemAtLeastVersion:ios9_0_0]) {
        expectedFontName = @".SFUIText-Light";
    }
    XCTAssertEqualObjects(font.fontName, expectedFontName, @"NUI should set button font name");
}

// font-size (Number)
- (void)testSetFontSize
{
    UIFont *font = _sut.titleLabel.font;
    XCTAssertEqual(font.pointSize, 13, @"NUI should set button font size");
}

#endif

@end
