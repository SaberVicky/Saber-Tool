//
//  SLCalendarLogic.m
//  Saber Tool
//
//  Created by songlong on 16/4/27.
//  Copyright © 2016年 songlong. All rights reserved.
//

#import "SLCalendarLogic.h"
#import "SLCalendar.h"

@implementation SLCalendarLogic

- (void)requestDateInfoWithParams:(NSDictionary *)params andBlock:(void(^)(id data, NSError *error))block {
    kWS(weakSelf);
    [[SLNetworking shareInstance] requestWithMethod:Get path:kAPI_JiSu_Calendar withParams:params andBlock:^(id data, NSError *error) {
        if (data) {
            NSDictionary *dataDic = [data objectForKey:@"result"];
            weakSelf.calendar = [SLCalendar calendarWithDict:dataDic];;
        }
        block(data, error);
    }];
}

@end
