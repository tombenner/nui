//
//  NUIPageControlRenderer.m
//  NUIDemo
//
//  Created by Yuichi Fujiki on 01/29/16.
//  Copyright (c) 2016 Yuichi Fujiki. All rights reserved.
//

#import "NUIPageControlRenderer.h"
#import "NUIViewRenderer.h"
#import "UIButton+NUI.h"

@implementation NUIPageControlRenderer

+ (void)render:(UIPageControl*)pageControl withClass:(NSString*)className
{
    // Set page indicator colors
    if ([NUISettings hasProperty:@"current-color" withClass:className]) {
        [pageControl setCurrentPageIndicatorTintColor:[NUISettings getColor:@"current-color" withClass:className]];
    }
    if ([NUISettings hasProperty:@"color" withClass:className]) {
        [pageControl setPageIndicatorTintColor:[NUISettings getColor:@"color" withClass:className]];
    }

    // Work around of the issue that rendering does not happen properly.
    // After setting color, you have to unset/set all pages as current.
    NSInteger currentPage = pageControl.currentPage;

    for (int i = 0; i < pageControl.numberOfPages; i++) {
        pageControl.currentPage = i;
    }
    pageControl.currentPage = currentPage;
}

@end
