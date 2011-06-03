//
//  EasingFunctionGraphView.h
//  AHEasing
//
//  Created by Warren Moore on 6/3/11.
//  Copyright 2011 Auerhaus Development, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "easing.h"

@interface EasingFunctionGraphView : UIView {
}

@property(nonatomic, assign) CGRect gridBounds;
@property(nonatomic, assign) AHEasingFunction easingFunction;

@end
