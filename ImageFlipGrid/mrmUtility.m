//
//  mrmMath.m
//  SwipeTest
//
//  Created by Matthew Mourlam on 9/17/13.
//  Copyright (c) 2013 Matthew Mourlam & Almas Daumov. All rights reserved.
//

#import "mrmUtility.h"
#import <QuartzCore/QuartzCore.h>


#define kTRANSFORM_PERSPECTIVE 500

@implementation mrmUtility

+(float) randomFloat:(float) Min max: (float) Max
{
    return ((arc4random()%RAND_MAX)/(RAND_MAX*1.0))*(Max-Min)+Min;
}

+(CATransform3D) create3DTransform: (float) x
{
    CATransform3D rotationAndPerspectiveTransform = CATransform3DIdentity;
    rotationAndPerspectiveTransform.m34 = 1.0 / -kTRANSFORM_PERSPECTIVE;
    rotationAndPerspectiveTransform = CATransform3DRotate(rotationAndPerspectiveTransform, (x*180)* M_PI / 180.0f, 0.0f, 1.0f, 0.0f);
    return rotationAndPerspectiveTransform;
}

+(CATransform3D) rotateView: (UIView*) view byX: (float) x byY: (float) y
{
    CATransform3D rotationAndPerspectiveTransform = CATransform3DIdentity;//view.layer.transform;
    rotationAndPerspectiveTransform.m34 = -1.0/100.0f;
    rotationAndPerspectiveTransform = CATransform3DRotate(rotationAndPerspectiveTransform, x, 1.0f, 0.0f, 0.0f);
    rotationAndPerspectiveTransform = CATransform3DRotate(rotationAndPerspectiveTransform, y, 0.0f, 1.0f, 0.0f);
    
    return rotationAndPerspectiveTransform;
}


//Returns a UIImage from UIView

+ (UIImage*) imageWithView:(UIView *)view
{
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.opaque, 0.0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return img;
}

+(CALayer*) gradientMaskVertical: (UIView*) view inverted:(BOOL) inverted
{
    CAGradientLayer *l = [CAGradientLayer layer];
    l.frame = view.bounds;
    l.colors = [NSArray arrayWithObjects:(id)[UIColor whiteColor].CGColor, (id)[UIColor clearColor].CGColor, nil];
    
    if(inverted)
    {
        l.startPoint = CGPointMake(0.0f, 0.5f);
        l.endPoint = CGPointMake(0.0f, 0.0f);
    }
    
    else
    {
        l.startPoint = CGPointMake(1.0f, 0.8f);
        l.endPoint = CGPointMake(1.0f, 1.0f);
    }
    
    return l;
}


+(UIColor*) randomColor
{
    //Generate random background color
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    
    return color;
}



@end
