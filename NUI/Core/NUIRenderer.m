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

static NUIRenderer *gInstance = nil;

+ (void)renderBarButtonItem:(UIBarButtonItem*)item
{
    [NUIBarButtonItemRenderer render:item withClass:@"BarButton"];
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

+ (void)renderControl:(UIControl*)control
{
    [NUIControlRenderer render:control withClass:@"Control"];
}

+ (void)renderControl:(UIControl*)control withClass:(NSString*)className
{
    [NUIControlRenderer render:control withClass:className];
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

+ (void)renderProgressView:(UIProgressView*)progressView
{
    [NUIProgressViewRenderer render:progressView];
}

+ (void)renderProgressView:(UIProgressView*)progressView withClass:(NSString*)className
{
    [NUIProgressViewRenderer render:progressView withClass:className];
}

+ (void)renderNavigationItem:(UINavigationItem *)item
{
    [NUINavigationItemRenderer render:item withClass:@"NavigationBar"];
}

+ (void)renderNavigationItem:(UINavigationItem*)item withClass:(NSString*)className
{
    [NUINavigationItemRenderer render:item withClass:className];
}

+ (void)renderSearchBar:(UISearchBar*)bar
{
    [NUISearchBarRenderer render:bar withClass:@"SearchBar"];
}

+ (void)renderSearchBar:(UISearchBar*)bar withClass:(NSString*)className
{
    [NUISearchBarRenderer render:bar withClass:className];
}

+ (void)renderSegmentedControl:(UISegmentedControl*)control
{
    [NUISegmentedControlRenderer render:control withClass:@"SegmentedControl"];
}

+ (void)renderSegmentedControl:(UISegmentedControl*)control withClass:(NSString*)className
{
    [NUISegmentedControlRenderer render:control withClass:className];
}

+ (void)renderSlider:(UISlider*)slider
{
    [NUISliderRenderer render:slider withClass:@"Slider"];
}

+ (void)renderSlider:(UISlider*)slider withClass:(NSString*)className
{
    [NUISliderRenderer render:slider withClass:className];
}

+ (void)renderSwitch:(UISwitch*)uiSwitch
{
    [NUISwitchRenderer render:uiSwitch withClass:@"Switch"];
}

+ (void)renderSwitch:(UISwitch*)uiSwitch withClass:(NSString*)className
{
    [NUISwitchRenderer render:uiSwitch withClass:className];
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
    [NUITabBarItemRenderer render:item withClass:@"TabBarItem"];
}

+ (void)renderTabBarItem:(UITabBarItem*)item withClass:(NSString*)className
{
    [NUITabBarItemRenderer render:item withClass:className];
}

+ (void)renderTableView:(UITableView*)tableView
{
    [NUITableViewRenderer render:tableView withClass:@"Table"];
}

+ (void)renderTableView:(UITableView*)tableView withClass:(NSString*)className
{
    [NUITableViewRenderer render:tableView withClass:className];
}

+ (void)renderTableViewCell:(UITableViewCell*)cell
{
    [NUITableViewCellRenderer render:cell withClass:@"TableCell"];
}

+ (void)renderTableViewCell:(UITableViewCell*)cell withClass:(NSString*)className
{
    [NUITableViewCellRenderer render:cell withClass:className];
}

+ (void)renderToolbar:(UIToolbar*)bar
{
    [NUIToolbarRenderer render:bar withClass:@"Toolbar"];
}

+ (void)renderToolbar:(UIToolbar*)bar withClass:(NSString*)className
{
    [NUIToolbarRenderer render:bar withClass:className];
}

+ (void)renderTextField:(UITextField*)textField
{
    [NUITextFieldRenderer render:textField withClass:@"TextField"];
}

+ (void)renderTextField:(UITextField*)textField withClass:(NSString*)className
{
    [NUITextFieldRenderer render:textField withClass:className];
}

+ (void)renderTextView:(UITextView *)textView
{
    [NUITextViewRenderer render:textView withClass:@"TextView"];
}

+ (void)renderTextView:(UITextView *)textView withClass:(NSString *)className
{
    [NUITextViewRenderer render:textView withClass:className];
}

+ (void)renderView:(UIView*)view
{
    [NUIViewRenderer render:view withClass:@"View"];
}

+ (void)renderView:(UIView*)view withClass:(NSString*)className
{
    [NUIViewRenderer render:view withClass:className];
}

+ (void)renderWindow:(UIWindow*)window
{
    [NUIWindowRenderer render:window withClass:@"Window"];
}

+ (void)renderWindow:(UIWindow*)window withClass:(NSString*)className
{
    [NUIWindowRenderer render:window withClass:className];
}

+ (BOOL)needsTextTransformWithClass:(NSString*)className
{
    return [NUILabelRenderer needsTextTransformWithClass:className];
}

+ (NSString *)transformText:(NSString*)text withClass:(NSString*)className
{
    return [NUILabelRenderer transformText:text withClass:className];
}

+ (NSAttributedString *)transformAttributedText:(NSAttributedString*)text withClass:(NSString*)className
{
    return [NUILabelRenderer transformAttributedText:text withClass:className];
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

+ (void)sizeDidChangeForTableView:(UITableView*)tableView
{
    [NUITableViewRenderer sizeDidChange:tableView];
}

+ (void)addOrientationDidChangeObserver:(id)observer
{
    [[NSNotificationCenter defaultCenter] addObserver:observer selector:@selector(orientationDidChange:) name:UIApplicationDidChangeStatusBarOrientationNotification object:nil];
}

+ (void)removeOrientationDidChangeObserver:(id)observer {
    [[NSNotificationCenter defaultCenter] removeObserver:observer name:UIApplicationDidChangeStatusBarOrientationNotification object:nil];
}

+ (void)rerender
{
    for (UIWindow *window in [[UIApplication sharedApplication] windows]) {
        UIView *rootView = [[window rootViewController] view];
        [self rerenderView:rootView];
    }
}

+ (void)rerenderView:(UIView *)view
{
    for (UIView *subview in view.subviews) {
        [self rerenderView:subview];
    }

    if ([view respondsToSelector:@selector(applyNUI)]){
        [view applyNUI];
    }
    
    if ([view respondsToSelector:@selector(inputAccessoryView)]){
        if ([view isFirstResponder]) {
            UIView *inputAccessoryView = [view inputAccessoryView];
            
            if (inputAccessoryView)
                [self rerenderView:inputAccessoryView];
        }
    }
}

+ (void)setRerenderOnOrientationChange:(BOOL)rerender
{
    NUIRenderer *instance = [self getInstance];

    if (instance.rerenderOnOrientationChange != rerender) {
        instance.rerenderOnOrientationChange = rerender;

        if (rerender) {
            [self addOrientationDidChangeObserver:self];
        } else {
            [self removeOrientationDidChangeObserver:self];
        }
    }
}

+ (NUIRenderer*)getInstance
{
    @synchronized(self) {
        if (gInstance == nil) {
            gInstance = [NUIRenderer new];
            if ([NUISettings autoUpdateIsEnabled]) {
                [NUIFileMonitor watch:[NUISettings autoUpdatePath] withCallback:^(){
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [self stylesheetFileChanged];
                    });
                }];
            }
        }
    }
    return gInstance;
}

+ (void)orientationDidChange:(NSNotification *)notification
{
    UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];

    BOOL didReload = [NUISettings reloadStylesheetsOnOrientationChange:orientation];

    if (didReload)
        [NUIRenderer rerender];
}

+ (void)stylesheetFileChanged
{
    [NUISettings loadStylesheetByPath:[NUISettings autoUpdatePath]];
    [NUIRenderer rerender];
    [CATransaction flush];
}

@end
