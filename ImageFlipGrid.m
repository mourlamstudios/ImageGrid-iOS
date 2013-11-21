//
//  ImageFlipGrid.m
//  ImageFlip
//
//  Created by Matthew Mourlam on 11/20/13.
//  Copyright (c) 2013 mourlamstudios. All rights reserved.
//

#import "ImageFlipGrid.h"
#import "mrmUtility.h"

@implementation ImageFlipGrid


-(id) initWithImage: (UIImage*) image gridCount: (CGSize) count
{
    self.image = [image copy];
    self.gridCount = count;
    
    if(self=[super init])
    {
        //self.view.backgroundColor = [UIColor redColor];
        self.view.frame = CGRectMake(0, 0, image.size.width,image.size.height);
        
        NSLog(@"%f, %f",self.image.size.width,self.image.size.height);
        
        [self generateImageGrid];
    }
    
    return self;
}

-(void) viewDidLoad
{
    
}

//Slices up large image into smaller uiimageviews
-(void) generateImageGrid
{
    NSLog(@"ImageFlipGrid : generateImageGrid");
    
    float gridSizeX = self.view.frame.size.width/self.gridCount.width;
    float gridSizeY = self.view.frame.size.height/self.gridCount.height;
    
    self.imageGrid = [[NSMutableArray alloc]init];
    
    for(int yer=0;yer<self.gridCount.height;yer++)
    {
        for(int xer=0;xer<self.gridCount.width;xer++)
        {
            //Create image view slice
            UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(xer*gridSizeX,yer*gridSizeY,gridSizeX,gridSizeY)];
            
            imgView.contentMode = UIViewContentModeScaleAspectFill;
            
            //Generate image to add to image view
            
            //BUG ***** MULTIPLY BY 2 ONLY ON RETINA IMAGE. NEED SOME CONTEXT HERE.
            CGRect imgFrame = CGRectMake(xer*gridSizeX*2, yer*gridSizeY*[[UIScreen mainScreen] scale], gridSizeX*[[UIScreen mainScreen] scale], gridSizeY*2);
            CGImageRef imageRef = CGImageCreateWithImageInRect([self.image CGImage], imgFrame);
            UIImage* subImage = [UIImage imageWithCGImage: imageRef];
            CGImageRelease(imageRef);
            
            //Add generated image to image view
            [imgView setImage: subImage];
            
            //Setup initial transform with perspective
            imgView.layer.transform = [mrmUtility rotateView:imgView byX:0 byY:0];
            
            [self.view addSubview:imgView];
            
            [self.imageGrid addObject: imgView];
        }
    }
    
    [self doFlipAnimation];
}

-(void) doFlipAnimation
{
    NSLog(@"doFlipAnimation");
    
    float delayDelta = 0.12f;
    float rowDelay = 0.06f;
    
    float duration = 0.5f;
    
    float maxDelayTime = 30.0f;
    float totalRowDelay = 0.0f;
    
    for(int yer=0;yer<self.gridCount.height;yer++)
    {
        for(int xer=0;xer<self.gridCount.width;xer++)
        {
            UIImageView *imgView = [self.imageGrid objectAtIndex: yer*self.gridCount.width+xer];
            
            float calculatedDelay = xer*delayDelta + totalRowDelay;
            
            //ROTATION ANIMATION
            CAKeyframeAnimation *rotationAnimation;
            rotationAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.y"];
            
            rotationAnimation.keyTimes = [NSArray arrayWithObjects:
                                          [NSNumber numberWithFloat: 0],
                                       [NSNumber numberWithFloat: 0.5],
                                        [NSNumber numberWithFloat: 0.50001],
                                       [NSNumber numberWithFloat: 1.0],
                                       nil];
            rotationAnimation.values = [NSArray arrayWithObjects:
                                        [NSNumber numberWithFloat: 0],
                                        [NSNumber numberWithFloat: M_PI/2],
                                        [NSNumber numberWithFloat: -M_PI/2],
                                        [NSNumber numberWithFloat: 0],
                                        nil];
            
    
            rotationAnimation.duration = duration;
            rotationAnimation.beginTime = CACurrentMediaTime()+calculatedDelay;
            rotationAnimation.fillMode = kCAFillModeForwards;
            rotationAnimation.removedOnCompletion = NO;
            rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
            [imgView.layer addAnimation:rotationAnimation forKey:@"rotationAnimation1"];
            
            //OPACITY ANIMATION
            CAKeyframeAnimation *opacityAnimation;
            opacityAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
            
            opacityAnimation.keyTimes = [NSArray arrayWithObjects:
                                          [NSNumber numberWithFloat: 0],
                                          [NSNumber numberWithFloat: 0.5],
                                          [NSNumber numberWithFloat: 0.50001],
                                          [NSNumber numberWithFloat: 1.0],
                                          nil];
            opacityAnimation.values = [NSArray arrayWithObjects:
                                        [NSNumber numberWithFloat: 1.0],
                                        [NSNumber numberWithFloat: 0],
                                        [NSNumber numberWithFloat: 0],
                                        [NSNumber numberWithFloat: 1.0],
                                        nil];
            opacityAnimation.duration = duration;
            opacityAnimation.beginTime = CACurrentMediaTime()+calculatedDelay;
            opacityAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
            
            [imgView.layer addAnimation:opacityAnimation forKey:@"opacity"];
        }
        
        totalRowDelay += rowDelay;
        
    }
    
    [NSTimer scheduledTimerWithTimeInterval:6.0f target:self selector:@selector(doFlipAnimation) userInfo:nil repeats:NO];
}


@end
