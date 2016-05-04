//
//  SLNoteViewController.m
//  Saber Tool
//
//  Created by songlong on 16/4/25.
//  Copyright © 2016年 songlong. All rights reserved.
//

#import "SLNoteViewController.h"
#import "SLMonthBill.h"
#import "SLNoteCell.h"

@interface SLNoteViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *noteArray;

@end

@implementation SLNoteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

#pragma mark --- Private Method

- (void)setupUI {
    
    self.title = [NSDate stringFromDate:[NSDate date]];
    self.view.backgroundColor = kWhiteColor;
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
}

- (void)addNote {
    
}

#pragma mark --- UITableViewDelegate / DataSource

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    kWS(weakSelf);
    SLMonthBill *headerView = [[SLMonthBill alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, 250)];
    headerView.addBlock = ^{
        [weakSelf addNote];
    };
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 250;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _noteArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *resuseID = @"noteCell";
    SLNoteCell *cell = [tableView dequeueReusableCellWithIdentifier:resuseID];
    if (!cell) {
        cell = [[SLNoteCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier: resuseID];
        cell.selectionStyle = UITableViewCellSeparatorStyleNone;
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

#pragma mark --- Lazy Loading Method 

- (NSArray *)noteArray {
    if (!_noteArray) {
        _noteArray =[[NSUserDefaults standardUserDefaults] objectForKey:@"kNoteUserDefault"];
    }
    return _noteArray;
}

@end
