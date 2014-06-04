//
//  NUITabBarRendererGradientTests.m
//  NUIDemo
//
//  Created by Paul Williamson on 03/06/2014.
//  Copyright (c) 2014 Tom Benner. All rights reserved.
//

#import "FBSnapshotTestCase.h"

#import "NUIRenderer.h"

static NSString * const NUITabBarGradientTestsStyleClass = @"TabBarWithGradient";

@interface NUITabBarRendererGradientTests : FBSnapshotTestCase
@property (strong, nonatomic) UITabBar *sut;
@end

@implementation NUITabBarRendererGradientTests

- (void)setUp
{
    [super setUp];
    
    [NUISettings initWithStylesheet:@"TestTheme.NUI"];
    
    _sut = [[UITabBar alloc] initWithFrame:CGRectMake(0, 0, 80, 44)];
    _sut.nuiClass = NUITabBarGradientTestsStyleClass;
    [_sut applyNUI];
    
    // Flip this to YES to record images in the reference image directory.
    self.recordMode = NO;
}

#pragma mark - Button Gradients

// background-color-top/background-color-bottom (Gradient)
- (void)testTabBarWithGradient
{
    FBSnapshotVerifyView(_sut, nil);
}

@end
