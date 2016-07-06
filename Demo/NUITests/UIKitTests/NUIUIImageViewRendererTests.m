//
//  NUIUIImageViewRendererTests.m
//  NUIDemo
//
//  Created by Gomez, Antonio on 06/07/2016.
//  Copyright © 2016 Tom Benner. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NUIRenderer.h"

@interface NUIUIImageViewRendererTests : XCTestCase
@property (strong, nonatomic) UIImageView *sut;

@end

@implementation NUIUIImageViewRendererTests

- (void)setUp {
    [super setUp];
    
    [NUISettings initWithStylesheet:@"TestTheme.NUI"];
    
    _sut = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"background_image"]];
    _sut.nuiClass = @"ImageViewTint";
    [_sut applyNUI];
    
}

- (void)tearDown {
    _sut = nil;
    [super tearDown];
}

// color (Color)
- (void)testSetColor {
    XCTAssertEqualObjects(_sut.tintColor, [UIColor redColor], @"NUI should set image view tint color");
}


@end
