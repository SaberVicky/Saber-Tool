//
//  SLRootLeftCell.m
//  Saber Tool
//
//  Created by songlong on 16/4/25.
//  Copyright © 2016年 songlong. All rights reserved.
//

#import "SLRootLeftCell.h"

@interface SLRootLeftCell()

@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UILabel *infoLabel;

@end

@implementation SLRootLeftCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    _iconView = [[UIImageView alloc] initWithFrame:CGRectZero];
    [self.contentView addSubview:_iconView];
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    _infoLabel = [[UILabel alloc] initWithFrame:CGRectZero textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:14]];
    [self.contentView addSubview:_infoLabel];
    [_infoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.bottom.mas_equalTo(-10);
    }];
}

- (void)setupUIWithData:(NSDictionary *)dic {
    _iconView.image = [UIImage imageNamed:[dic objectForKey:@"iconName"]];
    _infoLabel.text = [dic objectForKey:@"toolName"];
}


@end
