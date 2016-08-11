//
//  NUIImageViewRenderer.h
//  Pods
//
//  Created by Gomez, Antonio on 06/07/2016.
//
//

#import <Foundation/Foundation.h>
#import "NUIViewRenderer.h"

@interface NUIImageViewRenderer : NUIViewRenderer

+ (void)render:(UIImageView*)imageView withClass:(NSString*)className;

@end
