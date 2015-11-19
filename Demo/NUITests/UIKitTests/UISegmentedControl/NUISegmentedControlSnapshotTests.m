//
//  NUISegmentedControlSnapshotTests.m
//  NUIDemo
//
//  Created by Paul Williamson on 02/06/2014.
//  Copyright (c) 2014 Tom Benner. All rights reserved.
//

#import "FBSnapshotTestCase.h"

#import "NUIRenderer.h"

static NSString * const NUISegmentedControlTestsStyleClass = @"SegmentedControlColors";

@interface NUISegmentedControlSnapshotTests : FBSnapshotTestCase
@property (strong, nonatomic) UISegmentedControl *sut;
@end

@implementation NUISegmentedControlSnapshotTests

- (void)setUp
{
    [super setUp];
    
    [NUISettings initWithStylesheet:@"TestTheme.NUI"];
    
    _sut = [[UISegmentedControl alloc] initWithItems:@[@"one", @"two"]];
    _sut.frame = CGRectMake(0, 0, 100, 44);
    _sut.nuiClass = NUISegmentedControlTestsStyleClass;
    [_sut applyNUI];
    
    _sut.selectedSegmentIndex = 0;
    
    // Flip this to YES to record images in the reference image directory.
    self.recordMode = NO;
}

// background-color (Color)
// background-color-selected (Color)
// border-color (Color)
// border-width (Number)
// corner-radius (Number)
// divider-color (Color)
- (void)testSegmentedControlColorsRenderCorrectly
{
    NSString* version = [[UIDevice currentDevice] systemVersion];
    if ([@"7.1" compare:version options:NSNumericSearch] == NSOrderedDescending) {
      // Skip this test on iOS 7.0.3 or lower
      return;
    }
  
    NSString* identifier;
    if ([@"8.0" compare:version options:NSNumericSearch] == NSOrderedDescending) {
      identifier = @"iOS7";
    }
  
    FBSnapshotVerifyView(_sut, identifier);
}

@end
