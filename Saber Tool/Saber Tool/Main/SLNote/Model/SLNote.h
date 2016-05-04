//
//  SLNote.h
//  Saber Tool
//
//  Created by songlong on 16/5/4.
//  Copyright © 2016年 songlong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SLNote : NSObject

@property (nonatomic, copy) NSString *date;
@property (nonatomic, copy) NSString *category;
@property (nonatomic, copy) NSString *amount;
@property (nonatomic, copy) NSString *balance;

- (instancetype)initWithDict:(NSDictionary *)dict;

+ (instancetype)noteWithDict:(NSDictionary *)dict;

@end
