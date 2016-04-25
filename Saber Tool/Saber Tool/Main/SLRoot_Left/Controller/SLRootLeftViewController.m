//
//  SLRootLeftViewController.m
//  Saber Tool
//
//  Created by songlong on 16/4/25.
//  Copyright © 2016年 songlong. All rights reserved.
//

#import "SLRootLeftViewController.h"
#import "SLLineLayout.h"
#import "SLRootLeftCell.h"
#import "SLButtonListView.h"


@interface SLRootLeftViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, assign) BOOL isAnimating;
@property (nonatomic, assign) BOOL isOpen;
@property (nonatomic, assign) NSInteger currentCollectionType;
@property (nonatomic, strong) SLButtonListView *popView;

@end

@implementation SLRootLeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _isOpen = NO;
    _isAnimating = NO;
    
    [self setupUI];
}

#pragma mark --- UICollectionView Delegate / DataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 30;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    SLRootLeftCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"noteCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor greenColor];
    [cell setupUIWithData];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark --- Private Method

- (void)setupUI {
    self.navigationController.navigationBar.translucent = NO;
    [self setupCollectionViewTypeLine];
    [self setupRightItem];
    [self setupPopView];
}

- (void)setupCollectionViewTypeLine {
    SLLineLayout *flowLayout = [[SLLineLayout alloc] init];
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:_collectionView];
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
        make.left.mas_equalTo(0);
        make.height.mas_equalTo(300);
    }];
    [_collectionView registerClass:[SLRootLeftCell class] forCellWithReuseIdentifier:@"noteCell"];
    _currentCollectionType = 0;
}

- (void)setupCollectionViewTypeLineDefault {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    CGFloat width = (kScreen_Width - 4 * 20) / 3;
    layout.itemSize = CGSizeMake(width, width);
    layout.minimumLineSpacing = 20;
    layout.minimumInteritemSpacing = 20;
    _collectionView = [[UICollectionView alloc]initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:layout];
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.contentInset = UIEdgeInsetsMake(20, 20, 20, 20);
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [self.view addSubview:_collectionView];
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    [_collectionView registerClass:[SLRootLeftCell class] forCellWithReuseIdentifier:@"noteCell"];
    _currentCollectionType = 1;
}

- (void)setupRightItem {
    UIButton *rightButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 25, 25)];
    [rightButton setImage:[UIImage imageNamed:@"rightButton"] forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(clickRightItem) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
}

- (void)setupPopView {
    kWS(weakSelf);
    _popView = [[SLButtonListView alloc] initWithFrame:CGRectMake(kScreen_Width - 100, -100, 100, 100) andTitleArray:@[@"线形排列", @"列表排列"]];
    _popView.clickBlock = ^(NSInteger index){
        if (weakSelf.currentCollectionType != index) {
            [weakSelf.collectionView removeFromSuperview];
            if (index == 1) {
                [weakSelf setupCollectionViewTypeLineDefault];
            } else if (index == 0) {
                [weakSelf setupCollectionViewTypeLine];
            }
            [weakSelf.collectionView reloadData];
        }
    };
    _popView.backgroundColor = [UIColor redColor];
}

#pragma mark --- Private Action 

- (void)clickRightItem {
    
    kWS(weakSelf);
    
    if (!_isAnimating) {
        if (!_isOpen) {
            [self.view addSubview:_popView];
            _isAnimating = YES;
            [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseIn animations:^{
                weakSelf.popView.frame = CGRectMake(kScreen_Width - 100, 0, 100, 100);
                
            } completion:^(BOOL finished) {
                weakSelf.isAnimating = NO;
            }];
        } else {
            _isAnimating = YES;
            [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseIn animations:^{
                weakSelf.popView.frame = CGRectMake(kScreen_Width - 100, -100, 100, 100);
            } completion:^(BOOL finished) {
                [weakSelf.popView removeFromSuperview];
                weakSelf.isAnimating = NO;
            }];
        }
    }
    
    _isOpen = !_isOpen;
}

@end
