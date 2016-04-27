//
//  SLCalendarDetailViewController.m
//  Saber Tool
//
//  Created by songlong on 16/4/27.
//  Copyright © 2016年 songlong. All rights reserved.
//

#import "SLCalendarDetailViewController.h"
#import "UMSocial.h"
#import "WXApi.h"

@interface SLCalendarDetailViewController ()<UMSocialUIDelegate>

@end

@implementation SLCalendarDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)setupUI {
    
//    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
//    [button addTarget:self action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];
//    button.backgroundColor = [UIColor redColor];
//    [self.view addSubview:button];
    
//    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectZero];
//    scrollView.backgroundColor = kBlackColor;
//    [self.view addSubview:scrollView];
//    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.mas_equalTo(0);
//    }];
//    
//    UIView *contentView = [[UIView alloc] initWithFrame:CGRectZero];
//    contentView.backgroundColor = [UIColor orangeColor];
//    [scrollView addSubview:contentView];
//    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.mas_equalTo(0);
//        make.width.mas_equalTo(kScreen_Width);
//    }];
//    
//    UIView *view1 = [[UIView alloc] initWithFrame:CGRectZero];
//    view1.backgroundColor = [UIColor blueColor];
//    [scrollView addSubview:view1];
//    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.left.right.mas_equalTo(0);
//        make.height.mas_equalTo(500);
//
//    }];
//    
//    UIView *view2 = [[UIView alloc] initWithFrame:CGRectZero];
//    view2.backgroundColor = [UIColor redColor];
//    [scrollView addSubview:view2];
//    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.bottom.mas_equalTo(0);
//        make.height.mas_equalTo(500);
//        make.top.equalTo(view1.mas_bottom);

//    }];
}



@end
