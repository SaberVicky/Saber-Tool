//
//  SLNote.m
//  Saber Tool
//
//  Created by songlong on 16/5/4.
//  Copyright © 2016年 songlong. All rights reserved.
//

#import "SLNote.h"

@implementation SLNote

- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

+ (instancetype)noteWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}
@end
