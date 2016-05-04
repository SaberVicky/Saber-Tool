//
//  SLJokeViewController.m
//  Saber Tool
//
//  Created by songlong on 16/4/29.
//  Copyright © 2016年 songlong. All rights reserved.
//

#import "SLJokeViewController.h"
#import "SLJokeLogic.h"
#import "SLTextJokeCell.h"
#import "SLPicJokeCell.h"
#import "SLJoke.h"

@interface SLJokeViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *textJokeTableView;
@property (nonatomic, strong) UITableView *picJokeTableView;

@property (nonatomic, strong) SLJokeLogic *textJokeLogic;
@property (nonatomic, strong) SLJokeLogic *picJokeLogic;

@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation SLJokeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _textJokeLogic = [[SLJokeLogic alloc] init];
    _picJokeLogic = [[SLJokeLogic alloc] init];
    [self setupUI];
    [self loadData];
}


#pragma mark --- Private Method

- (void)setupUI {
    
    kWS(weakSelf);
    
    NSArray *segmentedData = @[@"文字笑话", @"图片笑话"];
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:segmentedData];
    segmentedControl.frame = CGRectMake(0, 0, 50, 30);
    [segmentedControl setSelectedSegmentIndex:0];
    [segmentedControl addTarget:self action:@selector(clickSegmentedControl:) forControlEvents:UIControlEventValueChanged];
    self.navigationItem.titleView = segmentedControl;
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:_scrollView];
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectZero];
    [_scrollView addSubview:contentView];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
        make.height.mas_equalTo(kScreen_Height - 64);
    }];
    
    _textJokeTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    _textJokeTableView.delegate = self;
    _textJokeTableView.dataSource = self;
    _textJokeTableView.rowHeight = UITableViewAutomaticDimension;
    _textJokeTableView.estimatedRowHeight = 80;
    [contentView addSubview:_textJokeTableView];
    [_textJokeTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.mas_equalTo(0);
        make.width.mas_equalTo(kScreen_Width);
    }];
    
    _picJokeTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    _picJokeTableView.delegate = self;
    _picJokeTableView.dataSource = self;
    _picJokeTableView.rowHeight = UITableViewAutomaticDimension;
    _picJokeTableView.estimatedRowHeight = 80;
    [contentView addSubview:_picJokeTableView];
    [_picJokeTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.bottom.mas_equalTo(0);
        make.width.mas_equalTo(kScreen_Width);
        make.left.equalTo(weakSelf.textJokeTableView.mas_right);
    }];
}

- (void)loadData {
    
    kWS(weakSelf);
    
    [_textJokeLogic requestGetTextJokesWihtBlock:^(id data, NSError *error) {

        if (!error) {
            [weakSelf.textJokeTableView reloadData];
        }
    }];
    
    [_picJokeLogic requestGetPicJokesWihtBlock:^(id data, NSError *error) {
        
        if (!error) {
            [weakSelf.picJokeTableView reloadData];
        }
    }];
}

#pragma mark --- Action Method

- (void)clickSegmentedControl:(UISegmentedControl *)seg {
    NSInteger index = seg.selectedSegmentIndex;
    [_scrollView scrollRectToVisible:CGRectMake(kScreen_Width * index, 0, kScreen_Width, kScreen_Height) animated:YES];
    
}

#pragma mark --- UITableView Delegate / DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == _textJokeTableView) {
        return _textJokeLogic.jokeArray.count;
    } else {
        return _picJokeLogic.jokeArray.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (tableView == _textJokeTableView) {
        SLTextJokeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"textJokeCell"];
        if (!cell) {
            cell = [[SLTextJokeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier: @"textJokeCell"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
        [cell setupUIWithModel:_textJokeLogic.jokeArray[indexPath.row]];
        
        return cell;
    } else {
        SLPicJokeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"picJokeCell"];
        if (!cell) {
            cell = [[SLPicJokeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier: @"picJokeCell"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
         [cell setupUIWithModel:_picJokeLogic.jokeArray[indexPath.row]];
        
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

@end
