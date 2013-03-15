//
//  UIProgressView+NUI.m
//  NUIDemo
//
//  Created by Christopher Cotton on 3/13/13.
//  Copyright (c) 2013 Tom Benner. All rights reserved.
//

#import "UIProgressView+NUI.h"
#import "NUIRenderer.h"

@implementation UIProgressView (NUI)

- (void)initNUI
{
    if (!self.nuiClass) {
        self.nuiClass = @"Progress";
    }
}

- (void)applyNUI
{
    if ([self class] == [UIProgressView class] || self.nuiClass) {
        [self initNUI];
        if (![self.nuiClass isEqualToString:@"none"]) {
            [UIProgressView renderNui:self withClass:self.nuiClass];
        }
    }
    
    self.nuiIsApplied = [NSNumber numberWithBool:YES];
}

- (void)override_didMoveToWindow
{
    if (!self.nuiIsApplied) {
        [self applyNUI];
    }
    [self override_didMoveToWindow];
}


+(void)renderNui:(UIProgressView*)progressView
{
    [self renderNui:progressView withClass:@"Progress"];
}

+(void)renderNui:(UIProgressView*)progressView withClass:(NSString*)className
{
    if ([NUISettings hasProperty:@"progress-tint" withClass:className]) {
        progressView.progressTintColor = [NUISettings getColor:@"progress-tint" withClass:className];
    }

    if ([NUISettings hasProperty:@"progress-image" withClass:className]) {
        progressView.progressImage = [NUISettings getImage:@"progress-image" withClass:className];
    }

    if ([NUISettings hasProperty:@"track-tint" withClass:className]) {
        progressView.trackTintColor = [NUISettings getColor:@"track-tint" withClass:className];
    }
    
    if ([NUISettings hasProperty:@"tint-image" withClass:className]) {
        progressView.trackImage = [NUISettings getImage:@"tint-image" withClass:className];
    }

    [NUIViewRenderer renderSize:progressView withClass:className];
}

@end
