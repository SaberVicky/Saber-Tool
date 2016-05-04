//
//  SLJoke.h
//  Saber Tool
//
//  Created by songlong on 16/4/29.
//  Copyright © 2016年 songlong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SLJoke : NSObject

@property (nonatomic, copy) NSString *pic;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *addtime;
@property (nonatomic, copy) NSString *url;

- (instancetype)initWithDict:(NSDictionary *)dict;

+ (instancetype)jokeWithDict:(NSDictionary *)dict;

@end
