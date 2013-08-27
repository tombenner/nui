#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import "NUIGraphics.h"
#import "NUISettings.h"

@interface NUITextViewRenderer : NSObject

+ (void)render:(UITextView*)textView withClass:(NSString*)className;

@end
