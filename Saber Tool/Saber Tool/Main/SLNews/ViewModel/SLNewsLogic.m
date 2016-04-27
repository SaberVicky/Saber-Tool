//
//  SLNewsLogic.m
//  Saber Tool
//
//  Created by songlong on 16/4/26.
//  Copyright © 2016年 songlong. All rights reserved.
//

#import "SLNewsLogic.h"
#import "SLNews.h"

@implementation SLNewsLogic

- (void)requestNewsListWithParams:(NSDictionary *)params andBlock:(void(^)(id data, NSError *error))block {
    kWS(weakSelf);
    [[SLNetworking shareInstance] requestWithMethod:Get path:kAPI_JiSu_News withParams:params andBlock:^(id data, NSError *error) {
        if (data) {
            NSDictionary *dataDic = [data objectForKey:@"result"];
            NSMutableArray *newsArray = [NSMutableArray array];
            for (NSDictionary *dic in [dataDic objectForKey:@"list"]) {
                SLNews *news = [[SLNews alloc] init];
                news.category = [dic objectForKey:@"category"];
                news.htmlContent = [dic objectForKey:@"content"];
                news.picUrlString = [dic objectForKey:@"pic"];
                news.source = [dic objectForKey:@"src"];
                news.time = [dic objectForKey:@"time"];
                news.title = [dic objectForKey:@"title"];
                news.newsUrlString = [dic objectForKey:@"url"];
                news.webUrlString = [dic objectForKey:@"weburl"];
                [newsArray addObject:news];
            }
            weakSelf.newsArray = newsArray;
        }
        
        block(data, error);
    }];
}

@end
