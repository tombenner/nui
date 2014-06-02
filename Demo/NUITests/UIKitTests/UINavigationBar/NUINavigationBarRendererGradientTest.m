//
//  NUINavigationBarRendererGradientTest.m
//  NUIDemo
//
//  Created by Paul Williamson on 02/06/2014.
//  Copyright (c) 2014 Tom Benner. All rights reserved.
//

#import "FBSnapshotTestCase.h"

#import "NUIRenderer.h"

static NSString * const NUINavigationBarGradientTestsStyleClass = @"NavigationBarWithGradient";

@interface NUINavigationBarRendererGradientTest : FBSnapshotTestCase
@property (strong, nonatomic) UINavigationBar *sut;
@end

@implementation NUINavigationBarRendererGradientTest

- (void)setUp
{
    [super setUp];
    
    [NUISettings initWithStylesheet:@"TestTheme.NUI"];
    
    _sut = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, 20, 44)];
    _sut.nuiClass = NUINavigationBarGradientTestsStyleClass;
    [_sut applyNUI];
    
    // Flip this to YES to record images in the reference image directory.
    self.recordMode = NO;
}

#pragma mark - Button Gradients

// background-color-top/background-color-bottom (Gradient)
- (void)testButtonWithGradient
{
    FBSnapshotVerifyView(_sut, nil);
}

@end
