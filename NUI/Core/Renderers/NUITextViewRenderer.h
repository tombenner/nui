#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import "NUIGraphics.h"
#import "NUISettings.h"
#import "NUIViewRenderer.h"

@interface NUITextViewRenderer : NUIViewRenderer

+ (void)render:(UITextView*)textView withClass:(NSString*)className;

@end
