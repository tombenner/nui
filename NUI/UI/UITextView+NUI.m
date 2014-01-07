#import "UITextView+NUI.h"

@implementation UITextView (NUI)

- (void)initNUI
{
    if (!self.nuiClass) {
        self.nuiClass = @"TextView";
    }
}

- (void)applyNUI
{
    if ([self isMemberOfClass:[UITextView class]] || self.nuiClass) {
        [self initNUI];
        if (![self.nuiClass isEqualToString:kNUIClassNone]) {
            [NUIRenderer renderTextView:self withClass:self.nuiClass];
        }
    }
    self.nuiApplied = YES;
}

- (void)override_didMoveToWindow
{
    if (!self.isNUIApplied) {
        [self applyNUI];
    }
    [self override_didMoveToWindow];
}

@end
