
#import "PlaygroundNSViewController.h"

@interface PlaygroundNSViewController () <CAAnimationDelegate> {
    BOOL _animating;
    NSInteger _currentCurve, _currentEasing;
    AHEasingFunction _currentFunction;
}
@end

@implementation PlaygroundNSViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])
	{
		_currentFunction = LinearInterpolation;
    }
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    if (self = [super initWithCoder:coder])
    {
        _currentFunction = LinearInterpolation;
    }

    return self;
}

- (void)loadView
{
	[super loadView];

	[self.view setWantsLayer:YES];

	CALayer *viewLayer = [CALayer layer];
	CGColorRef black = CGColorGetConstantColor(kCGColorBlack);
	[viewLayer setBackgroundColor:black];
	[self.boid setWantsLayer:YES];
	[self.boid setLayer:viewLayer];
}

- (void)mouseUp:(NSEvent *)theEvent
{
	if(!_animating)
	{
		NSPoint point = [self.graphView convertPoint:[theEvent locationInWindow] fromView:nil];
        CGSize size = self.boid.bounds.size;

		CGPoint targetOrigin = CGPointMake(point.x - size.width * 0.5, point.y - size.height * 0.5);

		CALayer *layer = [self.boid layer];
		[CATransaction begin];
        [CATransaction setAnimationDuration:0.75];

		CAAnimation *chase = [CAKeyframeAnimation animationWithKeyPath:@"position"
															  function:_currentFunction
															 fromPoint:self.boid.frame.origin
															   toPoint:targetOrigin];
		[chase setDelegate:self];
		[layer addAnimation:chase forKey:@"position"];

		[CATransaction commit];

		[self.boid setFrameOrigin:targetOrigin];

		_animating = YES;

		[self.graphView setNeedsDisplay:YES];
	}
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
	_animating = NO;
}

- (void)configureEasingFunction
{
	switch(_currentCurve)
	{
		case CurveTypeLinear:
			_currentFunction = LinearInterpolation;
			break;
		case CurveTypeQuadratic:
			_currentFunction = (_currentEasing == EaseIn) ? QuadraticEaseIn : (_currentEasing == EaseOut) ? QuadraticEaseOut : QuadraticEaseInOut;
			break;
		case CurveTypeCubic:
			_currentFunction = (_currentEasing == EaseIn) ? CubicEaseIn : (_currentEasing == EaseOut) ? CubicEaseOut : CubicEaseInOut;
			break;
		case CurveTypeQuartic:
			_currentFunction = (_currentEasing == EaseIn) ? QuarticEaseIn : (_currentEasing == EaseOut) ? QuarticEaseOut : QuarticEaseInOut;
			break;
		case CurveTypeQuintic:
			_currentFunction = (_currentEasing == EaseIn) ? QuinticEaseIn : (_currentEasing == EaseOut) ? QuinticEaseOut : QuinticEaseInOut;
			break;
		case CurveTypeSine:
			_currentFunction = (_currentEasing == EaseIn) ? SineEaseIn : (_currentEasing == EaseOut) ? SineEaseOut : SineEaseInOut;
			break;
		case CurveTypeCircular:
			_currentFunction = (_currentEasing == EaseIn) ? CircularEaseIn : (_currentEasing == EaseOut) ? CircularEaseOut : CircularEaseInOut;
			break;
		case CurveTypeExpo:
			_currentFunction = (_currentEasing == EaseIn) ? ExponentialEaseIn : (_currentEasing == EaseOut) ? ExponentialEaseOut : ExponentialEaseInOut;
			break;
		case CurveTypeElastic:
			_currentFunction = (_currentEasing == EaseIn) ? ElasticEaseIn : (_currentEasing == EaseOut) ? ElasticEaseOut : ElasticEaseInOut;
			break;
		case CurveTypeBack:
			_currentFunction = (_currentEasing == EaseIn) ? BackEaseIn : (_currentEasing == EaseOut) ? BackEaseOut : BackEaseInOut;
			break;
		case CurveTypeBounce:
			_currentFunction = (_currentEasing == EaseIn) ? BounceEaseIn : (_currentEasing == EaseOut) ? BounceEaseOut : BounceEaseInOut;
			break;
	}

    [self.graphView setEasingFunction:_currentFunction];
	[self.graphView setNeedsDisplay:YES];
}

- (IBAction)curveSelectionChanged:(id)sender
{
	_currentCurve = [sender selectedSegment];

	[self configureEasingFunction];
}

- (IBAction)easingSelectionChanged:(id)sender
{
	_currentEasing = [sender selectedSegment];

	[self configureEasingFunction];
}


@end
