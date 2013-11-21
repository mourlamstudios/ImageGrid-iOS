//
//  ViewController.m
//  ImageFlip
//
//  Created by Matthew Mourlam on 11/20/13.
//  Copyright (c) 2013 mourlamstudios. All rights reserved.
//

#import "ViewController.h"
#import "ImageFlipGrid.h"
#import "mrmUtility.h"



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.flipGrid = [[ImageFlipGrid alloc]initWithImage: [UIImage imageNamed:@"testImage.png"] gridCount:CGSizeMake(15,3)];
    
    [self.view addSubview: self.flipGrid.view];
    
    
    
    //Animate flip grid
//    flipGrid.view.layer.transform = [mrmUtility rotateView:flipGrid.view byX:0 byY:0];
//    
//    CABasicAnimation *basic = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
//    
//    basic.duration = 5.0;
//    basic.autoreverses = YES;
//    basic.byValue = [NSNumber numberWithFloat: M_PI/20];
//    basic.repeatCount = 9999;
//    
//    
//    [flipGrid.view.layer addAnimation:basic forKey:@"basic"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
