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

+ (void)renderBarButtonItem:(UIBarButtonItem*)item withClass:(NSString*)class_name
{
    [NUIBarButtonItemRenderer render:item withClass:class_name];
}



+ (void)renderButton:(UIButton*)button
{
    [NUIButtonRenderer render:button withClass:@"Button"];
}

+ (void)renderButton:(UIButton*)button withClass:(NSString*)class_name
{
    [NUIButtonRenderer render:button withClass:class_name];
}



+ (void)renderLabel:(UILabel*)label
{
    [NUILabelRenderer render:label withClass:@"Label"];
}

+ (void)renderLabel:(UILabel*)label withClass:(NSString*)class_name
{
    [NUILabelRenderer render:label withClass:class_name];
}

+ (void)renderLabel:(UILabel*)label withClass:(NSString*)class_name withSuffix:(NSString*)suffix
{
    [NUILabelRenderer render:label withClass:class_name withSuffix:suffix];
}



+ (void)renderNavigationBar:(UINavigationBar*)bar
{
    [NUINavigationBarRenderer render:bar withClass:@"NavigationBar"];
}

+ (void)renderNavigationBar:(UINavigationBar*)bar withClass:(NSString*)class_name
{
    [NUINavigationBarRenderer render:bar withClass:class_name];
}



+ (void)renderNavigationItem:(UINavigationItem *)item
{
    [NUINavigationItemRenderer render:item withClass:@"NavigationBar"];
}

+ (void)renderNavigationItem:(UINavigationItem*)item withClass:(NSString*)class_name
{
    [NUINavigationItemRenderer render:item withClass:class_name];
}



+ (void)renderSegmentedControl:(UISegmentedControl*)control
{
    [NUISegmentedControlRenderer render:control withClass:@"SegmentedControl"];
}

+ (void)renderSegmentedControl:(UISegmentedControl*)control withClass:(NSString*)class_name
{
    [NUISegmentedControlRenderer render:control withClass:class_name];
}



+ (void)renderTabBar:(UITabBar*)bar
{
    [NUITabBarRenderer render:bar withClass:@"TabBar"];
}

+ (void)renderTabBar:(UITabBar*)bar withClass:(NSString*)class_name
{
    [NUITabBarRenderer render:bar withClass:class_name];
}



+ (void)renderTabBarItem:(UITabBarItem*)item
{
    [NUITabBarItemRenderer render:item withClass:@"TabBar"];
}

+ (void)renderTabBarItem:(UITabBarItem*)item withClass:(NSString*)class_name
{
    [NUITabBarItemRenderer render:item withClass:class_name];
}



+ (void)renderTableViewCell:(UITableViewCell*)cell
{
    [NUITableViewCellRenderer render:cell withClass:@"TableCell"];
}

+ (void)renderTableViewCell:(UITableViewCell*)cell withClass:(NSString*)class_name
{
    [NUITableViewCellRenderer render:cell withClass:class_name];
}



+ (void)renderTextField:(UITextField*)text_field
{
    [NUITextFieldRenderer render:text_field withClass:@"TextField"];
}

+ (void)renderTextField:(UITextField*)text_field withClass:(NSString*)class_name
{
    [NUITextFieldRenderer render:text_field withClass:class_name];
}



+ (void)renderView:(UIView*)view
{
    [NUIViewRenderer render:view withClass:@"View"];
}

+ (void)renderView:(UIView*)view withClass:(NSString*)class_name
{
    [NUIViewRenderer render:view withClass:class_name];
}

@end
