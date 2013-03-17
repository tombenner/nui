//
//  NUIRenderer.m
//  NUIDemo
//
//  Created by Tom Benner on 11/24/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import "NUIRenderer.h"
#import "UIProgressView+NUI.h"

@implementation NUIRenderer

@synthesize renderedObjects;
@synthesize renderedObjectIdentifiers;
static NUIRenderer *instance = nil;


+ (void)renderBarButtonItem:(UIBarButtonItem*)item
{
    [NUIBarButtonItemRenderer render:item withClass:@"BarButton"];
    [self registerObject:item];
}

+ (void)renderBarButtonItem:(UIBarButtonItem*)item withClass:(NSString*)className
{
    [NUIBarButtonItemRenderer render:item withClass:className];
    [self registerObject:item];
}



+ (void)renderButton:(UIButton*)button
{
    [NUIButtonRenderer render:button withClass:@"Button"];
    [self registerObject:button];
}

+ (void)renderButton:(UIButton*)button withClass:(NSString*)className
{
    [NUIButtonRenderer render:button withClass:className];
    [self registerObject:button];
}



+ (void)renderControl:(UIControl*)control
{
    [NUIControlRenderer render:control withClass:@"Control"];
    [self registerObject:control];
}

+ (void)renderControl:(UIControl*)control withClass:(NSString*)className
{
    [NUIControlRenderer render:control withClass:className];
    [self registerObject:control];
}

+ (void)renderLabel:(UILabel*)label
{
    [NUILabelRenderer render:label withClass:@"Label"];
    [self registerObject:label];
}

+ (void)renderLabel:(UILabel*)label withClass:(NSString*)className
{
    [NUILabelRenderer render:label withClass:className];
    [self registerObject:label];
}

+ (void)renderLabel:(UILabel*)label withClass:(NSString*)className withSuffix:(NSString*)suffix
{
    [NUILabelRenderer render:label withClass:className withSuffix:suffix];
    [self registerObject:label];
}



+ (void)renderNavigationBar:(UINavigationBar*)bar
{
    [NUINavigationBarRenderer render:bar withClass:@"NavigationBar"];
    [self registerObject:bar];
}

+ (void)renderNavigationBar:(UINavigationBar*)bar withClass:(NSString*)className
{
    [NUINavigationBarRenderer render:bar withClass:className];
    [self registerObject:bar];
}



+ (void)renderProgressView:(UIProgressView*)progressView
{
    [NUIProgressViewRenderer render:progressView];
    [self registerObject:progressView];
}

+ (void)renderProgressView:(UIProgressView*)progressView withClass:(NSString*)className
{
    [NUIProgressViewRenderer render:progressView withClass:className];
    [self registerObject:progressView];
}



+ (void)renderNavigationItem:(UINavigationItem *)item
{
    [NUINavigationItemRenderer render:item withClass:@"NavigationBar"];
    [self registerObject:item];
}

+ (void)renderNavigationItem:(UINavigationItem*)item withClass:(NSString*)className
{
    [NUINavigationItemRenderer render:item withClass:className];
    [self registerObject:item];
}


+ (void)renderSearchBar:(UISearchBar*)bar
{
    [NUISearchBarRenderer render:bar withClass:@"SearchBar"];
    [self registerObject:bar];
}

+ (void)renderSearchBar:(UISearchBar*)bar withClass:(NSString*)className
{
    [NUISearchBarRenderer render:bar withClass:className];
    [self registerObject:bar];
}



+ (void)renderSegmentedControl:(UISegmentedControl*)control
{
    [NUISegmentedControlRenderer render:control withClass:@"SegmentedControl"];
    [self registerObject:control];
}

+ (void)renderSegmentedControl:(UISegmentedControl*)control withClass:(NSString*)className
{
    [NUISegmentedControlRenderer render:control withClass:className];
    [self registerObject:control];
}


+ (void)renderSlider:(UISlider*)slider
{
    [NUISliderRenderer render:slider withClass:@"Slider"];
    [self registerObject:slider];
}

+ (void)renderSlider:(UISlider*)slider withClass:(NSString*)className
{
    [NUISliderRenderer render:slider withClass:className];
    [self registerObject:slider];
}


+ (void)renderSwitch:(UISwitch*)uiSwitch
{
    [NUISwitchRenderer render:uiSwitch withClass:@"Switch"];
    [self registerObject:uiSwitch];
}

+ (void)renderSwitch:(UISwitch*)uiSwitch withClass:(NSString*)className
{
    [NUISwitchRenderer render:uiSwitch withClass:className];
    [self registerObject:uiSwitch];
}



+ (void)renderTabBar:(UITabBar*)bar
{
    [NUITabBarRenderer render:bar withClass:@"TabBar"];
    [self registerObject:bar];
}

+ (void)renderTabBar:(UITabBar*)bar withClass:(NSString*)className
{
    [NUITabBarRenderer render:bar withClass:className];
    [self registerObject:bar];
}



+ (void)renderTabBarItem:(UITabBarItem*)item
{
    [NUITabBarItemRenderer render:item withClass:@"TabBarItem"];
    [self registerObject:item];
}

+ (void)renderTabBarItem:(UITabBarItem*)item withClass:(NSString*)className
{
    [NUITabBarItemRenderer render:item withClass:className];
    [self registerObject:item];
}



