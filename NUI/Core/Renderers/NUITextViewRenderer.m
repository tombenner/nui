#import "NUITextViewRenderer.h"

@implementation NUITextViewRenderer

+ (void)render:(UITextView*)textView withClass:(NSString*)className
{
    NSString *property;
    
    property = @"font-color";
    if ([NUISettings hasProperty:property withClass:className]) {
        textView.textColor = [NUISettings getColor:property withClass:className];
    }
    
    property = @"font-size";
    if ([NUISettings hasProperty:property withClass:className]) {
        textView.font = [textView.font fontWithSize:[NUISettings getFloat:property withClass:className]];
    }
    
    property = @"font-name";
    if ([NUISettings hasProperty:property withClass:className]) {
        textView.font = [UIFont fontWithName:[NUISettings get:property withClass:className] size:textView.font.pointSize];
    }
    
}

@end
