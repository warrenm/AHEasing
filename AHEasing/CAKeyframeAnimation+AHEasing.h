//
//  CAKeyframeAnimation+AHEasing.h
//  AHEasing
//
//  Created by Warren Moore on 6/2/11.
//  Copyright 2011 Auerhaus Development, LLC. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#include "easing.h"

@interface CAKeyframeAnimation (AHEasing)

// Factory method to create a keyframe animation for animating a scalar value
+ (id)animationWithKeyPath:(NSString *)path function:(AHEasingFunction)function fromValue:(CGFloat)fromValue toValue:(CGFloat)toValue;

// Factory method to create a keyframe animation for animating between two points
+ (id)animationWithKeyPath:(NSString *)path function:(AHEasingFunction)function fromPoint:(CGPoint)fromValue toPoint:(CGPoint)toValue;

// Factory method to create a keyframe animation for animating between two sizes
+ (id)animationWithKeyPath:(NSString *)path function:(AHEasingFunction)function fromSize:(CGSize)fromValue toSize:(CGSize)toValue;

@end
