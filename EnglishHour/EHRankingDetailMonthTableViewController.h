//
//  EHRankingDetailMonthTableViewController.h
//  EnglishHour
//
//  Created by Andriele Menegotto on 25/02/15.
//  Copyright (c) 2015 Cristian Madrid. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EHRankingDetailMonthTableViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UITableView *tableViewObject;

@property (nonatomic,retain) NSMutableArray *tableData;

@end
