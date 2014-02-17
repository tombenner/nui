//
//  main.m
//  NUIDemo
//
//  Created by Tom Benner on 11/22/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"

int main(int argc, char *argv[])
{
    @autoreleasepool {
        [NUISettings init];
        
        // Or use this call to use a specific stylesheet
        // [NUISettings initWithStylesheet:@"Blue.NUI"];

        // If you want to use the autoupdate capability uncomment this and set the path
        // to your .nss file. Comment the lines above.
        // [NUISettings setAutoUpdatePath:@"/path/to/Style.nss"];
        // [NUISettings initWithStylesheet:@"Style"];

        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
