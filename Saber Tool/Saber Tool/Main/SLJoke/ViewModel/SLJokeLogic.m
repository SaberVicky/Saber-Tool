//
//  SLJokeLogic.m
//  Saber Tool
//
//  Created by songlong on 16/4/29.
//  Copyright © 2016年 songlong. All rights reserved.
//

#import "SLJokeLogic.h"
#import "SLJoke.h"

@implementation SLJokeLogic

- (void)requestGetTextJokesWihtBlock:(void(^)(id data, NSError *error))block {
    [[SLNetworking shareInstance] requestWithMethod:Get path:kAPI_JiSu_Joke_Text withParams:@{@"pagenum": @"1", @"pagesize": @"10", @"sort": @"addtime", @"appkey": kAppKey_jiSu} andBlock:^(id data, NSError *error) {
        if (data) {
            NSDictionary *dataDic = [data objectForKey:@"result"];
            NSArray *dataArr = [dataDic objectForKey:@"list"];
            NSMutableArray *jokeArray = [NSMutableArray array];
            for (NSDictionary *dic in dataArr) {
                SLJoke *joke = [SLJoke jokeWithDict:dic];
                [jokeArray addObject:joke];
            }
            _jokeArray = jokeArray;
        }
        block(data, error);
    }];
}

- (void)requestGetPicJokesWihtBlock:(void(^)(id data, NSError *error))block {
    [[SLNetworking shareInstance] requestWithMethod:Get path:kAPI_JiSu_Joke_Pic withParams:@{@"pagenum": @"1", @"pagesize": @"10", @"sort": @"addtime", @"appkey": kAppKey_jiSu} andBlock:^(id data, NSError *error) {
        if (data) {
            NSDictionary *dataDic = [data objectForKey:@"result"];
            NSArray *dataArr = [dataDic objectForKey:@"list"];
            NSMutableArray *jokeArray = [NSMutableArray array];
            for (NSDictionary *dic in dataArr) {
                SLJoke *joke = [SLJoke jokeWithDict:dic];
                [jokeArray addObject:joke];
            }
            _jokeArray = jokeArray;
        }
        block(data, error);
    }];
}

@end
