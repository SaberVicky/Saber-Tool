//
//  SLLoadingView.m
//  Saber Tool
//
//  Created by songlong on 16/4/25.
//  Copyright © 2016年 songlong. All rights reserved.
//

#import "SLLoadingView.h"
#import <objc/runtime.h>

@implementation SLLoadingView

+ (void)showInView:(UIView *)view tips:(NSString *)tips {
    SLLoadingView *loadView = [self showInView:view];
    loadView.eTipsString = tips;
}

+ (SLLoadingView*)showInView:(UIView *)view {
    
    SLLoadingView *loadView = [[SLLoadingView alloc] initWithView:view];
    [view addSubview:loadView];
    objc_setAssociatedObject(view, "associatedLoadingView", loadView, OBJC_ASSOCIATION_RETAIN);
    return loadView;
}

+ (void)hideFromView:(UIView *)view {
    SLLoadingView *loadView = objc_getAssociatedObject(view, "associatedLoadingView");
    [loadView removeFromSuperview];
}

- (instancetype)initWithView:(UIView *)view {
    if (self = [super initWithFrame:view.bounds]) {
        self.backgroundColor = [UIColor clearColor];
        
        self.eTipsString=@"加载中...";
        
        UIView  *contentView=[[UIView alloc] initWithFrame:CGRectZero];
        contentView.backgroundColor=[UIColor clearColor];
        [self addSubview:contentView];
        [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.mas_equalTo(0);
        }];
        
        
        
        UIView *grayView=[[UIView alloc] initWithFrame:CGRectZero];
        grayView.layer.cornerRadius=6.0;
        grayView.backgroundColor=[UIColor blackColor];
        grayView.alpha=0.8;
        [contentView addSubview:grayView];
        [grayView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
            make.width.equalTo(grayView.mas_height);
        }];
        
        UIView *tempView=[[UIView alloc] initWithFrame:CGRectZero];
        tempView.backgroundColor=[UIColor clearColor];
        [contentView addSubview:tempView];
        [tempView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(10, 10, 10, 10));
        }];
        
        
        
        
        
        
        UIImageView *imageView=[[UIImageView alloc] initWithFrame:CGRectZero];
        imageView.image=[UIImage imageNamed:@"loading_1"];
        [tempView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.centerX.mas_equalTo(0);
        }];
        
        
        
        _eTipsLabel=[[UILabel alloc] initWithFrame:CGRectZero textColor:[UIColor whiteColor] font:[UIFont systemFontOfSize:13]];
        [tempView addSubview:_eTipsLabel];
        [_eTipsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.bottom.mas_equalTo(0);
            make.top.equalTo(imageView.mas_bottom).offset(10.0);
        }];
        
        
        
        
        imageView.animationImages=@[[UIImage imageNamed:@"loading_1"],[UIImage imageNamed:@"loading_2"],[UIImage imageNamed:@"loading_3"],[UIImage imageNamed:@"loading_4"],[UIImage imageNamed:@"loading_5"],[UIImage imageNamed:@"loading_6"]];
        imageView.animationDuration=1.0;
        imageView.animationRepeatCount=0;
        [imageView startAnimating];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.eTipsLabel.text=_eTipsString;
}

@end
