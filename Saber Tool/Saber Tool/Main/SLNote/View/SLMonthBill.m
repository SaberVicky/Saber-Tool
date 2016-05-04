//
//  SLMonthBill.m
//  Saber Tool
//
//  Created by songlong on 16/4/30.
//  Copyright © 2016年 songlong. All rights reserved.
//

#import "SLMonthBill.h"

@interface SLMonthBill()

@property (nonatomic, strong) UILabel *balanceLabel;

@property (nonatomic, strong) UIButton *addButton;

@end

@implementation SLMonthBill

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        kWS(weakSelf);
        
        self.backgroundColor = [UIColor lightGrayColor];
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectZero textColor:kBlackColor font:kFontSize(18)];
        titleLabel.text = @"财富状况";
        [self addSubview:titleLabel];
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(kMarginToScreenEdge);
            make.centerX.mas_equalTo(0);
        }];
        
        UILabel *typeLabel = [[UILabel alloc] initWithFrame:CGRectZero textColor:kBlackColor font:kFontSize(18)];
        typeLabel.text = @"余额";
        [self addSubview:typeLabel];
        [typeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(titleLabel.mas_bottom).offset(kMarginToScreenEdge);
            make.left.mas_equalTo(kMarginToScreenEdge);
        }];
        
        _balanceLabel = [[UILabel alloc] initWithFrame:CGRectZero textColor:kBlackColor font:kFontSize(20)];
        _balanceLabel.text = @"10000.00元";
        [self addSubview:_balanceLabel];
        [_balanceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(titleLabel.mas_bottom).offset(kMarginToScreenEdge);
            make.left.equalTo(typeLabel.mas_right).offset(kMarginToScreenEdge);
        }];
        
        _addButton = [[UIButton alloc] initWithFrame:CGRectZero];
        UIImage *image = [UIImage imageNamed:@"note_add"];
        CGFloat width = kScreen_Width / 4;
        CGFloat height = image.size.height / image.size.width * width;
        [_addButton addTarget:self action:@selector(clcikButton) forControlEvents:UIControlEventTouchUpInside];
        [_addButton setBackgroundImage:image forState:UIControlStateNormal];
        [self addSubview:_addButton];
        [_addButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weakSelf.balanceLabel.mas_bottom).offset(kMarginToScreenEdge);
            make.centerX.mas_equalTo(0);
            make.width.mas_equalTo(width);
            make.height.mas_equalTo(height);
        }];
        
        UILabel *recentLabel = [[UILabel alloc] initWithFrame:CGRectZero textColor:kBlackColor font:kFontSize(20)];
        recentLabel.textAlignment = NSTextAlignmentCenter;
        recentLabel.backgroundColor = kWhiteColor;
        recentLabel.text = @"近期收支记录";
        [self addSubview:recentLabel];
        [recentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(0);
            make.centerX.mas_equalTo(0);
            make.left.right.mas_equalTo(0);
        }];
    }
    return self;
}

- (void)clcikButton {
    self.addBlock();
}

@end
