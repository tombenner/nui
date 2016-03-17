//
//  UITableViewCellRendererTests.m
//  NUIDemo
//
//  Created by Alexey Trenikhin on 3/16/16.
//  Copyright © 2016 Tom Benner. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NUIRenderer.h"
@interface UITableViewCellRendererTests : XCTestCase
@property (strong, nonatomic) UITableViewCell *sut;
@end

@implementation UITableViewCellRendererTests

- (void)setUp {
    [super setUp];
    [NUISettings initWithStylesheet:@"TestTheme.NUI"];
    
    _sut = [ [UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier:@"testCell"];
    [_sut applyNUI];
}

- (void)tearDown {
    self.sut = nil;
    [super tearDown];
}

- (void)testTintColor {
    XCTAssertEqual(_sut.tintColor, [UIColor greenColor] , @"NUI should set tintColor");
}

@end
