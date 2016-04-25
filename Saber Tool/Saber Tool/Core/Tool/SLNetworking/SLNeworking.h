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

typedef void(^successBlock)(id result);
typedef void(^errorBlock)(NSError *error);

@interface SLNeworking : AFHTTPSessionManager

+ (SLNeworking *)shareInstance;

- (void)requestWithMethod:(Networkmethod)method path:(NSString *)path withParams:(NSDictionary *)params success:(successBlock)success error:(errorBlock)error;

@end
