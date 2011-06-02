//
//  CAKeyframeAnimation+AHEasing.m
//
//  Copyright (c) 2011, Auerhaus Development, LLC
//
//  This program is free software. It comes without any warranty, to
//  the extent permitted by applicable law. You can redistribute it
//  and/or modify it under the terms of the Do What The Fuck You Want
//  To Public License, Version 2, as published by Sam Hocevar. See
//  http://sam.zoy.org/wtfpl/COPYING for more details.
//

#import "CAKeyframeAnimation+AHEasing.h"

// The larger this number, the smoother the animation
#define AHEasingKeyframeCount 60

@implementation CAKeyframeAnimation (AHEasing)

+ (id)animationWithKeyPath:(NSString *)path function:(AHEasingFunction)function fromValue:(CGFloat)fromValue toValue:(CGFloat)toValue
{
	NSMutableArray *values = [NSMutableArray arrayWithCapacity:AHEasingKeyframeCount];
	
	CGFloat t = 0.0;
	CGFloat dt = 1.0 / (AHEasingKeyframeCount - 1);
	for(size_t frame = 0; frame < AHEasingKeyframeCount; ++frame, t += dt)
	{
		CGFloat value = fromValue + function(t) * (toValue - fromValue);
		[values addObject:[NSNumber numberWithFloat:value]];
	}
	
	CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:path];
	[animation setValues:values];
	return animation;
}

+ (id)animationWithKeyPath:(NSString *)path function:(AHEasingFunction)function fromPoint:(CGPoint)fromPoint toPoint:(CGPoint)toPoint
{
	NSMutableArray *values = [NSMutableArray arrayWithCapacity:AHEasingKeyframeCount];
	
	CGFloat t = 0.0;
	CGFloat dt = 1.0 / (AHEasingKeyframeCount - 1);
	for(size_t frame = 0; frame < AHEasingKeyframeCount; ++frame, t += dt)
	{
		CGFloat x = fromPoint.x + function(t) * (toPoint.x - fromPoint.x);
		CGFloat y = fromPoint.y + function(t) * (toPoint.y - fromPoint.y);
		[values addObject:[NSValue valueWithCGPoint:CGPointMake(x, y)]];
	}
	
	CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:path];
	[animation setValues:values];
	return animation;
}

+ (id)animationWithKeyPath:(NSString *)path function:(AHEasingFunction)function fromSize:(CGSize)fromSize toSize:(CGSize)toSize
{
	NSMutableArray *values = [NSMutableArray arrayWithCapacity:AHEasingKeyframeCount];
	
	CGFloat t = 0.0;
	CGFloat dt = 1.0 / (AHEasingKeyframeCount - 1);
	for(size_t frame = 0; frame < AHEasingKeyframeCount; ++frame, t += dt)
	{
		CGFloat w = fromSize.width + function(t) * (toSize.width - fromSize.width);
		CGFloat h = fromSize.height + function(t) * (toSize.height - fromSize.height);
		[values addObject:[NSValue valueWithCGSize:CGSizeMake(w, h)]];
	}
	
	CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:path];
	[animation setValues:values];
	return animation;
}

@end
