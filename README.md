# Adonis_20190214_MVVM

-------

我MVVM架构模式。

-------
# 主要思路：


* 控制器加载数据

```
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
```

* VM层加载数据的方法

```
- (void)loadData {
    NSArray *array = @[@"转账", @"信用卡", @"充值中心", @"蚂蚁借呗", @"电影票", @"滴滴出行", @"城市服务", @"蚂蚁森林"];
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        sleep(1);
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (self.successBlock) {
                self.successBlock(array);
            }
        });
    });
}
```

* 控制器传值给VM层

```
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    self.viewModel.contentKey = self.dataArray[indexPath.row];
}
```
* RAC观察属性 并回传给控制器

```
- (instancetype)init {
    self = [super init];
    if (self) {
        [RACObserve(self, contentKey) subscribeNext:^(id  _Nullable x) {
            NSArray *array = @[@"转账", @"信用卡", @"充值中心", @"蚂蚁借呗", @"电影票", @"滴滴出行", @"城市服务", @"蚂蚁森林"];
            NSMutableArray *mArray = [NSMutableArray arrayWithArray:array];
            
            [mArray removeObject:x];
            @synchronized (mArray) {
                if (self.successBlock) {
                    self.successBlock(mArray);
                }
                
            }

        }];
    }
    return self;
}

```