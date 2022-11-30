
#import <QuartzCore/QuartzCore.h>
#import "CAKeyframeAnimation+AHEasing.h"
#import "EasingFunctionGraphView.h"
#import "EasingDeclarations.h"

@interface PlaygroundViewController : UIViewController 

@property(nonatomic, strong) IBOutlet UIView *boid;
@property(nonatomic, strong) IBOutlet EasingFunctionGraphView *graphView;
@property(nonatomic, strong) IBOutlet UISegmentedControl *curveSegmentedControl;
@property(nonatomic, strong) IBOutlet UISegmentedControl *easingSegmentedControl;

- (IBAction)curveSelectionChanged:(id)sender;
- (IBAction)easingSelectionChanged:(id)sender;

@end
