//
//  NSDate+Category.m
//  Saber Tool
//
//  Created by songlong on 16/4/28.
//  Copyright © 2016年 songlong. All rights reserved.
//

#import "NSDate+Category.h"

@implementation NSDate (Category)

+ (NSDate *)dateWithYear:(int)year month:(int)month day:(int)day hour:(int)hour minute:(int)minute second:(int)second
{
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setYear:year];
    [comps setMonth:month];
    [comps setDay:day];
    [comps setHour:hour];
    [comps setMinute:minute];
    [comps setSecond:second];
    return [[NSCalendar currentCalendar] dateFromComponents:comps];
}

+ (NSString *)stringFromDate:(NSDate *)date {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    //    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss zzz"];
    formatter.dateFormat = @"yyyy-MM-dd";
    return [formatter stringFromDate:date];
}

+ (NSDate *)dateFromString:(NSString *)dateString {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat: @"yyyy-MM-dd HH:mm:ss"];
    NSDate *destDate= [dateFormatter dateFromString:dateString];
    return destDate;
}

@end
