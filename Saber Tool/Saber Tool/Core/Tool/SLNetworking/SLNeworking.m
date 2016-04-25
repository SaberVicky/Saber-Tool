//
//  SLNeworking.m
//  Saber Tool
//
//  Created by songlong on 16/4/25.
//  Copyright © 2016年 songlong. All rights reserved.
//

#import "SLNeworking.h"

@implementation SLNeworking

+ (SLNeworking *)shareInstance {
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


- (void)requestWithMethod:(Networkmethod)method path:(NSString *)path withParams:(NSDictionary *)params success:(successBlock)success error:(errorBlock)error {
    
    void (^successB)() = ^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    };
    
    void (^errorB)() = ^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull err) {
        if (error) {
            error(err);
        }
    };
    
    if (method == Get) {
        [self GET:path parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:successB failure:errorB];
    } else {
        [self POST:path parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:successB failure:errorB];
    }
}

@end
