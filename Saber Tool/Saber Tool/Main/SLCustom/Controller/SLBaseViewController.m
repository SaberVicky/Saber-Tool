//
//  SLBaseViewController.m
//  Saber Tool
//
//  Created by songlong on 16/4/25.
//  Copyright © 2016年 songlong. All rights reserved.
//

#import "SLBaseViewController.h"
#import "GooeySlideMenu.h"
#import "SLSettingViewController.h"

@interface SLBaseViewController ()

@end

@implementation SLBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = kWhiteColor;
    self.automaticallyAdjustsScrollViewInsets=NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
    backItem.title = @"";
    self.navigationItem.backBarButtonItem = backItem;
    
    if ([NSStringFromClass([self class]) isEqualToString:@"SLRootLeftViewController"] || [NSStringFromClass([self class]) isEqualToString:@"SLRootMiddleViewController"] || [NSStringFromClass([self class]) isEqualToString:@"SLRootRightViewController"]) {
        
        UIButton *customLeftButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
        [customLeftButton setImage:[UIImage imageNamed:@"setting_button"] forState:UIControlStateNormal];
        [customLeftButton addTarget:self action:@selector(clickLeftButton) forControlEvents:UIControlEventTouchUpInside];
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:customLeftButton];
    }
}

- (void)clickLeftButton {
    kWS(weakSelf);
    GooeySlideMenu *menu = [[GooeySlideMenu alloc]initWithTitles:@[@"首页",@"发现",@"个人",@"设置"]];
    menu.menuClickBlock = ^(NSInteger index,NSString *title,NSInteger titleCounts){
        [weakSelf performWithIndex:index];
    };
    [menu trigger];
}

- (void)performWithIndex:(NSInteger)index {
    switch (index) {
        case 3:
        {
            SLSettingViewController *vc = [[SLSettingViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        default:
            break;
    }
}

//监测内存溢出
-(void)dealloc
{
    kDebugLog(@"当前控制器: %@ 已被释放",[self class]);
}

@end
