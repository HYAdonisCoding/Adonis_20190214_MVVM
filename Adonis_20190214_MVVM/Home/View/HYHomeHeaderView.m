//
//  HYHomeHeaderView.m
//  Adonis_20190214_MVVM
//
//  Created by Adonis_HongYang on 2019/2/14.
//  Copyright © 2019年 Nikoyo (China）Electronics Systems Co., Ltd. All rights reserved.
//

#import "HYHomeHeaderView.h"
#import "HYHomeHeaderViewCell.h"

@interface HYHomeHeaderView ()<UICollectionViewDataSource, UICollectionViewDelegate>
/** 数据源 */
@property (nonatomic, copy) NSArray *dataArray;

/** 集合视图 */
@property (nonatomic, strong) UICollectionView *collectionView;
@end

@implementation HYHomeHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame
            ];
    if (self) {
        [self makeInterface];
    }
    return self;
}

- (void)makeInterface {
//    self.backgroundColor = [UIColor clearColor];
    
    CGRect collectionViewFrame = CGRectMake(10, 10, self.bounds.size.width, self.bounds.size.height);
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    // 设置UICollectionView为横向滚动
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    // 每一行cell之间的间距
    flowLayout.minimumLineSpacing = 0;
    // 每一列cell之间的间距
    flowLayout.minimumInteritemSpacing = 0;
    // 设置第一个cell和最后一个cell,与父控件之间的间距
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    flowLayout.minimumLineSpacing = 0;// 根据需要编写
    flowLayout.minimumInteritemSpacing = 0;// 根据需要编写
    CGFloat height = (collectionViewFrame.size.height) *.5;
    CGFloat width = (collectionViewFrame.size.width) *.25;
//    if (self.dataArray.count <= 4) {
//        height = collectionViewFrame.size.height;
//    }
    
    flowLayout.itemSize = CGSizeMake(width, height);// 该行代码就算不写,item也会有默认尺寸
    
//    UIView *backView = [[UIView alloc] initWithFrame:collectionViewFrame];
//    backView.layer.shadowOffset = CGSizeMake(3,3);//往x方向偏移0，y方向偏移0
//    backView.layer.shadowOpacity = 0.3;//设置阴影透明度
//    backView.layer.shadowColor= [UIColor lightGrayColor].CGColor;//设置阴影颜色
//    backView.layer.shadowRadius = 5;//设置阴影半径
//    [self addSubview:backView];
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, collectionViewFrame.size.width, collectionViewFrame.size.height) collectionViewLayout:flowLayout];
    collectionView.backgroundColor = [UIColor whiteColor];
    
    collectionView.dataSource = self;
    collectionView.delegate = self;
    collectionView.multipleTouchEnabled = NO;
    self.collectionView = collectionView;
//    [backView addSubview:collectionView];
    [self addSubview:collectionView];
    
    [self.collectionView registerClass:[HYHomeHeaderViewCell class] forCellWithReuseIdentifier:NSStringFromClass([HYHomeHeaderViewCell class])];
}

- (UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    HYHomeHeaderViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([HYHomeHeaderViewCell class]) forIndexPath:indexPath];
    cell.nameLabel.text = self.dataArray[indexPath.row];
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.operationblock) {
        self.operationblock(self.dataArray[indexPath.row]);
    }
}

- (void)headerViewWithData:(NSArray *)array {
    self.dataArray = array;
    [self.collectionView reloadData];
}

@end
