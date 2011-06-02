//
//  AHEasingAppDelegate.m
//  AHEasing
//
//  Created by Warren Moore on 5/27/11.
//  Copyright 2011 Auerhaus Development, LLC. All rights reserved.
//

#import "AHEasingAppDelegate.h"

@implementation AHEasingAppDelegate

@synthesize window, viewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	self.window.rootViewController = self.viewController;
	[self.window makeKeyAndVisible];
	
    return YES;
}

- (void)dealloc
{
	[window release], window = nil;
	[viewController release], viewController = nil;
	
    [super dealloc];
}

@end
