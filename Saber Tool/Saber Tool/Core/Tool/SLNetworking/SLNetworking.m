//
//  SLNeworking.m
//  Saber Tool
//
//  Created by songlong on 16/4/25.
//  Copyright © 2016年 songlong. All rights reserved.
//

#import "SLNetworking.h"

@implementation SLNetworking

+ (SLNetworking *)shareInstance {
    static id sharedInstance=nil;
    
    static  dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance=[[self alloc] initWithBaseURL:[NSURL URLWithString:@""]];
    });
    
    return sharedInstance;
}

- (instancetype)initWithBaseURL:(NSURL *)url {
    self=[super initWithBaseURL:url];
    if(self)
    {
        self.responseSerializer=[AFJSONResponseSerializer serializer];
        self.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json", @"text/plain",@"text/html", @"text/javascript", @"text/json", @"application/x-www-form-urlencoded; charset=utf-8",nil];
        [self.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    }
    
    return self;
}

- (void)requestWithMethod:(Networkmethod)method path:(NSString *)path withParams:(NSDictionary *)params andBlock:(void(^)(id data,NSError *error))block {
    if (method == Get) {
        [self GET:path parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if (responseObject) {
                block(responseObject, nil);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (error) {
                block(nil, error);
            }
        }];
    } else {
        [self POST:path parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if (responseObject) {
                block(responseObject, nil);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (error) {
                block(nil, error);
            }
        }];
    }
}




@end
