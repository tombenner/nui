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
        // If you uncomment this and set the path to your .nss file, you can modify your .nss
        // file at runtime
        //[NUISettings setAutoUpdatePath:@"/path/to/Style.nss"];
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
