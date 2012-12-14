//
//  NUIRenderer.m
//  NUIDemo
//
//  Created by Tom Benner on 11/24/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import "NUIRenderer.h"

@implementation NUIRenderer

+ (void)renderBarButtonItem:(UIBarButtonItem*)item
{
    [NUIBarButtonItemRenderer render:item withClass:@"Button"];
}

+ (void)renderBarButtonItem:(UIBarButtonItem*)item withClass:(NSString*)className
{
    [NUIBarButtonItemRenderer render:item withClass:className];
}



+ (void)renderButton:(UIButton*)button
{
    [NUIButtonRenderer render:button withClass:@"Button"];
}

+ (void)renderButton:(UIButton*)button withClass:(NSString*)className
{
    [NUIButtonRenderer render:button withClass:className];
}



+ (void)renderLabel:(UILabel*)label
{
    [NUILabelRenderer render:label withClass:@"Label"];
}

+ (void)renderLabel:(UILabel*)label withClass:(NSString*)className
{
    [NUILabelRenderer render:label withClass:className];
}

+ (void)renderLabel:(UILabel*)label withClass:(NSString*)className withSuffix:(NSString*)suffix
{
    [NUILabelRenderer render:label withClass:className withSuffix:suffix];
}



+ (void)renderNavigationBar:(UINavigationBar*)bar
{
    [NUINavigationBarRenderer render:bar withClass:@"NavigationBar"];
}

+ (void)renderNavigationBar:(UINavigationBar*)bar withClass:(NSString*)className
{
    [NUINavigationBarRenderer render:bar withClass:className];
}



+ (void)renderNavigationItem:(UINavigationItem *)item
{
    [NUINavigationItemRenderer render:item withClass:@"NavigationBar"];
}

+ (void)renderNavigationItem:(UINavigationItem*)item withClass:(NSString*)className
{
    [NUINavigationItemRenderer render:item withClass:className];
}



+ (void)renderSegmentedControl:(UISegmentedControl*)control
{
    [NUISegmentedControlRenderer render:control withClass:@"SegmentedControl"];
}

+ (void)renderSegmentedControl:(UISegmentedControl*)control withClass:(NSString*)className
{
    [NUISegmentedControlRenderer render:control withClass:className];
}



+ (void)renderTabBar:(UITabBar*)bar
{
    [NUITabBarRenderer render:bar withClass:@"TabBar"];
}

+ (void)renderTabBar:(UITabBar*)bar withClass:(NSString*)className
{
    [NUITabBarRenderer render:bar withClass:className];
}



+ (void)renderTabBarItem:(UITabBarItem*)item
{
    [NUITabBarItemRenderer render:item withClass:@"TabBar"];
}

+ (void)renderTabBarItem:(UITabBarItem*)item withClass:(NSString*)className
{
    [NUITabBarItemRenderer render:item withClass:className];
}



+ (void)renderTableViewCell:(UITableViewCell*)cell
{
    [NUITableViewCellRenderer render:cell withClass:@"TableCell"];
}

+ (void)renderTableViewCell:(UITableViewCell*)cell withClass:(NSString*)className
{
    [NUITableViewCellRenderer render:cell withClass:className];
}



+ (void)renderTextField:(UITextField*)textField
{
    [NUITextFieldRenderer render:textField withClass:@"TextField"];
}

+ (void)renderTextField:(UITextField*)textField withClass:(NSString*)className
{
    [NUITextFieldRenderer render:textField withClass:className];
}



+ (void)renderView:(UIView*)view
{
    [NUIViewRenderer render:view withClass:@"View"];
}

+ (void)renderView:(UIView*)view withClass:(NSString*)className
{
    [NUIViewRenderer render:view withClass:className];
}

@end
