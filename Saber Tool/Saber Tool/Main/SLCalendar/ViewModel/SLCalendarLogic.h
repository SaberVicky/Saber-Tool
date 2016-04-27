//
//  SLCalendarLogic.h
//  Saber Tool
//
//  Created by songlong on 16/4/27.
//  Copyright © 2016年 songlong. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SLCalendar;

@interface SLCalendarLogic : NSObject

@property (nonatomic, strong) SLCalendar *calendar;

- (void)requestDateInfoWithParams:(NSDictionary *)params andBlock:(void(^)(id data, NSError *error))block;

@end
