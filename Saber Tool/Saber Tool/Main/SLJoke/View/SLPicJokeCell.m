//
//  SLPicJokeCell.m
//  Saber Tool
//
//  Created by songlong on 16/4/29.
//  Copyright © 2016年 songlong. All rights reserved.
//

#import "SLPicJokeCell.h"
#import "SLJoke.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface SLPicJokeCell()

@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UILabel *detailLabel;

@end

@implementation SLPicJokeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _iconView = [[UIImageView alloc] initWithFrame:CGRectZero];
        [self.contentView addSubview:_iconView];
        [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(kMarginToScreenEdge);
            make.centerX.mas_equalTo(0);
            make.width.height.mas_equalTo(kScreen_Width - 2 * kMarginToScreenEdge);
            make.bottom.mas_equalTo(-kMarginToScreenEdge);
        }];
    }
    return self;
}

- (void)setupUIWithModel:(SLJoke *)joke {
    [_iconView sd_setImageWithURL:[NSURL URLWithString:joke.pic]];
}

@end
