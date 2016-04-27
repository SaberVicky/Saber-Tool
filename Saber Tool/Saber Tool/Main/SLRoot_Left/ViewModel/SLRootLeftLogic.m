//
//  SLRootLeftLogic.m
//  Saber Tool
//
//  Created by songlong on 16/4/26.
//  Copyright © 2016年 songlong. All rights reserved.
//

#import "SLRootLeftLogic.h"

@implementation SLRootLeftLogic

- (instancetype)init {
    if (self = [super init]) {
        [self initToolArray];
        _isOpen = NO;
        _isAnimating = NO;
    }
    return self;
}

- (void)initToolArray {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"tool.plist" ofType:nil];
    NSArray *toolArray = [[NSArray alloc] initWithContentsOfFile:path];
    _toolArray = toolArray;
}

@end
