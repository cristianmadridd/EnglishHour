//
//  EHRankingDetailViewController.m
//  EnglishHour
//
//  Created by Andriele Menegotto on 15/02/15.
//  Copyright (c) 2015 Cristian Madrid. All rights reserved.
//

#import "EHRankingDetailViewController.h"
#import "EHRankingDetailDayTableViewController.h"
#import "EHRankingDetailWeekTableViewController.h"
#import "EHRankingDetailMonthTableViewController.h"

@interface EHRankingDetailViewController ()
@end

UIView *day;
UIView *week;
UIView *month;

@implementation EHRankingDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.sgmMenu.selectedSegmentIndex = 2;
    [self.sgmMenu sendActionsForControlEvents:UIControlEventValueChanged];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)segMentValueChanged:(id)sender
{
    
    if(self.sgmMenu.selectedSegmentIndex==0)
    {
        EHRankingDetailDayTableViewController *viewDay = [[EHRankingDetailDayTableViewController alloc]init];
        [self addChildViewController:viewDay];
        [self.scrollContent addSubview:viewDay.view];
    }
    else if (self.sgmMenu.selectedSegmentIndex==1)
    {
        EHRankingDetailWeekTableViewController *viewWeek = [[EHRankingDetailWeekTableViewController alloc]init];
        [self addChildViewController:viewWeek];
        [self.scrollContent addSubview:viewWeek.view];
    }
    else if (self.sgmMenu.selectedSegmentIndex==2)
    {
        EHRankingDetailMonthTableViewController *viewMonth = [[EHRankingDetailMonthTableViewController alloc]init];
        [self addChildViewController:viewMonth];
        [self.scrollContent addSubview:viewMonth.view];
    }
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
