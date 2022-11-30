
#import <Cocoa/Cocoa.h>
#import "CAKeyframeAnimation+AHEasing.h"
#import "EasingFunctionGraphView.h"
#import "EasingDeclarations.h"

@interface PlaygroundNSViewController : NSViewController

@property(nonatomic, strong) IBOutlet NSView *boid;
@property(nonatomic, strong) IBOutlet EasingFunctionGraphView *graphView;

- (IBAction)curveSelectionChanged:(id)sender;
- (IBAction)easingSelectionChanged:(id)sender;

@end
