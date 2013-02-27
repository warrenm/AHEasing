//
//  AppDelegate.m
//  EasingPlayground-iOS
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
#import "PlaygroundViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	self.window.rootViewController = [[PlaygroundViewController alloc] initWithNibName:@"PlaygroundView" bundle:nil];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
