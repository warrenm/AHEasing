//
//  EasingFunctionGraphView.m
//  AHEasing
//
//  Copyright (c) 2011, Auerhaus Development, LLC
//
//  This program is free software. It comes without any warranty, to
//  the extent permitted by applicable law. You can redistribute it
//  and/or modify it under the terms of the Do What The Fuck You Want
//  To Public License, Version 2, as published by Sam Hocevar. See
//  http://sam.zoy.org/wtfpl/COPYING for more details.
//

#import "EasingFunctionGraphView.h"

#define CGRectGetMaxPoint(rect) CGPointMake(CGRectGetMaxX(rect), CGRectGetMaxY(rect))

@interface EasingFunctionGraphView ()
- (void)commonInitialization;
@end

@implementation EasingFunctionGraphView

- (id)initWithFrame:(CGRect)frame
{
    if((self = [super initWithFrame:frame]))
		[self commonInitialization];

    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if((self = [super initWithCoder:aDecoder]))
		[self commonInitialization];

    return self;
}

- (void)commonInitialization
{
	_easingFunction = LinearInterpolation;
	_gridBounds = CGRectMake(-1.3, -0.4, 3.6, 1.8);
}

#if !TARGET_OS_IPHONE
- (void)setViewController:(NSViewController *)newController
{
    if(_viewController)
    {
        NSResponder *controllerNextResponder = [_viewController nextResponder];
        [super setNextResponder:controllerNextResponder];
        [_viewController setNextResponder:nil];
    }

    _viewController = newController;

    if (newController)
    {
        NSResponder *ownNextResponder = [self nextResponder];
        [super setNextResponder:_viewController];
        [_viewController setNextResponder:ownNextResponder];
    }
}

- (void)setNextResponder:(NSResponder *)newNextResponder
{
    if(_viewController)
    {
        [_viewController setNextResponder:newNextResponder];
        return;
    }

    [super setNextResponder:newNextResponder];
}
#endif 

- (void)drawRect:(CGRect)rect
{
	[super drawRect:rect];

	CGFloat gridSpacing = 0.1;
	
#if TARGET_OS_IPHONE
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGColorRef lightGray = [UIColor lightGrayColor].CGColor;
	CGColorRef black = [UIColor blackColor].CGColor;
#else
	CGContextRef context = [[NSGraphicsContext currentContext] graphicsPort];
	CGContextScaleCTM(context, 1, -1);
	CGContextTranslateCTM(context, 0, -rect.size.height);
	CGColorRef lightGray = CGColorCreateGenericRGB(0.667, 0.667, 0.667, 1.0);
	CGColorRef black = CGColorCreateGenericRGB(0.0, 0.0, 0.0, 1.0);
#endif
	
	CGSize viewSize = [self bounds].size;
	CGSize gridSize = self.gridBounds.size;
	
	CGFloat xScale = viewSize.width / gridSize.width;
	CGFloat yScale = viewSize.height / gridSize.height;
	
	CGPoint mappedOrigin = self.gridBounds.origin;
	
	// Transform view coordinates to match grid coordinates
	CGContextScaleCTM(context, xScale, -yScale);
	CGContextTranslateCTM(context, 0, -gridSize.height);
	CGContextTranslateCTM(context, -mappedOrigin.x, -mappedOrigin.y);

	CGContextSetStrokeColorWithColor(context, lightGray);
	
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
	CGFloat y = self.easingFunction(x);
	CGContextMoveToPoint(context, x, y);
	
	while(x <= 1.0)
	{
		CGFloat y = self.easingFunction(x);
		CGContextAddLineToPoint(context, x, y);
		x += gridSize.width / 300;
	}
	
	CGContextSetLineWidth(context, 3/xScale);
	CGContextSetLineJoin(context, kCGLineJoinRound);
	CGContextSetStrokeColorWithColor(context, black);
	CGContextStrokePath(context);

#if !TARGET_OS_IPHONE
	CGColorRelease(lightGray);
	CGColorRelease(black);
#endif
}

@end
