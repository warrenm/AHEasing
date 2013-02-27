//
//  PlaygroundViewController.m
//
//  Copyright (c) 2011, Auerhaus Development, LLC
//
//  This program is free software. It comes without any warranty, to
//  the extent permitted by applicable law. You can redistribute it
//  and/or modify it under the terms of the Do What The Fuck You Want
//  To Public License, Version 2, as published by Sam Hocevar. See
//  http://sam.zoy.org/wtfpl/COPYING for more details.
//

#import "PlaygroundViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "CAKeyframeAnimation+AHEasing.h"

@implementation PlaygroundViewController

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	currentFunction = LinearInterpolation;
	
	UIGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewWasTapped:)];
	[self.graphView addGestureRecognizer:tapRecognizer];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return UIInterfaceOrientationIsLandscape(interfaceOrientation);
}

#pragma mark - Actions

- (void)viewWasTapped:(UIGestureRecognizer *)recognizer
{
	if([recognizer state] == UIGestureRecognizerStateEnded && !animating)
	{
		CGPoint targetCenter = [recognizer locationInView:self.view];
		
		CALayer *layer= [self.boid layer];
		[CATransaction begin];
		[CATransaction setValue:[NSNumber numberWithFloat:0.750] forKey:kCATransactionAnimationDuration];
		
		CAAnimation *chase = [CAKeyframeAnimation animationWithKeyPath:@"position" 
															 function:currentFunction 
															fromPoint:[self.boid center]
															  toPoint:targetCenter];
		[chase setDelegate:self];
		[layer addAnimation:chase forKey:@"position"];
		
		[CATransaction commit];
		
		[self.boid setCenter:targetCenter];
		
		animating = YES;
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
	[self.graphView setNeedsDisplay];
}

- (IBAction)curveSelectionChanged:(id)sender
{
	currentCurve = [sender selectedSegmentIndex];
	[self configureEasingFunction];
}

- (IBAction)easingSelectionChanged:(id)sender
{
	currentEasing = [sender selectedSegmentIndex];
	[self configureEasingFunction];
}

@end
