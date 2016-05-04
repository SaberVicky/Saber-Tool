//
//  SLMonthBill.h
//  Saber Tool
//
//  Created by songlong on 16/4/30.
//  Copyright © 2016年 songlong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SLMonthBill : UIView

@property (nonatomic, strong) UILabel *balanceLabel;

@property (nonatomic, copy) void (^addBlock)();

@end
