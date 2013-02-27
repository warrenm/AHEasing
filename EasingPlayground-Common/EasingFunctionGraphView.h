//
//  EasingFunctionGraphView.h
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

#import "easing.h"

#if TARGET_OS_IPHONE

@interface EasingFunctionGraphView : UIView
@property(nonatomic, strong) IBOutlet UIViewController *viewController; // Unused. Only here to void further preprocessor directives in the .m file.

#else

@interface EasingFunctionGraphView : NSView
@property(nonatomic, strong) IBOutlet NSViewController *viewController;

#endif

@property(nonatomic, assign) CGRect gridBounds;
@property(nonatomic, assign) AHEasingFunction easingFunction;

@end
