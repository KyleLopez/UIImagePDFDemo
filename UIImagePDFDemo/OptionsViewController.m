//
//  OptionsViewController.m
//  UIImagePDFDemo
//
//  Created by Kyle Lopez on 8/7/13.
//  Copyright (c) 2013 Kyle Lopez. All rights reserved.
//

#import "OptionsViewController.h"

@interface OptionsViewController ()

@end

@implementation OptionsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.backButton.transform = CGAffineTransformMakeScale(-1, 1);
    
    self.imageTypeSelector.selectedSegmentIndex = self.imageSelection;
    self.zoomSelector.selectedSegmentIndex = self.zoomeSelection;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
