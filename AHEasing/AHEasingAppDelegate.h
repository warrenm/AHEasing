//
//  AHEasingAppDelegate.h
//  AHEasing
//
//  Created by Warren Moore on 5/27/11.
//  Copyright 2011 Auerhaus Development, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AHEasingViewController;

@interface AHEasingAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet AHEasingViewController *viewController;

@end
