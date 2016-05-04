//
//  SLJokeLogic.h
//  Saber Tool
//
//  Created by songlong on 16/4/29.
//  Copyright © 2016年 songlong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SLJokeLogic : NSObject

@property (nonatomic, strong) NSArray *jokeArray;

- (void)requestGetTextJokesWihtBlock:(void(^)(id data, NSError *error))block;

- (void)requestGetPicJokesWihtBlock:(void(^)(id data, NSError *error))block;

@end
