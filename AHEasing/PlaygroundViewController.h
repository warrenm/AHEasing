//
//  PlaygroundViewController.h
//  AHEasing
//
//  Created by Warren Moore on 5/27/11.
//  Copyright 2011 Auerhaus Development, LLC. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "CAKeyframeAnimation+AHEasing.h"

enum CurveType
{
	CurveTypeLinear,
	CurveTypeQuadratic,
	CurveTypeCubic,
	CurveTypeQuartic,
	CurveTypeQuintic,
	CurveTypeSine,
	CurveTypeCircular,
	CurveTypeExpo,
	CurveTypeElastic,
	CurveTypeBack,
	CurveTypeBounce,
};

enum EaseType
{
	EaseIn,
	EaseOut,
	EaseInOut,
};

@interface PlaygroundViewController : UIViewController {
	BOOL animating;
	NSInteger currentCurve, currentEasing;
	AHEasingFunction currentFunction;
}

@property(nonatomic, retain) IBOutlet UIView *boid, *tapView;
@property (nonatomic, retain) IBOutlet UISegmentedControl *curveSegmentedControl;
@property (nonatomic, retain) IBOutlet UISegmentedControl *easingSegmentedControl;

- (IBAction)curveSelectionChanged:(id)sender;
- (IBAction)easingSelectionChanged:(id)sender;

@end
