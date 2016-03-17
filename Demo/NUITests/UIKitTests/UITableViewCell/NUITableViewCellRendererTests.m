//
//  NUITableViewCellRendererTests.m
//  NUIDemo
//
//  Created by Alexey Trenikhin on 3/14/16.
//  Copyright © 2016 Tom Benner. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NUIRenderer.h"
@interface NUITableViewCellRendererTests : XCTestCase
@property (strong, nonatomic) UITableViewCell *sut;
@end

@implementation NUITableViewCellRendererTests

- (void)setUp {
    [super setUp];
    [NUISettings initWithStylesheet:@"TestTheme.NUI"];
    _sut = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"test"];
    [_sut applyNUI];
}

- (void)tearDown {
    self.sut = nil;
    [super tearDown];
}

- (void)testContentViewBackgroundColor {
    XCTAssertEqualObjects(self.sut.contentView.backgroundColor, [UIColor orangeColor], @"NUI should set content view background color");
}


@end
