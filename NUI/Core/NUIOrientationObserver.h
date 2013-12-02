//
//  NUIOrientationObserver.h
//  NUI
//
//  Created by Matthew Garden on 11/27/2013.
//  Copyright (c) 2013 Tom Benner. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NUIOrientationObserver <NSObject>

- (void)orientationDidChange:(NSNotification*)notification;

@end
