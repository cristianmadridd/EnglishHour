//
//  EHGroupNewViewController.h
//  EnglishHour
//
//  Created by Andriele Menegotto on 15/02/15.
//  Copyright (c) 2015 Cristian Madrid. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface EHGroupNewViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *viewContentDays;

@property (weak, nonatomic) IBOutlet UITextField *txtGroupName;

@property (weak, nonatomic) IBOutlet UILabel *lblTimeStart;
@property (weak, nonatomic) IBOutlet UILabel *lblTimeFinish;

@property (weak, nonatomic) IBOutlet UISlider *sliderTimeStart;
@property (weak, nonatomic) IBOutlet UISlider *sliderTimeFinish;

@property (weak, nonatomic) IBOutlet UISwitch *swtIsPrivate;

@end
