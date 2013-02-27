//
//  PlaygroundNSViewController.m
//  AHEasing
//
//  Created by Warren Moore on 1/15/13.
//  Copyright (c) 2013 Auerhaus Development, LLC. All rights reserved.
//

#import "PlaygroundNSViewController.h"

@implementation PlaygroundNSViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]))
	{
		currentFunction = LinearInterpolation;
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
	if(!animating)
	{
		NSPoint point = [self.graphView convertPoint:[theEvent locationInWindow] fromView:nil];

		CGPoint targetOrigin = NSPointToCGPoint(point);

		CALayer *layer = [self.boid layer];
		[CATransaction begin];
		[CATransaction setValue:[NSNumber numberWithFloat:0.750f] forKey:kCATransactionAnimationDuration];

		CAAnimation *chase = [CAKeyframeAnimation animationWithKeyPath:@"position"
															  function:currentFunction
															 fromPoint:self.boid.frame.origin
															   toPoint:targetOrigin];
		[chase setDelegate:self];
		[layer addAnimation:chase forKey:@"position"];

		[CATransaction commit];

		[self.boid setFrameOrigin:targetOrigin];

		animating = YES;

		[self.graphView setNeedsDisplay:YES];
	}
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
	animating = NO;
}

- (void)configureEasingFunction
{
	switch(currentCurve)
	{
		case CurveTypeLinear:
			currentFunction = LinearInterpolation;
			break;
		case CurveTypeQuadratic:
			currentFunction = (currentEasing == EaseIn) ? QuadraticEaseIn : (currentEasing == EaseOut) ? QuadraticEaseOut : QuadraticEaseInOut;
			break;
		case CurveTypeCubic:
			currentFunction = (currentEasing == EaseIn) ? CubicEaseIn : (currentEasing == EaseOut) ? CubicEaseOut : CubicEaseInOut;
			break;
		case CurveTypeQuartic:
			currentFunction = (currentEasing == EaseIn) ? QuarticEaseIn : (currentEasing == EaseOut) ? QuarticEaseOut : QuarticEaseInOut;
			break;
		case CurveTypeQuintic:
			currentFunction = (currentEasing == EaseIn) ? QuinticEaseIn : (currentEasing == EaseOut) ? QuinticEaseOut : QuinticEaseInOut;
			break;
		case CurveTypeSine:
			currentFunction = (currentEasing == EaseIn) ? SineEaseIn : (currentEasing == EaseOut) ? SineEaseOut : SineEaseInOut;
			break;
		case CurveTypeCircular:
			currentFunction = (currentEasing == EaseIn) ? CircularEaseIn : (currentEasing == EaseOut) ? CircularEaseOut : CircularEaseInOut;
			break;
		case CurveTypeExpo:
			currentFunction = (currentEasing == EaseIn) ? ExponentialEaseIn : (currentEasing == EaseOut) ? ExponentialEaseOut : ExponentialEaseInOut;
			break;
		case CurveTypeElastic:
			currentFunction = (currentEasing == EaseIn) ? ElasticEaseIn : (currentEasing == EaseOut) ? ElasticEaseOut : ElasticEaseInOut;
			break;
		case CurveTypeBack:
			currentFunction = (currentEasing == EaseIn) ? BackEaseIn : (currentEasing == EaseOut) ? BackEaseOut : BackEaseInOut;
			break;
		case CurveTypeBounce:
			currentFunction = (currentEasing == EaseIn) ? BounceEaseIn : (currentEasing == EaseOut) ? BounceEaseOut : BounceEaseInOut;
			break;
	}

	[self.graphView setEasingFunction:currentFunction];
	[self.graphView setNeedsDisplay:YES];
}

- (IBAction)curveSelectionChanged:(id)sender
{
	currentCurve = [sender selectedSegment];

	[self configureEasingFunction];
}

- (IBAction)easingSelectionChanged:(id)sender
{
	currentEasing = [sender selectedSegment];

	[self configureEasingFunction];
}


@end
