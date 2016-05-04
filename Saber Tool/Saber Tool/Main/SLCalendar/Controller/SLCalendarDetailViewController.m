//
//  SLCalendarDetailViewController.m
//  Saber Tool
//
//  Created by songlong on 16/4/27.
//  Copyright © 2016年 songlong. All rights reserved.
//

#import "SLCalendarDetailViewController.h"
#import "SLCalendar.h"

@interface SLCalendarDetailViewController ()

@property (nonatomic, strong) SLCalendar *calendar;

@end

@implementation SLCalendarDetailViewController

- (instancetype)initWithModel:(SLCalendar *)calendar {
    if (self = [super init]) {
        _calendar = calendar;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUIWithModel:_calendar];
}

- (void)setupUIWithModel:(SLCalendar *)calendar {
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectZero];
    scrollView.backgroundColor = kBlackColor;
    [self.view addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];

    UIView *contentView = [[UIView alloc] initWithFrame:CGRectZero];
    contentView.backgroundColor = kWhiteColor;
    [scrollView addSubview:contentView];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
        make.width.mas_equalTo(kScreen_Width);
    }];
    
    
}

@end
