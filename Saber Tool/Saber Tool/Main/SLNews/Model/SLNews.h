//
//  SLNews.h
//  Saber Tool
//
//  Created by songlong on 16/4/26.
//  Copyright © 2016年 songlong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SLNews : NSObject

@property (nonatomic, copy) NSString *category;
@property (nonatomic, copy) NSString *htmlContent;
@property (nonatomic, copy) NSString *picUrlString;
@property (nonatomic, copy) NSString *source;
@property (nonatomic, copy) NSString *time;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *newsUrlString;
@property (nonatomic, copy) NSString *webUrlString;

@end
