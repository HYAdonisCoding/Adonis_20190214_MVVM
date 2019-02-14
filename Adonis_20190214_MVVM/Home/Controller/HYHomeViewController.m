//
//  HYHomeViewController.m
//  Adonis_20190214_MVVM
//
//  Created by Adonis_HongYang on 2019/2/14.
//  Copyright © 2019年 Nikoyo (China）Electronics Systems Co., Ltd. All rights reserved.
//

#import "HYHomeViewController.h"
#import "HYHomeHeaderView.h"
#import "HYHomeCell.h"
#import "UITableView+HYRegister.h"
#import "HYHomeViewModel.h"

@interface HYHomeViewController () <UITableViewDelegate, UITableViewDataSource>
/** 列表 */
@property (nonatomic, strong) UITableView *tableView;
/** 数据源 */
@property (nonatomic, copy) NSArray *dataArray;
/** VM */
@property (nonatomic, strong) HYHomeViewModel *viewModel;


@end

@implementation HYHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"主页";
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[HYHomeCell class]];
    
    self.viewModel = [[HYHomeViewModel alloc] init];
    [self.viewModel loadData];
    WK(weakSelf);
    [self.viewModel initWithSuccess:^(id data) {
        SG(strongSelf);
        NSArray *array = data;
        
        HYHomeHeaderView *headerView = [[HYHomeHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, (array.count + 1) / 4 * 50)];
        [headerView headerViewWithData:array];
        strongSelf.tableView.tableHeaderView = headerView;
        strongSelf.dataArray = array;
        [strongSelf.tableView reloadData];
        
    } failed:^(id data) {
        
    }];
    
    
    
    
}


#pragma mark - UITableViewDataSource
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    HYHomeCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([HYHomeCell class]) forIndexPath:indexPath];
    cell.nameLabel.text = self.dataArray[indexPath.row];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
#pragma mark -- Lazy Load
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        
        
        UIView *footerView = [[UIView alloc] init];
        footerView.backgroundColor = [UIColor whiteColor];
        _tableView.tableFooterView = footerView;
        
        //隐藏自带的分割线
        //        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        // 设置tableView背景色
        _tableView.backgroundColor = [UIColor whiteColor];
        //估算高度
        _tableView.estimatedRowHeight = 150;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.mas_topLayoutGuideBottom);
            make.right.left.mas_equalTo(0);
            make.bottom.mas_equalTo(self.mas_bottomLayoutGuideTop);
        }];
    }
    return _tableView;
}



@end
