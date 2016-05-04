//
//  SLDateLabel.m
//  Saber Tool
//
//  Created by songlong on 16/4/30.
//  Copyright © 2016年 songlong. All rights reserved.
//

#import "SLDateLabel.h"

@implementation SLDateLabel

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.textAlignment = NSTextAlignmentCenter;
        NSDate *date = [NSDate date];
        NSString *dateStr = [NSDate stringFromDate:date];
        self.text = [NSString stringWithFormat:@"当前日期 : %@", dateStr];
    }
    return self;
}

@end
