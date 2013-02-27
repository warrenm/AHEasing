//
//  PlaygroundViewController.h
//
//  Copyright (c) 2011, Auerhaus Development, LLC
//
//  This program is free software. It comes without any warranty, to
//  the extent permitted by applicable law. You can redistribute it
//  and/or modify it under the terms of the Do What The Fuck You Want
//  To Public License, Version 2, as published by Sam Hocevar. See
//  http://sam.zoy.org/wtfpl/COPYING for more details.
//

#import <QuartzCore/QuartzCore.h>
#import "CAKeyframeAnimation+AHEasing.h"
#import "EasingFunctionGraphView.h"
#import "EasingDeclarations.h"

@interface PlaygroundViewController : UIViewController {
	BOOL animating;
	NSInteger currentCurve, currentEasing;
	AHEasingFunction currentFunction;
}

@property(nonatomic, strong) IBOutlet UIView *boid;
@property(nonatomic, strong) IBOutlet EasingFunctionGraphView *graphView;
@property (nonatomic, strong) IBOutlet UISegmentedControl *curveSegmentedControl;
@property (nonatomic, strong) IBOutlet UISegmentedControl *easingSegmentedControl;

- (IBAction)curveSelectionChanged:(id)sender;
- (IBAction)easingSelectionChanged:(id)sender;

@end
