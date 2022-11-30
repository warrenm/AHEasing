//
//  PlaygroundNSViewController.h
//  EasingPlayground-Mac
//
//  Copyright (c) 2013, Auerhaus Development, LLC
//  Copyright (c) 2022, Warren Moore
//
//  This program is free software. It comes without any warranty, to
//  the extent permitted by applicable law. You can redistribute it
//  and/or modify it under the terms of the Do What The Fuck You Want
//  To Public License, Version 2, as published by Sam Hocevar. See
//  http://sam.zoy.org/wtfpl/COPYING for more details.
//

#import <Cocoa/Cocoa.h>
#import "CAKeyframeAnimation+AHEasing.h"
#import "EasingFunctionGraphView.h"
#import "EasingDeclarations.h"

@interface PlaygroundNSViewController : NSViewController

@property(nonatomic, strong) IBOutlet NSView *boid;
@property(nonatomic, strong) IBOutlet EasingFunctionGraphView *graphView;

- (IBAction)curveSelectionChanged:(id)sender;
- (IBAction)easingSelectionChanged:(id)sender;

@end
