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

#ifndef AH_EASING_H
#define AH_EASING_H

#if defined(__LP64__) && !defined(AH_EASING_USE_DBL_PRECIS)
#define AH_EASING_USE_DBL_PRECIS
#endif

#ifdef AH_EASING_USE_DBL_PRECIS
#define AH_FLOAT_TYPE double
#else
#define AH_FLOAT_TYPE float
#endif
typedef AH_FLOAT_TYPE AHFloat;

#if defined __cplusplus
extern "C" {
#endif

typedef AHFloat (*AHEasingFunction)(AHFloat);

// Linear interpolation (no easing)
AHFloat LinearInterpolation(AHFloat p);

// Quadratic easing; p^2
AHFloat QuadraticEaseIn(AHFloat p);
AHFloat QuadraticEaseOut(AHFloat p);
AHFloat QuadraticEaseInOut(AHFloat p);

// Cubic easing; p^3
AHFloat CubicEaseIn(AHFloat p);
AHFloat CubicEaseOut(AHFloat p);
AHFloat CubicEaseInOut(AHFloat p);

// Quartic easing; p^4
AHFloat QuarticEaseIn(AHFloat p);
AHFloat QuarticEaseOut(AHFloat p);
AHFloat QuarticEaseInOut(AHFloat p);

// Quintic easing; p^5
AHFloat QuinticEaseIn(AHFloat p);
AHFloat QuinticEaseOut(AHFloat p);
AHFloat QuinticEaseInOut(AHFloat p);

// Sine wave easing; sin(p * PI/2)
AHFloat SineEaseIn(AHFloat p);
AHFloat SineEaseOut(AHFloat p);
AHFloat SineEaseInOut(AHFloat p);

// Circular easing; sqrt(1 - p^2)
AHFloat CircularEaseIn(AHFloat p);
AHFloat CircularEaseOut(AHFloat p);
AHFloat CircularEaseInOut(AHFloat p);

// Exponential easing, base 2
AHFloat ExponentialEaseIn(AHFloat p);
AHFloat ExponentialEaseOut(AHFloat p);
AHFloat ExponentialEaseInOut(AHFloat p);

// Exponentially-damped sine wave easing
AHFloat ElasticEaseIn(AHFloat p);
AHFloat ElasticEaseOut(AHFloat p);
AHFloat ElasticEaseInOut(AHFloat p);

// Overshooting cubic easing; 
AHFloat BackEaseIn(AHFloat p);
AHFloat BackEaseOut(AHFloat p);
AHFloat BackEaseInOut(AHFloat p);

// Exponentially-decaying bounce easing
AHFloat BounceEaseIn(AHFloat p);
AHFloat BounceEaseOut(AHFloat p);
AHFloat BounceEaseInOut(AHFloat p);

#ifdef __cplusplus
}
#endif

#endif
