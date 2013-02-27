//
//  AppDelegate.m
//  EasingPlayground-Mac
//
//  Copyright (c) 2013, Auerhaus Development, LLC
//
//  This program is free software. It comes without any warranty, to
//  the extent permitted by applicable law. You can redistribute it
//  and/or modify it under the terms of the Do What The Fuck You Want
//  To Public License, Version 2, as published by Sam Hocevar. See
//  http://sam.zoy.org/wtfpl/COPYING for more details.
//

#import "AppDelegate.h"
#import "PlaygroundNSViewController.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	self.viewController = [[PlaygroundNSViewController alloc] initWithNibName:@"PlaygroundView" bundle:nil];
	[self.window.contentView addSubview:self.viewController.view];
	
}

@end
