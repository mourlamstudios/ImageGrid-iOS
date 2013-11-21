//
//  ViewController.m
//  ImageFlip
//
//  Created by Matthew Mourlam on 11/20/13.
//  Copyright (c) 2013 mourlamstudios. All rights reserved.
//

#import "ViewController.h"
#import "ImageFlipGrid.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    ImageFlipGrid *flipGrid = [[ImageFlipGrid alloc]initWithImage: [UIImage imageNamed:@"testImage.png"]];
    
    [self.view addSubview: flipGrid.view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
