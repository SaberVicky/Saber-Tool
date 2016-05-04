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
#import "SLAddNoteViewController.h"
#import "SLNote.h"

@interface SLNoteViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *noteArray;
@property (nonatomic, strong) NSString *balance;

@end

@implementation SLNoteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

#pragma mark --- Private Method

- (void)setupUI {
    
    self.title = [NSDate stringFromDate:[NSDate date]];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
}

- (void)addNote {
    kWS(weakSelf);
    SLAddNoteViewController *vc = [[SLAddNoteViewController alloc] init];
    vc.addBlock = ^{
        [weakSelf initNoteArray];
        [weakSelf.tableView reloadData];
    };
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark --- UITableViewDelegate / DataSource

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    kWS(weakSelf);
    SLMonthBill *monthBillView = [[SLMonthBill alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, 250)];
    monthBillView.balanceLabel.text = _balance;
    monthBillView.addBlock = ^{
        [weakSelf addNote];
    };
    return monthBillView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 250;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.noteArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *resuseID = @"noteCell";
    SLNoteCell *cell = [tableView dequeueReusableCellWithIdentifier:resuseID];
    if (!cell) {
        cell = [[SLNoteCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier: resuseID];
        cell.selectionStyle = UITableViewCellSeparatorStyleNone;
    }
    
    [cell setupUIWithModel:_noteArray[indexPath.row]];

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

#pragma mark --- Lazy Loading Method 

- (NSArray *)noteArray {
    if (!_noteArray) {
        [self initNoteArray];
    }
    return _noteArray;
}

- (void)initNoteArray {
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [pathArray objectAtIndex:0];
    NSString *filePatch = [path stringByAppendingPathComponent:@"note.plist"];
    NSArray *array = [[NSArray alloc] initWithContentsOfFile:filePatch];
    NSMutableArray *mArr = [NSMutableArray array];
    SLNote *note = [SLNote noteWithDict:array.firstObject];
    _balance = [NSString stringWithFormat:@"%@元", note.balance];
    if (!array.firstObject) {
        _balance = @"0.00元";
    }
    for (NSDictionary *dic in array) {
        SLNote *note = [SLNote noteWithDict:dic];
        [mArr addObject:note];
    }
    _noteArray = mArr;
}

@end
