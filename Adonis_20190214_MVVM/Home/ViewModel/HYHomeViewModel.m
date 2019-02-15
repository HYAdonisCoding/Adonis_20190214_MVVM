//
//  HYHomeViewModel.m
//  Adonis_20190214_MVVM
//
//  Created by Adonis_HongYang on 2019/2/14.
//  Copyright © 2019年 Nikoyo (China）Electronics Systems Co., Ltd. All rights reserved.
//

#import "HYHomeViewModel.h"
#import <ReactiveObjC.h>

@implementation HYHomeViewModel

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

/**
- (instancetype)init {
    self = [super init];
    if (self) {
        [self addObserver:self forKeyPath:@"contentKey" options:(NSKeyValueObservingOptionNew) context:nil];
    }
    return self;
}
#pragma mark - KVO 回调

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSArray *array = @[@"转账", @"信用卡", @"充值中心", @"蚂蚁借呗", @"电影票", @"滴滴出行", @"城市服务", @"蚂蚁森林"];
    NSMutableArray *mArray = [NSMutableArray arrayWithArray:array];
    
    [mArray removeObject:change[NSKeyValueChangeNewKey]];
    @synchronized (mArray) {
        if (self.successBlock) {
            self.successBlock(mArray);
        }

    }
    
}

#pragma mark - dealloc
- (void)dealloc {
    [self removeObserver:self forKeyPath:@"contentKey"];
}
 */
@end
