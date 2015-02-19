//
//  EHGroupNewViewController.m
//  EnglishHour
//
//  Created by Andriele Menegotto on 15/02/15.
//  Copyright (c) 2015 Cristian Madrid. All rights reserved.
//

#define CIRCLE_SIZE 160
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
{
    UILabel *labelSliderInit;
    UILabel *labelSliderEnd;
    
    EFCircularSlider* minuteSlider;
    EFCircularSlider* hourSlider;
}
@end

@implementation EHGroupNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureLabelSlider];
    [self addDaysWeekButtons];
    //[self initializeSlider];
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
    
    [self updateSliderLabels];
    
    if([self.view respondsToSelector:@selector(setTintColor:)])
    {
        self.view.tintColor = [UIColor orangeColor];
    }
    
}

-(void) addDaysWeekButtons{
    
    int btX0 = 0;
    int btY2 = 0;
    
    int btX4 = 0;
    int btY5 = 0;
    
    // Create the layers for all the sharing service images.
    for(int i = 0; i < 7; i++) {
        // Calculate the x and y coordinate. Points go around the unit circle starting at pi = 0.
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
        
        [self.viewCnt addSubview:button];
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
    
    [self.viewCnt addSubview:button];
    
    
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
            for(UIView *view in self.viewCnt.subviews){
                
                if([view isKindOfClass:[UIButton class]]){
                    UIButton *bt = (UIButton*)view;
                    [bt setBackgroundColor:BUTTON_BACK_COLOR];
                    [bt setTitleColor:BUTTON_TEXT_COLOR forState:UIControlStateNormal];
                }
            }
        }
        else{
            
            UIButton *btAll = (UIButton *)[self.viewCnt.subviews objectAtIndex:7];
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
            for(UIView *view in self.viewCnt.subviews){
                
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
            
            for (int i=0; i < self.viewCnt.subviews.count-1; i++) {
                if(![self isButtonClicked:((UIButton*)([self.viewCnt.subviews objectAtIndex:i]))]){
                    break;
                }
                if(i == self.viewCnt.subviews.count-2){
                    UIButton *btAll = (UIButton *)[self.viewCnt.subviews objectAtIndex:7];
                    [btAll setBackgroundColor:BUTTON_SELECTED_BACK_COLOR];
                    [btAll setTitleColor:BUTTON_SELECTED_TEXT_COLOR forState:UIControlStateNormal];
                }
                    
            }
            
        }
    }
    
    NSLog(@"you clicked on button %ld", (long)sender.tag);
}

-(BOOL) isButtonClicked: (UIButton *) button{
    if(button.backgroundColor == [UIColor orangeColor])
        return YES;
    return NO;
}


#pragma MARK Slider
- (void) configureLabelSlider
{
    self.labelSlider.minimumValue = 0;
    self.labelSlider.maximumValue = 1440;
    
    self.labelSlider.lowerValue = 0;
    self.labelSlider.upperValue = 1440;
    
    self.labelSlider.minimumRange = 10;
    self.labelSlider.stepValue = 10;
    
    self.labelSlider.stepValueContinuously = YES;
    
    labelSliderInit = [[UILabel alloc] init];
    labelSliderEnd = [[UILabel alloc] init];
    
    labelSliderInit.text = @"00:00 AM";
    labelSliderEnd.text = @"00:00 PM";
    
    [labelSliderInit sizeToFit];
    [labelSliderEnd sizeToFit];
    
    [labelSliderInit setFont:[UIFont systemFontOfSize:14]];
    [labelSliderEnd setFont:[UIFont systemFontOfSize:14]];
    
    [labelSliderInit setTextColor: BUTTON_TEXT_COLOR];
    [labelSliderEnd setTextColor: BUTTON_TEXT_COLOR];
    
    int y = (self.labelSlider.center.y);

    CGRect frame = labelSliderEnd.frame;
    frame.origin.y = y;
    frame.origin.x = self.labelSlider.frame.origin.x+32;
    labelSliderInit.frame= frame;
    
    frame.origin.x= self.labelSlider.frame.origin.x + self.labelSlider.bounds.size.width-36;
    labelSliderEnd.frame= frame;
    
    
    [self.view addSubview:labelSliderInit];
    [self.view addSubview:labelSliderEnd];
    
}

// Handle control value changed events just like a normal slider
- (IBAction)labelSliderChanged:(NMRangeSlider*)sender
{
    [self updateSliderLabels];
}

- (void) updateSliderLabels
{
    labelSliderInit.text = [self getFormatedHour:(int)self.labelSlider.lowerValue];
    labelSliderEnd.text = [self getFormatedHour:(int)self.labelSlider.upperValue];
}

-(NSString*) getFormatedHour: (int) minutes{
    
    return [NSString stringWithFormat:@" %02d:%02d %@", (minutes%720)/60, (minutes%720)%60, minutes < 720 ? @"AM" : @"PM"];
}

-(void)initializeSlider{
    
    CGRect minuteSliderFrame = CGRectMake(30, 100, 310, 310);
    minuteSlider = [[EFCircularSlider alloc] initWithFrame:minuteSliderFrame];
    minuteSlider.unfilledColor = BUTTON_BACK_COLOR;
    minuteSlider.filledColor = BUTTON_SELECTED_BACK_COLOR;
    //[minuteSlider setInnerMarkingLabels:@[@"5", @"10", @"15", @"20", @"25", @"30", @"35", @"40", @"45", @"50", @"55", @"60"]];
    minuteSlider.labelFont = [UIFont systemFontOfSize:14.0f];
    minuteSlider.lineWidth = 2;
    minuteSlider.minimumValue = 0;
    minuteSlider.maximumValue = 60;
    minuteSlider.labelColor = [UIColor colorWithRed:76/255.0f green:111/255.0f blue:137/255.0f alpha:1.0f];
    minuteSlider.handleType = CircularSliderHandleTypeBigCircle;
    minuteSlider.handleColor = minuteSlider.filledColor;
    [self.view addSubview:minuteSlider];
    [minuteSlider addTarget:self action:@selector(minuteDidChange:) forControlEvents:UIControlEventValueChanged];
    
    //hourSlider.snapToLabels = NO;
    //hourSlider.handleType = CircularSliderHandleTypeBigCircle;
    
}

-(void)minuteDidChange:(EFCircularSlider*)slider {
    int newVal = (int)slider.currentValue < 60 ? (int)slider.currentValue : 0;
    NSString* oldTime = _timeLabel.text;
    NSRange colonRange = [oldTime rangeOfString:@":"];
    _timeLabel.text = [NSString stringWithFormat:@"%@:%02d", [oldTime substringToIndex:colonRange.location], newVal];
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