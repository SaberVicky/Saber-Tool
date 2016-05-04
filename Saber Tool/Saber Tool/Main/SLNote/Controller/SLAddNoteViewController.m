//
//  SLAddNoteViewController.m
//  Saber Tool
//
//  Created by songlong on 16/5/4.
//  Copyright © 2016年 songlong. All rights reserved.
//

#import "SLAddNoteViewController.h"
#import "SLNote.h"

@interface SLAddNoteViewController ()

@property (nonatomic, strong) UITextView *amountView;
@property (nonatomic, strong) UITextView *categoryView;
@property (nonatomic, strong) UISegmentedControl *segmentedControl;

@end

@implementation SLAddNoteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"新增";
    [self setupUI];
}

- (void)setupUI {
    
    kWS(weakSelf);
    
    NSArray *segmentedData = @[@"支出", @"收入"];
    _segmentedControl = [[UISegmentedControl alloc] initWithItems:segmentedData];
    [_segmentedControl setSelectedSegmentIndex:0];
    [self.view addSubview:_segmentedControl];
    [_segmentedControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(kMarginToScreenEdge);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(30);
    }];
    
    _amountView = [[UITextView alloc] initWithFrame:CGRectZero];
    _amountView.backgroundColor = [UIColor lightGrayColor];
    _amountView.keyboardType = UIKeyboardTypeNumberPad;
    [self.view addSubview:_amountView];
    [_amountView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.equalTo(weakSelf.segmentedControl.mas_bottom).offset(kMarginToScreenEdge);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(30);
    }];
    
    UILabel *amountTitleLabel = [[UILabel alloc] initWithFrame:CGRectZero textColor:kBlackColor font:kFontSize(14)];
    amountTitleLabel.text = @"金额";
    [self.view addSubview:amountTitleLabel];
    [amountTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.amountView.mas_centerY);
        make.right.equalTo(weakSelf.amountView.mas_left).offset(-kMarginToScreenEdge);
    }];
    
    _categoryView = [[UITextView alloc] initWithFrame:CGRectZero];
    _categoryView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:_categoryView];
    [_categoryView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.equalTo(weakSelf.amountView.mas_bottom).offset(kMarginToScreenEdge);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(30);
    }];
    
    UILabel *categoryTitleLabel = [[UILabel alloc] initWithFrame:CGRectZero textColor:kBlackColor font:kFontSize(14)];
    categoryTitleLabel.text = @"用途";
    [self.view addSubview:categoryTitleLabel];
    [categoryTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.categoryView.mas_centerY);
        make.right.equalTo(weakSelf.categoryView.mas_left).offset(-kMarginToScreenEdge);
    }];
    
    UIButton *addButton = [[UIButton alloc] initWithFrame:CGRectZero];
    [addButton setTitle:@"确认" forState:UIControlStateNormal];
    [addButton setTitleColor:kBlackColor forState:UIControlStateNormal];
    addButton.backgroundColor = [UIColor lightGrayColor];
    [addButton addTarget:self action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addButton];
    [addButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(30);
        make.bottom.mas_equalTo(-kMarginToScreenEdge);
    }];
}

- (void)clickButton {
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *filePatch = [doc stringByAppendingPathComponent:@"note.plist"];
    if (![NSArray arrayWithContentsOfFile:filePatch]) {
        NSDictionary *dic = @{@"category": _categoryView.text, @"date": [NSDate stringFromDate:[NSDate date]], @"balance": _segmentedControl.selectedSegmentIndex == 0 ? [NSString stringWithFormat:@"-%@", _amountView.text] : _amountView.text, @"amount": _segmentedControl.selectedSegmentIndex == 0 ? [NSString stringWithFormat:@"-%@", _amountView.text] : _amountView.text};
        NSArray *arr = @[dic];
        [arr writeToFile:filePatch atomically:YES];
    } else {
        NSMutableArray *mArr = [NSMutableArray arrayWithContentsOfFile:filePatch];
        NSInteger balance = [[mArr.firstObject objectForKey:@"balance"] integerValue];
        NSInteger amount = [_amountView.text integerValue];
        if (_segmentedControl.selectedSegmentIndex == 0) {
            balance -= amount;
        } else {
            balance += amount;
        }
        NSDictionary *dic = @{@"category": _categoryView.text, @"date": [NSDate stringFromDate:[NSDate date]], @"balance": [NSString stringWithFormat:@"%zd", balance], @"amount": _segmentedControl.selectedSegmentIndex == 0 ? [NSString stringWithFormat:@"-%@", _amountView.text] : _amountView.text};
        [mArr insertObject:dic atIndex:0];
        [mArr writeToFile:filePatch atomically:YES];
    }
    self.addBlock();
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_amountView resignFirstResponder];
    [_categoryView resignFirstResponder];
}

@end
