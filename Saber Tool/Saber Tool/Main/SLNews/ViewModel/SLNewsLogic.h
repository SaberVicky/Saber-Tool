//
//  SLNewsLogic.h
//  Saber Tool
//
//  Created by songlong on 16/4/26.
//  Copyright © 2016年 songlong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SLNewsLogic : NSObject

@property (nonatomic, strong) NSArray *newsArray;

- (void)requestNewsListWithParams:(NSDictionary *)params andBlock:(void(^)(id data, NSError *error))block;

@end
