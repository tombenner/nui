//
//  UITableView+NUI.m
//  Pods
//
//  Created by Tobias Heinicke on 19.06.13.
//
//

#import "UITableView+NUI.h"

@implementation UITableView (NUI)

- (void)initNUI
{
    if (!self.nuiClass) {
        self.nuiClass = @"Table";
    }
}

- (void)applyNUI
{
    [self initNUI];
    if (![self.nuiClass isEqualToString:@"none"]) {
        [NUIRenderer renderTableView:self withClass:self.nuiClass];
        [NUIRenderer addOrientationDidChangeObserver:self];
    }
    self.nuiIsApplied = [NSNumber numberWithBool:YES];
}

- (void)orientationDidChange:(NSNotification*)notification
{
    [NUIRenderer performSelector:@selector(sizeDidChangeForTableView:) withObject:self afterDelay:0];
}

@end