//
//  EHGroupNewViewController.m
//  EnglishHour
//
//  Created by Andriele Menegotto on 15/02/15.
//  Copyright (c) 2015 Cristian Madrid. All rights reserved.
//

#define CIRCLE_SIZE 180
#define PATH_SIZE 160
#define IMAGE_SIZE 45
#define TOUCH_SIZE 70

#define BUTTON_SELECTED_BACK_COLOR [UIColor orangeColor]
#define BUTTON_SELECTED_TEXT_COLOR [UIColor whiteColor]

#define BUTTON_BACK_COLOR [UIColor colorWithRed:0.878 green:0.878 blue:0.878 alpha:1]
#define BUTTON_TEXT_COLOR [UIColor grayColor]

#import "EHGroupNewViewController.h"
#import "EFCircularSlider.h"

@interface EHGroupNewViewController ()

@end

@implementation EHGroupNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addDaysWeekButtons];
    [self setDefaultSliders];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.tabBarController.tabBar.hidden=NO;
    
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden=YES;
    
}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if([self.view respondsToSelector:@selector(setTintColor:)])
    {
        self.view.tintColor = [UIColor orangeColor];
    }
    
}

#pragma mark Days Button methods

-(void) addDaysWeekButtons{
    
    int btX0 = 0;
    int btY2 = 0;
    
    int btX4 = 0;
    int btY5 = 0;
    
    // Create the layers for all the sharing service images.
    for(int i = 0; i < 7; i++) {
        int section = i; // If more than 6 sharers, keep the rest in the last position.
        float trig = section/(7/2.0)*M_PI;
        float x = CIRCLE_SIZE/2.0 + cosf(trig)*PATH_SIZE/2.0;
        float y = CIRCLE_SIZE/2.0 - sinf(trig)*PATH_SIZE/2.0;
        
        if(i==0)
            btX0 = x;
        else if(i==2)
            btY2 = y;
        if(i==4)
            btX4 = x-10;
        else if(i==5)
            btY5 = y+5;
        
        UIButton *button= [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.tag = i;
        [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [button setFrame:CGRectMake(x, y, 50, 50)];
        [button setTitle:[self stringFromWeekday:i] forState:UIControlStateNormal];
        [button setExclusiveTouch:YES];
        [button setTitleColor:BUTTON_TEXT_COLOR forState: UIControlStateNormal];
        
        
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        button.backgroundColor = BUTTON_BACK_COLOR;
        button.layer.cornerRadius = button.frame.size.width / 2;
        button.clipsToBounds = YES;
        
        [self.viewContentDays addSubview:button];
    }
    
    
    UIButton *button= [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.tag = 7;
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [button setFrame:CGRectMake((btX0+btX4)/2, (btY2+btY5)/2, 50, 50)];
    [button setTitle:@"All" forState:UIControlStateNormal];
    [button setExclusiveTouch:YES];
    [button setTitleColor:BUTTON_TEXT_COLOR forState: UIControlStateNormal];
    
    
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    button.backgroundColor = BUTTON_BACK_COLOR;
    button.layer.cornerRadius = button.frame.size.width / 2;
    button.clipsToBounds = YES;
    
    [self.viewContentDays addSubview:button];
    
    
}

- (NSString *)stringFromWeekday:(NSInteger)weekday {
    NSDateFormatter * dateFormatter = [NSDateFormatter new];
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    return dateFormatter.shortWeekdaySymbols[weekday];
}

-(void) buttonClicked:(UIButton*)sender
{
    
    if([self isButtonClicked:sender]){
        if(sender.tag == 7){
            for(UIView *view in self.viewContentDays.subviews){
                
                if([view isKindOfClass:[UIButton class]]){
                    UIButton *bt = (UIButton*)view;
                    [bt setBackgroundColor:BUTTON_BACK_COLOR];
                    [bt setTitleColor:BUTTON_TEXT_COLOR forState:UIControlStateNormal];
                }
            }
        }
        else{
            
            UIButton *btAll = (UIButton *)[self.viewContentDays.subviews objectAtIndex:7];
            if([self isButtonClicked:btAll]){
                [btAll setBackgroundColor:BUTTON_BACK_COLOR];
                [btAll setTitleColor:BUTTON_TEXT_COLOR forState:UIControlStateNormal];
            }
            
            [sender setBackgroundColor:BUTTON_BACK_COLOR];
            [sender setTitleColor:BUTTON_TEXT_COLOR forState:UIControlStateNormal];
        }
        
    }
    else{
        if(sender.tag == 7){
            for(UIView *view in self.viewContentDays.subviews){
                
                if([view isKindOfClass:[UIButton class]]){
                    UIButton *bt = (UIButton*)view;
                    [bt setBackgroundColor:BUTTON_SELECTED_BACK_COLOR];
                    [bt setTitleColor:BUTTON_SELECTED_TEXT_COLOR forState:UIControlStateNormal];
                }
            }
        }
        else{
            
            [sender setBackgroundColor:BUTTON_SELECTED_BACK_COLOR];
            [sender setTitleColor:BUTTON_SELECTED_TEXT_COLOR forState:UIControlStateNormal];
            
            for (int i=0; i < self.viewContentDays.subviews.count-1; i++) {
                if(![self isButtonClicked:((UIButton*)([self.viewContentDays.subviews objectAtIndex:i]))]){
                    break;
                }
                if(i == self.viewContentDays.subviews.count-2){
                    UIButton *btAll = (UIButton *)[self.viewContentDays.subviews objectAtIndex:7];
                    [btAll setBackgroundColor:BUTTON_SELECTED_BACK_COLOR];
                    [btAll setTitleColor:BUTTON_SELECTED_TEXT_COLOR forState:UIControlStateNormal];
                }
                    
            }
            
        }
    }
}

-(BOOL) isButtonClicked: (UIButton *) button{
    if(button.backgroundColor == [UIColor orangeColor])
        return YES;
    return NO;
}

#pragma mark Time controlls methods

-(void)setDefaultSliders{
    
    self.sliderTimeStart.tag = 0;
    self.sliderTimeFinish.tag = 1;
    
    [self.sliderTimeStart addTarget:
     self action:@selector(minuteDidChange:) forControlEvents:UIControlEventValueChanged];
    [self.sliderTimeFinish addTarget:
     self action:@selector(minuteDidChange:) forControlEvents:UIControlEventValueChanged];
    
    [self.sliderTimeStart setMinimumValue:0];
    [self.sliderTimeStart setMaximumValue:1440];
    
    [self.sliderTimeFinish setMinimumValue:0];
    [self.sliderTimeFinish setMaximumValue:1440];
    
    [self.sliderTimeStart setValue:720];
    [self.sliderTimeFinish setValue:720];
}

-(IBAction)minuteDidChange:(UISlider*)sender {
    int value = (int)sender.value - (int)sender.value % 30;
    if (sender.tag == 0) {
        self.lblTimeStart.text = [self getFormatedHour:value];
    }
    else if(sender.tag == 1){
        self.lblTimeFinish.text = [self getFormatedHour:value];
    }
}

-(NSString*) getFormatedHour: (int) minutes{
    
    int rest = minutes%720;
    return [NSString stringWithFormat:@" %02d:%02d %@", ((rest >= 0 && rest < 60 ? 720 : minutes%720))/60, (minutes%720)%60, minutes < 1440 && minutes >= 720 ? @"PM" : @"AM"];
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