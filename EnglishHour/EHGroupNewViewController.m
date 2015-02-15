//
//  EHGroupNewViewController.m
//  EnglishHour
//
//  Created by Andriele Menegotto on 15/02/15.
//  Copyright (c) 2015 Cristian Madrid. All rights reserved.
//

#import "EHGroupNewViewController.h"

@interface EHGroupNewViewController ()

@end

@implementation EHGroupNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setRoundedButtonDays];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden=YES;
}

-(void) setRoundedButtonDays{
    self.sunButton.layer.cornerRadius = self.sunButton.frame.size.width / 2;
    self.sunButton.clipsToBounds = YES;
    
    self.monButton.layer.cornerRadius = self.monButton.frame.size.width / 2;
    self.monButton.clipsToBounds = YES;
    
    self.tueButton.layer.cornerRadius = self.tueButton.frame.size.width / 2;
    self.tueButton.clipsToBounds = YES;
    
    self.wedButton.layer.cornerRadius = self.wedButton.frame.size.width / 2;
    self.wedButton.clipsToBounds = YES;
    
    self.thuButton.layer.cornerRadius = self.thuButton.frame.size.width / 2;
    self.thuButton.clipsToBounds = YES;
    
    self.friButton.layer.cornerRadius = self.friButton.frame.size.width / 2;
    self.friButton.clipsToBounds = YES;
    
    self.satButton.layer.cornerRadius = self.satButton.frame.size.width / 2;
    self.satButton.clipsToBounds = YES;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
