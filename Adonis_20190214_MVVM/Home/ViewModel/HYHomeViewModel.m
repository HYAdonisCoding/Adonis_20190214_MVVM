//
//  HYHomeViewModel.m
//  Adonis_20190214_MVVM
//
//  Created by Adonis_HongYang on 2019/2/14.
//  Copyright © 2019年 Nikoyo (China）Electronics Systems Co., Ltd. All rights reserved.
//

#import "HYHomeViewModel.h"

@implementation HYHomeViewModel

- (instancetype)init {
    self = [super init];
    if (self) {
        
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
@end
