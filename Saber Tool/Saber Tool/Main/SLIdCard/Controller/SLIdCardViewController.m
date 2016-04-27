//
//  SLIdCardViewController.m
//  Saber Tool
//
//  Created by songlong on 16/4/25.
//  Copyright © 2016年 songlong. All rights reserved.
//

#import "SLIdCardViewController.h"

@interface SLIdCardViewController ()

@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UILabel *provinceLabel;
@property (nonatomic, strong) UILabel *cityLabel;
@property (nonatomic, strong) UILabel *townLabel;
@property (nonatomic, strong) UILabel *birthdayLabel;
@property (nonatomic, strong) UILabel *sexLabel;

@end

@implementation SLIdCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"身份证号码查询";
    
    [self setupUI];
}

- (void)setupUI {
    kWS(weakSelf);
    
    _textField = [[UITextField alloc] initWithFrame:CGRectZero];
    _textField.placeholder = @"请输入身份证号码或者前六位";
    [self.view addSubview:_textField];
    [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
        make.width.mas_equalTo(300);
    }];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectZero];
    [button addTarget:self action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];
    button.backgroundColor = [UIColor redColor];
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(25);
        make.top.equalTo(weakSelf.textField.mas_bottom).offset(20);
    }];
    
    _provinceLabel = [[UILabel alloc] initWithFrame:CGRectZero textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:14]];
    _provinceLabel.text = @"省份";
    [self.view addSubview:_provinceLabel];
    [_provinceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(50);
    }];
    
    _cityLabel = [[UILabel alloc] initWithFrame:CGRectZero textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:14]];
    _cityLabel.text = @"城市";
    [self.view addSubview:_cityLabel];
    [_cityLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(70);
    }];
    
    _townLabel = [[UILabel alloc] initWithFrame:CGRectZero textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:14]];
    _townLabel.text = @"区县";
    [self.view addSubview:_townLabel];
    [_townLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(90);
    }];
    
    _birthdayLabel = [[UILabel alloc] initWithFrame:CGRectZero textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:14]];
    _birthdayLabel.text = @"生日";
    [self.view addSubview:_birthdayLabel];
    [_birthdayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(110);
    }];
    
    _sexLabel = [[UILabel alloc] initWithFrame:CGRectZero textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:14]];
    _sexLabel.text = @"性别";
    [self.view addSubview:_sexLabel];
    [_sexLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(130);
    }];
}

- (void)clickButton {
    kWS(weakSelf);
    [SLLoadingView showInView:self.view];
    [[SLNetworking shareInstance] requestWithMethod:Get path:kAPI_JiSu_IdCard withParams:@{@"appkey": kAppKey_jiSu, @"idcard": _textField.text} andBlock:^(id data, NSError *error) {
        [SLLoadingView hideFromView:weakSelf.view];
        if (!error) {
            if ([[data objectForKey:@"status"] integerValue] == 0) {
                NSDictionary *dic = [data objectForKey:@"result"];
                [weakSelf setupUIWithData:dic];
            } else {
                [weakSelf showHudTipStr:[data objectForKey:@"msg"]];
            }
        }
    }];
}

- (void)setupUIWithData:(NSDictionary *)dic {
    _provinceLabel.text = [NSString stringWithFormat:@"%@省", [dic objectForKey:@"province"]];
    _cityLabel.text = [NSString stringWithFormat:@"%@市", [dic objectForKey:@"city"]];
    _townLabel.text = [NSString stringWithFormat:@"%@", [dic objectForKey:@"town"]];
    _birthdayLabel.text = [NSString stringWithFormat:@"%@", [dic objectForKey:@"birth"]];
    _sexLabel.text = [NSString stringWithFormat:@"%@", [dic objectForKey:@"sex"]];
}


@end