+ (void)renderTableViewCell:(UITableViewCell*)cell
{
    [NUITableViewCellRenderer render:cell withClass:@"TableCell"];
    [self registerObject:cell];
}

+ (void)renderTableViewCell:(UITableViewCell*)cell withClass:(NSString*)className
{
    [NUITableViewCellRenderer render:cell withClass:className];
    [self registerObject:cell];
}


+ (void)renderToolbar:(UIToolbar*)bar
{
    [NUIToolbarRenderer render:bar withClass:@"Toolbar"];
    [self registerObject:bar];
}

+ (void)renderToolbar:(UIToolbar*)bar withClass:(NSString*)className
{
    [NUIToolbarRenderer render:bar withClass:className];
    [self registerObject:bar];
}


+ (void)renderTextField:(UITextField*)textField
{
    [NUITextFieldRenderer render:textField withClass:@"TextField"];
    [self registerObject:textField];
}

+ (void)renderTextField:(UITextField*)textField withClass:(NSString*)className
{
    [NUITextFieldRenderer render:textField withClass:className];
    [self registerObject:textField];
}



+ (void)renderView:(UIView*)view
{
    [NUIViewRenderer render:view withClass:@"View"];
    [self registerObject:view];
}

+ (void)renderView:(UIView*)view withClass:(NSString*)className
{
    [NUIViewRenderer render:view withClass:className];
    [self registerObject:view];
}



+ (void)renderWindow:(UIWindow*)window
{
    [NUIWindowRenderer render:window withClass:@"Window"];
    [self registerObject:window];
}

+ (void)renderWindow:(UIWindow*)window withClass:(NSString*)className
{
    [NUIWindowRenderer render:window withClass:className];
    [self registerObject:window];
}



+ (void)sizeDidChangeForNavigationBar:(UINavigationBar*)bar
{
    [NUINavigationBarRenderer sizeDidChange:bar];
}

+ (void)sizeDidChangeForTabBar:(UITabBar*)bar
{
    [NUITabBarRenderer sizeDidChange:bar];
}

+ (void)sizeDidChangeForTableViewCell:(UITableViewCell*)cell
{
    [NUITableViewCellRenderer sizeDidChange:cell];
}


+ (void)addOrientationDidChangeObserver:(id)observer
{
    [[NSNotificationCenter defaultCenter] addObserver:observer selector:@selector(orientationDidChange:) name:UIDeviceOrientationDidChangeNotification object:nil];
}

+ (void)registerObject:(NSObject*)object
{
    if ([NUISettings autoUpdateIsEnabled] && object != nil) {
        NSString *hash = [NSString stringWithFormat:@"%d", object.hash];
        NUIRenderer *instance = [self getInstance];
        if (![instance.renderedObjectIdentifiers containsObject:hash]) {
            [instance.renderedObjectIdentifiers addObject:hash];
            [instance.renderedObjects addObject:object];
        }
    }
}

// Given a UIKit element, render it using the appropriate NUIRenderer method
+ (void)render:(UIView*)object
{
    // Classes like UIView and UIButton that have subclasses within UIKit should be
    // given lower priority.
    NSDictionary *renderedClasses = [[NSDictionary alloc] initWithObjectsAndKeys:
                                   [UIBarButtonItem class], @"renderBarButtonItem",
                                   [UINavigationBar class], @"renderNavigationBar",
                                   [UINavigationItem class], @"renderNavigationItem",
                                   [UIProgressView class], @"renderProgressView",
                                   [UISegmentedControl class], @"renderSegmentedControl",
                                   [UISlider class], @"renderSlider",
                                   [UISwitch class], @"renderSwitch",
                                   [UITabBar class], @"renderTabBar",
                                   [UITabBarItem class], @"renderTabBarItem",
                                   [UITableViewCell class], @"renderTableViewCell",
                                   [UIToolbar class], @"renderToolbar",
                                   [UITextField class], @"renderTextField",
                                   [UIButton class], @"renderButton",
                                   [UILabel class], @"renderLabel",
                                   [UIView class], @"renderView",
                                   nil];
    for (NSString *renderMethod in renderedClasses) {
        Class renderClass = [renderedClasses valueForKey:renderMethod];
        if ([object isKindOfClass:renderClass]) {
            SEL selector = NSSelectorFromString([NSString stringWithFormat:@"%@:withClass:", renderMethod]);
            [NUIRenderer performSelector:selector
                              withObject:object
                              withObject:object.nuiClass
            ];
            break;
        }
    }
}

+ (void)rerender
{
    [NUISettings loadStylesheetByPath:[NUISettings autoUpdatePath]];
    NUIRenderer *instance = [self getInstance];
    for (int i = 0; i < [instance.renderedObjects count]; i++) {
        UIView *object = [instance.renderedObjects objectAtIndex:i];
        [NUIRenderer render:object];
    }
    [CATransaction flush];
}


+ (NUIRenderer*)getInstance
{
    @synchronized(self) {
        if(instance == nil) {
            instance = [NUIRenderer new];
            if ([NUISettings autoUpdateIsEnabled]) {
                [NUIFileMonitor watch:[NUISettings autoUpdatePath] withCallback:^(){
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [NUIRenderer rerender];
                    });
                }];
                instance.renderedObjects = [[NSMutableArray alloc] init];
                instance.renderedObjectIdentifiers = [[NSMutableArray alloc] init];
            }
        }
    }
    
    return instance;
}

@end
