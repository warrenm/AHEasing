//
//  EasingDeclarations.h
//
//  Copyright (c) 2022, Warren Moore
//
//  This program is free software. It comes without any warranty, to
//  the extent permitted by applicable law. You can redistribute it
//  and/or modify it under the terms of the Do What The Fuck You Want
//  To Public License, Version 2, as published by Sam Hocevar. See
//  http://sam.zoy.org/wtfpl/COPYING for more details.
//

typedef NS_ENUM(NSInteger, CurveType)
{
	CurveTypeLinear,
	CurveTypeQuadratic,
	CurveTypeCubic,
	CurveTypeQuartic,
	CurveTypeQuintic,
	CurveTypeSine,
	CurveTypeCircular,
	CurveTypeExpo,
	CurveTypeElastic,
	CurveTypeBack,
	CurveTypeBounce,
};

typedef NS_ENUM(NSInteger, EasingMode)
{
	EaseIn,
	EaseOut,
	EaseInOut,
};
