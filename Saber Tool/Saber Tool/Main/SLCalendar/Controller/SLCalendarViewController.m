//
//  SLCalendarViewController.m
//  Saber Tool
//
//  Created by songlong on 16/4/27.
//  Copyright © 2016年 songlong. All rights reserved.
//

#import "SLCalendarViewController.h"
#import "SLCalendarLogic.h"
#import "SLCalendarDetailViewController.h"

@interface SLCalendarViewController ()<PDTSimpleCalendarViewDelegate>

@property (nonatomic, strong) SLCalendarLogic *calendarLogic;

@end

@implementation SLCalendarViewController

- (instancetype)init {
    if (self = [super init]) {
        _calendarLogic = [[SLCalendarLogic alloc] init];
        self.weekdayHeaderEnabled = YES;
        self.firstDate = [self dateFromString:@"2011-01-01 00:00:00"];
        self.lastDate = [self dateFromString:@"2021-01-01 00:00:00"];
        self.selectedDate = [NSDate date];
        [self scrollToSelectedDate:NO];
        self.delegate = self;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"万年历";
}



- (void)simpleCalendarViewController:(PDTSimpleCalendarViewController *)controller didSelectDate:(NSDate *)date {
    kWS(weakSelf);
    [SLLoadingView showInView:self.view];
    [_calendarLogic requestDateInfoWithParams:@{@"appkey": kAppKey_jiSu, @"date": [self stringFromDate:date]} andBlock:^(id data, NSError *error) {
        [SLLoadingView hideFromView:weakSelf.view];
        if (!error) {
            SLCalendarDetailViewController *vc = [[SLCalendarDetailViewController alloc] init];
            [weakSelf.navigationController pushViewController:vc animated:YES];
        }
    }];
}

- (NSString *)stringFromDate:(NSDate *)date{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss zzz"];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *destDateString = [dateFormatter stringFromDate:date];
    return destDateString;
}

- (NSDate *)dateFromString:(NSString *)dateString{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat: @"yyyy-MM-dd HH:mm:ss"];
    NSDate *destDate= [dateFormatter dateFromString:dateString];
    return destDate;
}

@end
