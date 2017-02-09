//
//  NUISnapshotTests.m
//  NUIDemo
//
//  Created by Paul Williamson on 30/05/2014.
//  Copyright (c) 2014 Tom Benner. All rights reserved.
//

#import "FBSnapshotTestCase.h"

#import "NUIRenderer.h"

static NSString * const NUIButtonGradientTestsStyleClass = @"ButtonWithGradientColor";

@interface NUIButtonGradientSnapshotTest : FBSnapshotTestCase
@property (strong, nonatomic) UIButton *sut;
@end

@implementation NUIButtonGradientSnapshotTest

- (void)setUp
{
    [super setUp];
    
    [NUISettings initWithStylesheet:@"TestTheme.NUI"];
    
    _sut = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 80, 44)];
    _sut.nuiClass = NUIButtonGradientTestsStyleClass;
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