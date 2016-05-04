//
//  SLJoke.m
//  Saber Tool
//
//  Created by songlong on 16/4/29.
//  Copyright © 2016年 songlong. All rights reserved.
//

#import "SLJoke.h"

@implementation SLJoke

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

+ (instancetype)jokeWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

@end
