//
//  NUIActivityIndicatorRendererTests.m
//  NUIDemo
//
//  Created by Gomez, Antonio on 25/04/2016.
//  Copyright © 2016 Tom Benner. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "NUIRenderer.h"

@interface NUIActivityIndicatorRendererTests : XCTestCase
@property (strong, nonatomic) UIActivityIndicatorView *sut;
@end

@implementation NUIActivityIndicatorRendererTests

- (void)setUp {
    [super setUp];
    
    [NUISettings initWithStylesheet:@"TestTheme.NUI"];
    
    _sut = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [_sut applyNUI];
    
}

- (void)tearDown {
    _sut = nil;
    [super tearDown];
}

// color (Color)
- (void)testSetColor {
    XCTAssertEqualObjects(_sut.color, [UIColor redColor], @"NUI should set color activity indicator color");
}

@end
