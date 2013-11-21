//
//  mrmMath.h
//  SwipeTest
//
//  Created by Matthew Mourlam on 9/17/13.
//  Copyright (c) 2013 Matthew Mourlam & Almas Daumov. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DegreesToRadians(degrees) (degrees * M_PI / 180)
#define RadiansToDegrees(radians) (radians * 180 / M_PI)

@interface mrmUtility : NSObject

+(float) randomFloat:(float) Min max: (float) Max;
+(CATransform3D) create3DTransform: (float) x;
+(CALayer*) gradientMaskVertical: (UIView*) view inverted:(BOOL) inverted;
+(CATransform3D) rotateView: (UIView*) view byX: (float) x byY: (float) y;

+(UIColor*) randomColor;

@end
