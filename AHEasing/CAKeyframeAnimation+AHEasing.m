//
//  CAKeyframeAnimation+AHEasing.m
//  AHEasing
//
//  Created by Warren Moore on 6/2/11.
//  Copyright 2011 Auerhaus Development, LLC. All rights reserved.
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
