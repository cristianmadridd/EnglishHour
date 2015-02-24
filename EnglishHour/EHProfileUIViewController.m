//
//  EHProfile.m
//  EnglishHour
//
//  Created by Cristian Madrid on 2/13/15.
//  Copyright (c) 2015 Cristian Madrid. All rights reserved.
//

#import "EHProfileUIViewController.h"

@implementation EHProfileUIViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    [self setImageCircle];
    
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc]init] forBarMetrics:UIBarMetricsDefault];
    
}

-(void) setImageCircle{
    //create circle
    self.profileImage.layer.cornerRadius = self.profileImage.frame.size.width / 2;
    self.profileImage.clipsToBounds = YES;
    
    //set borders
    self.profileImage.layer.borderWidth = 3.0f;
    self.profileImage.layer.borderColor = [UIColor whiteColor].CGColor;
    
    //set background image
    self.profileImage.image = [UIImage imageNamed:@"cheap.jpg"];
    
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

@end
