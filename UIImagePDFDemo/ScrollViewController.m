//
//  ScrollViewController.m
//  UIImagePDFDemo
//
//  Created by Kyle Lopez on 8/7/13.
//  Copyright (c) 2013 Kyle Lopez. All rights reserved.
//

#import "ScrollViewController.h"
#import "OptionsViewController.h"
#import "UIImage+PDF.h"

@interface ScrollViewController () {
    NSInteger imageSelection;
    NSInteger zoomSelection;
}
@property (nonatomic,strong) UIImageView *myImageView;
@end

@implementation ScrollViewController

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
    
    imageSelection = 0;
    zoomSelection = 0;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self refreshImageView];
}

- (void)refreshImageView
{
    [self.myImageView removeFromSuperview];
    self.myImageView = nil;
    
    UIImageView *imageView;
    
    if(!imageSelection)
    {
        imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Witch_cutout.png"]];
        if(zoomSelection)
        {
            imageView.frame = CGRectMake(0, 0, imageView.frame.size.width * (zoomSelection == 1 ? 2 : 4), imageView.frame.size.height * (zoomSelection == 1 ? 2 : 4));
        }
    }
    else
    {
        if (zoomSelection == 0) {
            imageView = [[UIImageView alloc] initWithImage:[UIImage imageWithPDFNamed:@"Witch_cutout.pdf" atHeight:457]];
        }
        else if (zoomSelection == 1) {
            imageView = [[UIImageView alloc] initWithImage:[UIImage imageWithPDFNamed:@"Witch_cutout.pdf" atHeight:914]];
        }
        else {
            imageView = [[UIImageView alloc] initWithImage:[UIImage imageWithPDFNamed:@"Witch_cutout.pdf" atHeight:1828]];
        }
    }
    
    self.myImageView = imageView;
    
    [self.Scroller addSubview:imageView];
    [self.Scroller setContentSize:imageView.frame.size];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)returnSegue:(UIStoryboardSegue*)segue
{
    OptionsViewController *sourceVC = (OptionsViewController*)segue.sourceViewController;
    
    imageSelection = sourceVC.imageTypeSelector.selectedSegmentIndex;
    zoomSelection = sourceVC.zoomSelector.selectedSegmentIndex;
    
    [self refreshImageView];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    OptionsViewController *destinationVC = (OptionsViewController*)segue.destinationViewController;
    
    destinationVC.imageSelection = imageSelection;
    destinationVC.zoomeSelection = zoomSelection;
}

@end
