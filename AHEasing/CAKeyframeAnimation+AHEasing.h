//
// This is free and unencumbered software released into the public domain.
//
// Anyone is free to copy, modify, publish, use, compile, sell, or
// distribute this software, either in source code form or as a compiled
// binary, for any purpose, commercial or non-commercial, and by any
// means.
//
// In jurisdictions that recognize copyright laws, the author or authors
// of this software dedicate any and all copyright interest in the
// software to the public domain. We make this dedication for the benefit
// of the public at large and to the detriment of our heirs and
// successors. We intend this dedication to be an overt act of
// relinquishment in perpetuity of all present and future rights to this
// software under copyright law.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
// IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
// OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
// ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
// OTHER DEALINGS IN THE SOFTWARE.
//
//
// For more information, please refer to <https://unlicense.org>
//

#import <QuartzCore/QuartzCore.h>
#include "easing.h"

@interface CAKeyframeAnimation (AHEasing)

/// Factory method to create a keyframe animation for animating a scalar value
+ (instancetype)animationWithKeyPath:(NSString *)path
                            function:(AHEasingFunction)function
                           fromValue:(CGFloat)fromValue
                             toValue:(CGFloat)toValue
                       keyframeCount:(size_t)keyframeCount;

/// Factory method to create a keyframe animation for animating a scalar value,
/// with keyFrameCount set to AHEasingDefaultKeyframeCount
+ (instancetype)animationWithKeyPath:(NSString *)path
                            function:(AHEasingFunction)function
                           fromValue:(CGFloat)fromValue
                             toValue:(CGFloat)toValue;

/// Factory method to create a keyframe animation for animating between two points
+ (instancetype)animationWithKeyPath:(NSString *)path
                            function:(AHEasingFunction)function
                           fromPoint:(CGPoint)fromPoint
                             toPoint:(CGPoint)toPoint
                       keyframeCount:(size_t)keyframeCount;

/// Factory method to create a keyframe animation for animating between two points,
/// with keyFrameCount set to AHEasingDefaultKeyframeCount
+ (instancetype)animationWithKeyPath:(NSString *)path
                            function:(AHEasingFunction)function
                           fromPoint:(CGPoint)fromValue
                             toPoint:(CGPoint)toValue;

/// Factory method to create a keyframe animation for animating between two sizes
+ (instancetype)animationWithKeyPath:(NSString *)path
                            function:(AHEasingFunction)function
                            fromSize:(CGSize)fromSize
                              toSize:(CGSize)toSize
                       keyframeCount:(size_t)keyframeCount;

/// Factory method to create a keyframe animation for animating between two sizes,
/// with keyFrameCount set to AHEasingDefaultKeyframeCount
+ (instancetype)animationWithKeyPath:(NSString *)path
                            function:(AHEasingFunction)function
                            fromSize:(CGSize)fromValue
                              toSize:(CGSize)toValue;

/// Factory method to create a keyframe animation for animating between two affine transforms.
/// The provinstancetypeed transforms must not have any shearing factors, and must have uniform scale.
/// The keyframe values are instances of NSValue wrapping a CATransform3D.
+ (instancetype)animationWithKeyPath:(NSString *)path
                            function:(AHEasingFunction)function
                       fromTransform:(CGAffineTransform)fromTransform
                         toTransform:(CGAffineTransform)toTransform
                       keyframeCount:(size_t)keyframeCount;

/// Factory method to create a keyframe animation for animating between two affine transforms,
/// with keyFrameCount set to AHEasingDefaultKeyframeCount.
/// The provinstancetypeed transforms must not have any shearing factors, and must have uniform scale.
/// The keyframe values are instances of NSValue wrapping a CATransform3D.
+ (instancetype)animationWithKeyPath:(NSString *)path
                            function:(AHEasingFunction)function
                       fromTransform:(CGAffineTransform)fromTransform
                         toTransform:(CGAffineTransform)toTransform;

@end
