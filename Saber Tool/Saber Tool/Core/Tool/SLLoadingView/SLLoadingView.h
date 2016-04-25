//
//  SLLoadingView.h
//  Saber Tool
//
//  Created by songlong on 16/4/25.
//  Copyright © 2016年 songlong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SLLoadingView : UIView

@property(nonatomic,strong)NSString *eTipsString;

@property(nonatomic,strong)UILabel *eTipsLabel;

+(SLLoadingView*)showInView:(UIView *)view;

+(void)showInView:(UIView *)view tips:(NSString *)tips;

+(void)hideFromView:(UIView *)view;

@end
