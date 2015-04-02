//
//  UIImage+ColorFromImage.h
//
//  Created by Paul Williamson on 30/05/2014.
//  Copyright (c) 2014 Paul Williamson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ColorFromImage)

/** Creates a 1x1 context, draws the image then returns a UIColor from the remaining pixel
 
 @return The colour of the drawn pixel
 */
- (UIColor *)sqf_colorFromImage;

@end
