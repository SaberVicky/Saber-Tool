//
//  SLNewsCell.m
//  Saber Tool
//
//  Created by songlong on 16/4/26.
//  Copyright © 2016年 songlong. All rights reserved.
//

#import "SLNewsCell.h"
#import "SLNews.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface SLNewsCell()

@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *sourceLabel;
@property (nonatomic, strong) UILabel *timeLabel;

@end

@implementation SLNewsCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        kWS(weakSelf);
        
        _iconView = [[UIImageView alloc] initWithFrame:CGRectZero];
        [self.contentView addSubview:_iconView];
        [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.height.mas_equalTo(50);
            make.left.mas_equalTo(kMarginToScreenEdge);
            make.top.mas_equalTo(kMarginToScreenEdge);
//            make.bottom.mas_equalTo(-kMarginToScreenEdge).priority(999);
        }];
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero textColor:kBlackColor font:kFontSize(14)];
        [self.contentView addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weakSelf.iconView.mas_top);
            make.left.equalTo(weakSelf.iconView.mas_right).offset(kMarginToScreenEdge);
        }];
        
        _sourceLabel = [[UILabel alloc] initWithFrame:CGRectZero textColor:kBlackColor font:kFontSize(14)];
        [self.contentView addSubview:_sourceLabel];
        [_sourceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(weakSelf.iconView.mas_bottom);
            make.left.equalTo(weakSelf.iconView.mas_right).offset(kMarginToScreenEdge);
        }];
        
        _timeLabel = [[UILabel alloc] initWithFrame:CGRectZero textColor:kBlackColor font:kFontSize(14)];
        _timeLabel.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:_timeLabel];
        [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(weakSelf.iconView.mas_bottom);
            make.right.mas_equalTo(-kMarginToScreenEdge);
        }];

    }
    return self;
}

- (void)setupUIWithModel:(SLNews *)news {
    [_iconView sd_setImageWithURL:[NSURL URLWithString:news.picUrlString]];
    _titleLabel.text = news.title;
    _sourceLabel.text = news.source;
    _timeLabel.text = news.time;
}

@end
