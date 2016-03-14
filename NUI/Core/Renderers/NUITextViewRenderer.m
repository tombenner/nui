#import "NUITextViewRenderer.h"
#import "NUITextInputTraitsRenderer.h"
@implementation NUITextViewRenderer

+ (void)render:(UITextView*)textView withClass:(NSString*)className
{
    NSString *property;
    
    [super render:textView withClass: className];

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
    
    if([textView conformsToProtocol:@protocol(UITextInputTraits)]) {
        [NUITextInputTraitsRenderer renderKeyboard:(id<UITextInputTraits>)textView withClass:className];
    }

}

@end
