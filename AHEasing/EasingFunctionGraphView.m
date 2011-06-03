//
//  EasingFunctionGraphView.m
//  AHEasing
//
//  Created by Warren Moore on 6/3/11.
//  Copyright 2011 Auerhaus Development, LLC. All rights reserved.
//

#import "EasingFunctionGraphView.h"

#define CGRectGetMaxPoint(rect) CGPointMake(CGRectGetMaxX(rect), CGRectGetMaxY(rect))

@implementation EasingFunctionGraphView
@synthesize gridBounds;
@synthesize easingFunction;

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
		easingFunction = LinearInterpolation;
		gridBounds = CGRectMake(-1.3, -0.4, 3.6, 1.8);
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
	[super drawRect:rect];
	
	CGFloat gridSpacing = 0.1;
	
	CGContextRef context = UIGraphicsGetCurrentContext();
	
	CGSize viewSize = [self bounds].size;
	CGSize gridSize = gridBounds.size;
	
	CGFloat xScale = viewSize.width / gridSize.width;
	CGFloat yScale = viewSize.height / gridSize.height;
	
	CGPoint mappedOrigin = gridBounds.origin;
	
	// Transform view coordinates to match grid coordinates
	CGContextScaleCTM(context, xScale, -yScale);
	CGContextTranslateCTM(context, 0, -gridSize.height);
	CGContextTranslateCTM(context, -mappedOrigin.x, -mappedOrigin.y);
	
	CGContextSetStrokeColorWithColor(context, [[UIColor lightGrayColor] CGColor]);
	
	// Draw vertical gridlines
	CGFloat gridLineX = 0.0;
	while(gridLineX <= 1.01)
	{
		CGContextMoveToPoint(context, gridLineX, 0);
		CGContextAddLineToPoint(context, gridLineX, 1);
		CGContextSetLineWidth(context, 1/xScale);
		CGContextStrokePath(context);

		gridLineX += gridSpacing;
	}

	// Draw horizontal grid lines
	CGFloat gridLineY = 0.0;
	while(gridLineY <= 1.01)
	{
		CGContextMoveToPoint(context, 0, gridLineY);
		CGContextAddLineToPoint(context,1, gridLineY);
		CGContextSetLineWidth(context, 1/yScale);
		CGContextStrokePath(context);

		gridLineY += gridSpacing;
	}
	
	// Draw easing function path
	CGFloat x = 0;
	CGFloat y = easingFunction(x);
	CGContextMoveToPoint(context, x, y);
	
	while(x <= 1.0)
	{
		CGFloat y = easingFunction(x);
		CGContextAddLineToPoint(context, x, y);
		x += gridSize.width / 300;
	}
	
	CGContextSetLineWidth(context, 3/xScale);
	CGContextSetLineJoin(context, kCGLineJoinRound);
	CGContextSetStrokeColorWithColor(context, [[UIColor blackColor] CGColor]);
	CGContextStrokePath(context);
}

- (void)dealloc
{
    [super dealloc];
}

@end
