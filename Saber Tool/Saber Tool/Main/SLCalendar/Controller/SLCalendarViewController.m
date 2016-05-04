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
        self.firstDate = [NSDate dateFromString:@"2011-01-01 00:00:00"];
        self.lastDate = [NSDate dateFromString:@"2021-01-01 00:00:00"];
        self.selectedDate = [NSDate date];
        [self scrollToSelectedDate:NO];
        self.delegate = self;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"万年历";
}

#pragma mark --- PDTSimpleCalendarViewDelegate

- (void)simpleCalendarViewController:(PDTSimpleCalendarViewController *)controller didSelectDate:(NSDate *)date {
    kWS(weakSelf);
    [SLLoadingView showInView:self.view];
    [_calendarLogic requestDateInfoWithParams:@{@"appkey": kAppKey_jiSu, @"date": [NSDate stringFromDate:date]} andBlock:^(id data, NSError *error) {
        [SLLoadingView hideFromView:weakSelf.view];
        if (!error) {
            SLCalendarDetailViewController *vc = [[SLCalendarDetailViewController alloc] initWithModel:_calendarLogic.calendar];
            [weakSelf.navigationController pushViewController:vc animated:YES];
        }
    }];
}


@end
