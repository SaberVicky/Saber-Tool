//
//  SLCalendar.m
//  Saber Tool
//
//  Created by songlong on 16/4/27.
//  Copyright © 2016年 songlong. All rights reserved.
//

#import "SLCalendar.h"

@implementation SLCalendar

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

+ (instancetype)calendarWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

@end
