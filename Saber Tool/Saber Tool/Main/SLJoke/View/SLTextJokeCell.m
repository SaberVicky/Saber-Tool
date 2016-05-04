//
//  SLTextJokeCell.m
//  Saber Tool
//
//  Created by songlong on 16/4/29.
//  Copyright © 2016年 songlong. All rights reserved.
//

#import "SLTextJokeCell.h"
#import "SLJoke.h"

@interface SLTextJokeCell()

@property (nonatomic, strong) UILabel *detailLabel;
@property (nonatomic, strong) UILabel *timeLabel;


@end

@implementation SLTextJokeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        kWS(weakSelf);
        
        _detailLabel = [[UILabel alloc] initWithFrame:CGRectZero textColor:kBlackColor font:kFontSize(14)];
        _detailLabel.numberOfLines = 0;
        _detailLabel.preferredMaxLayoutWidth = kScreen_Width - 40;
        [self.contentView addSubview:_detailLabel];
        [_detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(20);
            make.top.mas_equalTo(10);
        }];
        
        _timeLabel = [[UILabel alloc] initWithFrame:CGRectZero textColor:kBlackColor font:kFontSize(14)];
        _timeLabel.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:_timeLabel];
        [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-20);
            make.top.equalTo(weakSelf.detailLabel.mas_bottom).offset(20);
            make.bottom.mas_equalTo(-20);
        }];
    }
    return self;
}

- (void)setupUIWithModel:(SLJoke *)joke {
    NSString *str = joke.content;
    str = [str stringByReplacingOccurrencesOfString:@" " withString:@""];
    str = [str stringByReplacingOccurrencesOfString:@"<br/>" withString:@""];
    str = [str stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    str = [str stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    _detailLabel.text = str;
    _timeLabel.text = joke.addtime;

}

@end
