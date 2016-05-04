//
//  SLButtonListView.m
//  Saber Tool
//
//  Created by songlong on 16/4/25.
//  Copyright © 2016年 songlong. All rights reserved.
//

#import "SLButtonListView.h"

@implementation SLButtonListView

- (instancetype)initWithFrame:(CGRect)frame andTitleArray:(NSArray *)titleArray {
   
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [[UIColor alloc] initWithRed:66 / 255.0 green:166 / 255.0 blue:212 / 255.0 alpha:1];
        
        CGFloat width = frame.size.width;
        CGFloat height = frame.size.height / titleArray.count;
        
        for (int i = 0; i < titleArray.count; i++) {
            UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, i * height, width, height)];
            button.tag = i;
            [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
            [button setTitle:titleArray[i] forState:UIControlStateNormal];
            [self addSubview:button];
        }
    }
    return self;
}

- (void)clickButton:(UIButton *)sender {
    self.clickBlock(sender.tag);
    CGRect frame = self.frame;
    [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.frame = CGRectMake(frame.origin.x, frame.origin.y - 100, frame.size.width, frame.size.height);
    } completion:^(BOOL finished) {
        
    }];
}

@end
