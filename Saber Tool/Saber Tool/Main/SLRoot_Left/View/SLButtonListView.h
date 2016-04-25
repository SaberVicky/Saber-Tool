//
//  SLButtonListView.h
//  Saber Tool
//
//  Created by songlong on 16/4/25.
//  Copyright © 2016年 songlong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SLButtonListView : UIView

@property (nonatomic, copy) void(^clickBlock)(NSInteger index);

- (instancetype)initWithFrame:(CGRect)frame andTitleArray:(NSArray *)titleArray;

@end
