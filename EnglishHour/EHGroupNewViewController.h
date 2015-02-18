//
//  EHGroupNewViewController.h
//  EnglishHour
//
//  Created by Andriele Menegotto on 15/02/15.
//  Copyright (c) 2015 Cristian Madrid. All rights reserved.
//
#import "NMRangeSlider.h"
#import <UIKit/UIKit.h>

@interface EHGroupNewViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *upperLabel;
@property (weak, nonatomic) IBOutlet UILabel *lowerLabel;
@property (weak, nonatomic) IBOutlet UIView *viewCnt;
@property (weak, nonatomic) IBOutlet UIView *viewHour;

@property (weak, nonatomic) IBOutlet NMRangeSlider *labelSlider;

- (IBAction)labelSliderChanged:(NMRangeSlider*)sender;

@end
