//
//  SLNoteCell.m
//  Saber Tool
//
//  Created by songlong on 16/4/30.
//  Copyright © 2016年 songlong. All rights reserved.
//

#import "SLNoteCell.h"

@interface SLNoteCell()

@property (nonatomic, strong) UILabel *dateLabel;
@property (nonatomic, strong) UILabel *balanceLabel;
@property (nonatomic, strong) UILabel *amountLabel;
@property (nonatomic, strong) UILabel *categoryLabel;

@end

@implementation SLNoteCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _categoryLabel = [[UILabel alloc] initWithFrame:CGRectZero textColor:kBlackColor font:kFontSize(14)];
        _categoryLabel.text = @"购物";
        [self.contentView addSubview:_categoryLabel];
        [_categoryLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.mas_equalTo(kMarginToScreenEdge);
        }];
        
        _dateLabel = [[UILabel alloc] initWithFrame:CGRectZero textColor:kBlackColor font:kFontSize(14)];
        _dateLabel.text = @"2016-04-15";
        [self.contentView addSubview:_dateLabel];
        [_dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(kMarginToScreenEdge);
            make.right.mas_equalTo(-kMarginToScreenEdge);
        }];

        _balanceLabel = [[UILabel alloc] initWithFrame:CGRectZero textColor:kBlackColor font:kFontSize(14)];
        _balanceLabel.text = @"10000.00";
        [self.contentView addSubview:_balanceLabel];
        [_balanceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(kMarginToScreenEdge);
            make.bottom.mas_equalTo(-kMarginToScreenEdge);
        }];
        
        _amountLabel = [[UILabel alloc] initWithFrame:CGRectZero textColor:kBlackColor font:kFontSize(14)];
        _amountLabel.text = @"-100.00";
        [self.contentView addSubview:_amountLabel];
        [_amountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.bottom.mas_equalTo(-kMarginToScreenEdge);
        }];

    }

    return self;
}

@end
