//
//  SLNeworking.h
//  Saber Tool
//
//  Created by songlong on 16/4/25.
//  Copyright © 2016年 songlong. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import "AFNetworking.h"

typedef enum {
    Get = 0,
    Post
}Networkmethod;



@interface SLNetworking : AFHTTPSessionManager

+ (SLNetworking *)shareInstance;

- (void)requestWithMethod:(Networkmethod)method path:(NSString *)path withParams:(NSDictionary *)params andBlock:(void(^)(id data,NSError *error))block;

@end
