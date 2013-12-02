//
//  NUITableViewRenderer.h
//  Pods
//
//  Created by Tobias Heinicke on 19.06.13.
//
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import "NUIGraphics.h"
#import "NUIRenderer.h"
#import "NUISettings.h"

@interface NUITableViewRenderer : NSObject

+ (void)render:(UITableView*)tableView withClass:(NSString*)className;
+ (void)sizeDidChange:(UITableView*)tableView;

@end

