//
//  SLNoteCell.m
//  Saber Tool
//
//  Created by songlong on 16/4/30.
//  Copyright © 2016年 songlong. All rights reserved.
//

#import "SLNoteCell.h"
#import "SLNote.h"

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
        [self.contentView addSubview:_categoryLabel];
        [_categoryLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.mas_equalTo(kMarginToScreenEdge);
        }];
        
        _dateLabel = [[UILabel alloc] initWithFrame:CGRectZero textColor:kBlackColor font:kFontSize(14)];
        [self.contentView addSubview:_dateLabel];
        [_dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(kMarginToScreenEdge);
            make.right.mas_equalTo(-kMarginToScreenEdge);
        }];

        _balanceLabel = [[UILabel alloc] initWithFrame:CGRectZero textColor:kBlackColor font:kFontSize(14)];
        [self.contentView addSubview:_balanceLabel];
        [_balanceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(kMarginToScreenEdge);
            make.bottom.mas_equalTo(-kMarginToScreenEdge);
        }];
        
        _amountLabel = [[UILabel alloc] initWithFrame:CGRectZero textColor:[UIColor redColor] font:kFontSize(15)];
        [self.contentView addSubview:_amountLabel];
        [_amountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.bottom.mas_equalTo(-kMarginToScreenEdge);
        }];

    }

    return self;
}

- (void)setupUIWithModel:(SLNote *)note {
    _categoryLabel.text = note.category;
    _dateLabel.text = note.date;
    _balanceLabel.text = [NSString stringWithFormat:@"余额: %@", note.balance];
    _amountLabel.text = note.amount;
    if ([note.amount integerValue] > 0) {
        _amountLabel.text = [NSString stringWithFormat:@"+%@", note.amount];
    }
}

@end
