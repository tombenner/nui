//
//  AppDelegate.m
//  NUIDemo
//
//  Created by Tom Benner on 11/22/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate {
    NSMutableArray *demoItems;
}

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [NUISettings init];
        
    // Or use this call to use a specific stylesheet
    //[NUISettings initWithStylesheet:@"Blue.NUI"];

    demoItems = [NSMutableArray arrayWithCapacity:20];
    [demoItems addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                               @"John", @"name",
                               @"Guitar", @"description",
                               nil]];
    [demoItems addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                               @"Paul", @"name",
                               @"Bass", @"description",
                               nil]];
    [demoItems addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                               @"George", @"name",
                               @"Guitar", @"description",
                               nil]];
    [demoItems addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                               @"Ringo", @"name",
                               @"Drums", @"description",
                               nil]];
    UITabBarController *tabBarController = (UITabBarController *)self.window.rootViewController;
    UINavigationController *navigationController = [[tabBarController viewControllers] objectAtIndex:1];
    NUIDemoTableViewController *demoTableViewController = [[navigationController viewControllers] objectAtIndex:0];
    demoTableViewController.demoItems = demoItems;
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
