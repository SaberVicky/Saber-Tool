//
//  NSDate+Category.h
//  Saber Tool
//
//  Created by songlong on 16/4/28.
//  Copyright © 2016年 songlong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Category)

+ (NSDate *)dateWithYear:(int)year month:(int)month day:(int)day hour:(int)hour minute:(int)minute second:(int)second;

+ (NSString *)stringFromDate:(NSDate *)date;

+ (NSDate *)dateFromString:(NSString *)dateString;

@end
