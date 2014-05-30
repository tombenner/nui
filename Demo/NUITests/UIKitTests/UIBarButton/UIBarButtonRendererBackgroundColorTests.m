//
//  UIBarButtonRendererBackgroundColorTests.m
//  NUIDemo
//
//  Created by Paul Williamson on 30/05/2014.
//  Copyright (c) 2014 Tom Benner. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "NUIRenderer.h"

@interface UIBarButtonRendererBackgroundColorTests : XCTestCase
@property (strong, nonatomic) UIBarButtonItem *sut;
@end

@implementation UIBarButtonRendererBackgroundColorTests

- (void)setUp
{
    [super setUp];
    [NUISettings initWithStylesheet:@"TestTheme.NUI"];
    
    _sut = [[UIBarButtonItem alloc] init];
    [_sut setTitle:@"button"];
    [_sut applyNUI];
}

- (void)tearDown
{
    _sut = nil;
    [super tearDown];
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

// background-color (Color)
- (void)testSetBackgroundColor
{
    _sut.nuiClass = @"BarButtonWithBackgroundColor";
    [_sut applyNUI];
    
    
    UIColor *color = [self colorFromImage:[_sut backgroundImageForState:UIControlStateNormal barMetrics:UIBarMetricsDefault]];
    
    XCTAssertEqualObjects(color, [UIColor greenColor], @"NUI should set button background color");
}

// background-color-highlighted (Color)
- (void)testSetBackgroundColorHighlighted
{
    _sut.nuiClass = @"BarButtonWithBackgroundColor";
    [_sut applyNUI];
    
    UIColor *color = [self colorFromImage:[_sut backgroundImageForState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault]];
    
    XCTAssertEqualObjects(color, [UIColor yellowColor], @"NUI should set button background color for highlighted state");
}

@end
