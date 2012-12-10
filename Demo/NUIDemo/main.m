//
//  main.m
//  NUIDemo
//
//  Created by Tom Benner on 11/22/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"
#import "NUISwizzler.h"

int main(int argc, char *argv[])
{
    @autoreleasepool {
        // Uncomment this line to test out the blue stylesheet
        // [NUISettings loadStylesheet:@"Blue.NUIStyle"];
        [[NUISwizzler new] swizzleAll];
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
