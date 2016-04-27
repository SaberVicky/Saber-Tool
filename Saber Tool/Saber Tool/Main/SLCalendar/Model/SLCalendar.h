//
//  SLCalendar.h
//  Saber Tool
//
//  Created by songlong on 16/4/27.
//  Copyright © 2016年 songlong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SLCalendar : NSObject

@property (nonatomic, copy) NSString *year;
@property (nonatomic, copy) NSString *month;
@property (nonatomic, copy) NSString *day;

@property (nonatomic, copy) NSString *lunaryear;
@property (nonatomic, copy) NSString *lunarmonth;
@property (nonatomic, copy) NSString *lunarday;

@property (nonatomic, copy) NSString *week;
@property (nonatomic, copy) NSString *star;
@property (nonatomic, copy) NSString *shengxiao;
@property (nonatomic, copy) NSString *ganzhi;

@property (nonatomic, strong) NSDictionary *huangli;

- (instancetype)initWithDict:(NSDictionary *)dict;

+ (instancetype)calendarWithDict:(NSDictionary *)dict;

@end
