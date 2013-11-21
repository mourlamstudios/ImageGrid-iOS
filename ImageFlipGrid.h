//
//  ImageFlipGrid.h
//  ImageFlip
//
//  Created by Matthew Mourlam on 11/20/13.
//  Copyright (c) 2013 mourlamstudios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageFlipGrid : UIViewController

@property(strong) UIImage *image;
@property(strong) NSMutableArray *imageGrid;
@property(assign) CGSize gridCount;



-(id) initWithImage: (UIImage*) image gridCount: (CGSize) count;
-(void) doFlipAnimation;

@end
