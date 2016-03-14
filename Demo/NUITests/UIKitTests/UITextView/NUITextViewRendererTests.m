//
//  NUITextViewRendererTests.m
//  NUIDemo
//
//  Created by Alexey Trenikhin on 3/13/16.
//  Copyright © 2016 Tom Benner. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NUIRenderer.h"
@interface NUITextViewRendererTests : XCTestCase
@property (strong, nonatomic) UITextView *sut;
@end

@implementation NUITextViewRendererTests

- (void)setUp {
    [super setUp];
    [NUISettings initWithStylesheet:@"TestTheme.NUI"];
    CGRect frame = CGRectMake(0.0, 0.0, 100.0, 30.0);
    _sut = [[UITextView alloc] initWithFrame:frame];
    [_sut applyNUI];
}

- (void)tearDown {
    self.sut = nil;
    [super tearDown];
}

- (void)testSetKeyboardAppearance {
    XCTAssertEqual(_sut.keyboardAppearance, UIKeyboardAppearanceDark, @"NUI should set keyboardAppearance");
}


@end
