#import "NUITextViewRenderer.h"

@implementation NUITextViewRenderer

+ (void)render:(UITextView*)textView withClass:(NSString*)className
{
    NSString *property;
    
    // Set tint
    property = @"tint-color";
    if ([NUISettings hasProperty:property withClass:className]) {
        textView.tintColor = [NUISettings getColor:property withClass:className];
    }
    
    property = @"font-color";
    if ([NUISettings hasProperty:property withClass:className]) {
        textView.textColor = [NUISettings getColor:property withClass:className];
    }

    if ([NUISettings hasFontPropertiesWithClass:className]) {
        textView.font = [NUISettings getFontWithClass:className baseFont:textView.font];
    }

    property = @"padding";
    if ([NUISettings hasProperty:property withClass:className]) {
        [textView setContentInset:[NUISettings getEdgeInsets:@"padding" withClass:className]];
    }
}

@end
