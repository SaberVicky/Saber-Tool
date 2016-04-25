//
//  SLNavigationViewController.m
//  Saber Tool
//
//  Created by songlong on 16/4/25.
//  Copyright © 2016年 songlong. All rights reserved.
//

#import "SLNavigationViewController.h"

@interface SLNavigationViewController ()

@end

@implementation SLNavigationViewController

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if ([self.viewControllers count]>0) {
        viewController.hidesBottomBarWhenPushed  =YES;
    }
    
    [super pushViewController:viewController animated:animated];
}

@end
