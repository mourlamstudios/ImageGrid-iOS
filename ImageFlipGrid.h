//
//  ImageFlipGrid.h
//  ImageFlip
//
//  Created by Matthew Mourlam on 11/20/13.
//  Copyright (c) 2013 mourlamstudios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageFlipGrid : UIViewController

-(id) initWithImage: (UIImage*) image;

@property(strong) UIImage *image;

@property(strong) NSMutableArray *imageGrid;

@end
