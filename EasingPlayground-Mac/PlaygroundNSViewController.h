//
//  PlaygroundNSViewController.h
//  AHEasing
//
//  Created by Warren Moore on 1/15/13.
//  Copyright (c) 2013 Auerhaus Development, LLC. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "CAKeyframeAnimation+AHEasing.h"
#import "EasingFunctionGraphView.h"
#import "EasingDeclarations.h"

@interface PlaygroundNSViewController : NSViewController
{
	BOOL animating;
	NSInteger currentCurve, currentEasing;
	AHEasingFunction currentFunction;
}

@property(nonatomic, strong) IBOutlet NSView *boid;
@property(nonatomic, strong) IBOutlet EasingFunctionGraphView *graphView;

- (IBAction)curveSelectionChanged:(id)sender;
- (IBAction)easingSelectionChanged:(id)sender;

@end
