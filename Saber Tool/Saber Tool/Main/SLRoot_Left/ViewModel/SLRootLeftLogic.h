//
//  SLRootLeftLogic.h
//  Saber Tool
//
//  Created by songlong on 16/4/26.
//  Copyright © 2016年 songlong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SLRootLeftLogic : NSObject

@property (nonatomic, strong) NSArray *toolArray;

@property (nonatomic, assign) BOOL isAnimating;
@property (nonatomic, assign) BOOL isOpen;
@property (nonatomic, assign) NSInteger currentCollectionType;

@end
