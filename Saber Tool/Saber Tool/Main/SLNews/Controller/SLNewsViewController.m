//
//  SLNewsViewController.m
//  Saber Tool
//
//  Created by songlong on 16/4/26.
//  Copyright © 2016年 songlong. All rights reserved.
//

#import "SLNewsViewController.h"
#import "SLNewsLogic.h"
#import "SLNews.h"
#import "SLNewsCell.h"
#import "SLWebViewController.h"


@interface SLNewsViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) SLNewsLogic *newsLogic;

@end

@implementation SLNewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _newsLogic = [[SLNewsLogic alloc] init];
    [self setupUI];
    [self loadData];
}

#pragma mark --- Private Method

- (void)setupUI {
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
}

- (void)loadData {
    kWS(weakSelf);
    [SLLoadingView showInView:self.view];
    [_newsLogic requestNewsListWithParams:@{@"channel": @"头条", @"num": @"10", @"appkey": kAppKey_jiSu} andBlock:^(id data, NSError *error) {
        [SLLoadingView hideFromView:weakSelf.view];
        if (!error) {
            [weakSelf.tableView reloadData];
        }
    }];
}

#pragma mark --- UITableViewDelegate / DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _newsLogic.newsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *resuseID = @"newsCell";
    SLNewsCell *cell = [tableView dequeueReusableCellWithIdentifier:resuseID];
    if (!cell) {
        cell = [[SLNewsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier: resuseID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    SLNews *news = _newsLogic.newsArray[indexPath.row];
    [cell setupUIWithModel:news];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    SLNews *news = _newsLogic.newsArray[indexPath.row];
    SLWebViewController *vc = [[SLWebViewController alloc] initWithHTMLString:news.htmlContent];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
