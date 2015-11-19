//
//  NUISearchBarRendererGradientTest.m
//  NUIDemo
//
//  Created by Paul Williamson on 02/06/2014.
//  Copyright (c) 2014 Tom Benner. All rights reserved.
//

#import "FBSnapshotTestCase.h"

#import "NUIRenderer.h"

static NSString * const NUISearchBarGradientTestsStyleClass = @"SearchBarWithGradient";

@interface NUISearchBarRendererGradientTest : FBSnapshotTestCase
@property (strong, nonatomic) UISearchBar *sut;
@end

@implementation NUISearchBarRendererGradientTest

- (void)setUp
{
    [super setUp];
    
    [NUISettings initWithStylesheet:@"TestTheme.NUI"];
    
    _sut = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 80, 44)];
    _sut.nuiClass = NUISearchBarGradientTestsStyleClass;
    [_sut applyNUI];
    
    // Flip this to YES to record images in the reference image directory.
    self.recordMode = NO;
}

#pragma mark - Button Gradients

// background-color-top/background-color-bottom (Gradient)
- (void)testButtonWithGradient
{
    NSString* identifier;
    NSString* version = [[UIDevice currentDevice] systemVersion];
    if ([@"8.0" compare:version options:NSNumericSearch] == NSOrderedDescending) {
      identifier = @"iOS7";
    }
  
    FBSnapshotVerifyView(_sut, identifier);
}

@end
