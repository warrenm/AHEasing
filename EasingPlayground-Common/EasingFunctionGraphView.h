
#import "easing.h"

#if TARGET_OS_IPHONE

@interface EasingFunctionGraphView : UIView
@property(nonatomic, strong) IBOutlet UIViewController *viewController; // Unused

#else

@interface EasingFunctionGraphView : NSView
@property(nonatomic, strong) IBOutlet NSViewController *viewController;

#endif

@property(nonatomic, assign) CGRect gridBounds;
@property(nonatomic, assign) AHEasingFunction easingFunction;

@end
