//
//  OptionsViewController.h
//  UIImagePDFDemo
//
//  Created by Kyle Lopez on 8/7/13.
//  Copyright (c) 2013 Kyle Lopez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OptionsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISegmentedControl *imageTypeSelector;
@property (weak, nonatomic) IBOutlet UISegmentedControl *zoomSelector;
@property (weak, nonatomic) IBOutlet UIButton *backButton;

@property (assign) NSInteger imageSelection;
@property (assign) NSInteger zoomeSelection;

@end
