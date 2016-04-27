//
//  SLWebViewController.m
//  Saber Tool
//
//  Created by songlong on 16/4/26.
//  Copyright © 2016年 songlong. All rights reserved.
//

#import "SLWebViewController.h"

@interface SLWebViewController ()

@property (nonatomic, strong) UIWebView *webView;

@end

@implementation SLWebViewController

- (instancetype)initWithHTMLString:(NSString *)HTMLString {
    if (self = [super init]) {
        _webView = [[UIWebView alloc] initWithFrame:CGRectZero];
        [_webView loadHTMLString:HTMLString baseURL:nil];
        [self.view addSubview:_webView];
        [_webView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    
    return self;
}

@end
