//
//  NUIRenderer.h
//  NUIDemo
//
//  Created by Tom Benner on 11/24/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NUIBarButtonItemRenderer.h"
#import "NUIButtonRenderer.h"
#import "NUILabelRenderer.h"
#import "NUINavigationBarRenderer.h"
#import "NUINavigationItemRenderer.h"
#import "NUISegmentedControlRenderer.h"
#import "NUITabBarRenderer.h"
#import "NUITabBarItemRenderer.h"
#import "NUITableViewCellRenderer.h"
#import "NUITextFieldRenderer.h"
#import "NUIViewRenderer.h"

@interface NUIRenderer : NSObject

+ (void)renderBarButtonItem:(UIBarButtonItem*)item;
+ (void)renderBarButtonItem:(UIBarButtonItem*)item withClass:(NSString*)class_name;

+ (void)renderButton:(UIButton*)button;
+ (void)renderButton:(UIButton*)button withClass:(NSString*)class_name;

+ (void)renderLabel:(UILabel*)label;
+ (void)renderLabel:(UILabel*)label withClass:(NSString*)class_name;
+ (void)renderLabel:(UILabel*)label withClass:(NSString*)class_name withSuffix:(NSString*)suffix;

+ (void)renderNavigationBar:(UINavigationBar*)bar;
+ (void)renderNavigationBar:(UINavigationBar*)bar withClass:(NSString*)class_name;

+ (void)renderNavigationItem:(UINavigationItem*)item;
+ (void)renderNavigationItem:(UINavigationItem*)item withClass:(NSString*)class_name;

+ (void)renderSegmentedControl:(UISegmentedControl*)control;
+ (void)renderSegmentedControl:(UISegmentedControl*)control withClass:(NSString*)class_name;

+ (void)renderTabBar:(UITabBar*)bar;
+ (void)renderTabBar:(UITabBar*)bar withClass:(NSString*)class_name;

+ (void)renderTabBarItem:(UITabBarItem*)bar;
+ (void)renderTabBarItem:(UITabBarItem*)bar withClass:(NSString*)class_name;

+ (void)renderTableViewCell:(UITableViewCell*)cell;
+ (void)renderTableViewCell:(UITableViewCell*)cell withClass:(NSString*)class_name;

+ (void)renderTextField:(UITextField*)text_field;
+ (void)renderTextField:(UITextField*)text_field withClass:(NSString*)class_name;

+ (void)renderView:(UIView*)view;
+ (void)renderView:(UIView*)view withClass:(NSString*)class_name;

@end
