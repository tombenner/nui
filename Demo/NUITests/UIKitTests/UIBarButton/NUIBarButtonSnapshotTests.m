//
//  UIBarButtonGradientSnapshotTest.m
//  NUIDemo
//
//  Created by Paul Williamson on 30/05/2014.
//  Copyright (c) 2014 Tom Benner. All rights reserved.
//

#import "FBSnapshotTestCase.h"

#import "NUIRenderer.h"

static NSString * const NUIBarButtonGradientTestsStyleClass = @"BarButtonWithGradientColor";

@interface NUIBarButtonSnapshotTests : FBSnapshotTestCase
@property (strong, nonatomic) UIButton *sut;
@end

@implementation NUIBarButtonSnapshotTests

- (void)setUp
{
    [super setUp];
    
    [NUISettings initWithStylesheet:@"TestTheme.NUI"];
    
    _sut = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 26)];
    _sut.nuiClass = NUIBarButtonGradientTestsStyleClass;
    [_sut applyNUI];
    
    // Flip this to YES to record images in the reference image directory.
    self.recordMode = NO;
}

// background-color-top/background-color-bottom (Gradient)
- (void)testButtonWithGradient
{
    FBSnapshotVerifyView(_sut, nil);
}

// border-color (Color)
// border-width (Number)
// corner-radius (Number)
- (void)testButtonWithBorder
{
    _sut.nuiClass = @"BarButtonWithBorder";
    [_sut applyNUI];
    
    FBSnapshotVerifyView(_sut, nil);
}

@end
