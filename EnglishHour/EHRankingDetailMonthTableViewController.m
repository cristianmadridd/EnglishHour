//
//  EHRankingDetailMonthTableViewController.m
//  EnglishHour
//
//  Created by Andriele Menegotto on 25/02/15.
//  Copyright (c) 2015 Cristian Madrid. All rights reserved.
//

#import "EHRankingDetailMonthTableViewController.h"

@interface EHRankingDetailMonthTableViewController ()

@end
@implementation EHRankingDetailMonthTableViewController

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    self.tableData = [[NSMutableArray alloc] initWithObjects:@"One",@"Two",@"Three",@"Four",@"Five",@"Six",@"Seven",@"Eight",@"Nine",@"Ten",nil];
    
}

- (void)didReceiveMemoryWarning{
    
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
    
}

#pragma - markup TableView Delegate Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.tableData count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
        
    }
    
    UILabel *userPosition = [[UILabel alloc] init];
    UIImageView *userPhoto = [[UIImageView alloc] init];
    UILabel *userName = [[UILabel alloc] init];
    UILabel *userPoints = [[UILabel alloc] init];
    
    [userPosition setFrame:CGRectMake(10, 0, 40, cell.frame.size.height)];
    
    [userPhoto setFrame:
     CGRectMake(userPosition.frame.origin.x + userPosition.frame.size.width + 10, 3, 38, 38)];
    
    [userName setFrame:
     CGRectMake(userPhoto.frame.origin.x + userPhoto.frame.size.width + 10, 0, 200, cell.frame.size.height)];
    
    [userPoints setFrame:
     CGRectMake(cell.frame.size.width, 0, 40, cell.frame.size.height)];
    
    userPosition.text = [@(indexPath.row+1) stringValue];
    userPhoto.image = [UIImage imageNamed:@"cheap.jpg"];
    userName.text = [self.tableData objectAtIndex: indexPath.row];
    userPoints.text = @"30";
    
    userPhoto.layer.cornerRadius = userPhoto.frame.size.width / 2;
    userPhoto.clipsToBounds = YES;
    
    userPosition.textAlignment = NSTextAlignmentCenter;
    userName.textAlignment = NSTextAlignmentCenter;
    
    [cell addSubview:userPosition];
    [cell addSubview:userPhoto];
    [cell addSubview:userName];
    [cell addSubview:userPoints];
    
    cell.separatorInset = UIEdgeInsetsZero;
    
    return cell;
    
}

-(void)viewDidLayoutSubviews
{
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.tableView setLayoutMargins:UIEdgeInsetsZero];
    }
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Alert" message:[NSString stringWithFormat:@"Selected Value is %@",[self.tableData objectAtIndex:indexPath.row]] delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    
    [alertView show];
    
}

@end
