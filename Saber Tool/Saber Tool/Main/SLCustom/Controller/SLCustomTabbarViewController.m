//
//  SLCustomTabbarViewController.m
//  Saber Tool
//
//  Created by songlong on 16/4/25.
//  Copyright © 2016年 songlong. All rights reserved.
//

#import "SLCustomTabbarViewController.h"
#import "SLNavigationViewController.h"
#import "SLRootLeftViewController.h"
#import "SLRootMiddleViewController.h"
#import "SLRootRightViewController.h"


@interface SLCustomTabbarViewController ()

@end

@implementation SLCustomTabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tabBar.translucent = NO;
    
    SLRootLeftViewController * homeVC =[[SLRootLeftViewController alloc]init];
    [self addChildVc:homeVC title:@"首页" image:@"wash_press_icon" selectedImage:@"wash_default_icon"];
    
    SLRootMiddleViewController * orderVC= [[SLRootMiddleViewController alloc]init];
    [self addChildVc:orderVC title:@"订单" image:@"order_press_icon" selectedImage:@"order_default_icon"];
    
    SLRootRightViewController * mineVC = [[SLRootRightViewController alloc]init];
    [self addChildVc:mineVC title:@"我的" image:@"my_press_icon" selectedImage:@"my_default_icon"];
}

- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage{
    
    childVc.tabBarItem.title = title; // 同时设置tabbar和navigationBar的文字
    //    childVc.tabBarItem.title = title; // 设置tabbar的文字
    //    childVc.navigationItem.title = title; // 设置navigationBar的文字
    
    // 设置子控制器的图片
    childVc.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 设置文字的样式
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:11];
    NSMutableDictionary *selectTextAttrs = [NSMutableDictionary dictionary];
    selectTextAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [childVc.tabBarItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];
    
    // 先给外面传进来的小控制器 包装 一个导航控制器
    SLNavigationViewController *nav = [[SLNavigationViewController alloc] initWithRootViewController:childVc];
    // 添加为子控制器
    [nav.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, -2)];
    
    [self addChildViewController:nav];
    
}

@end
