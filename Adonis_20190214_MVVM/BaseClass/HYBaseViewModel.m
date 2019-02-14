//
//  HYBaseViewModel.m
//  Adonis_20190214_MVVM
//
//  Created by Adonis_HongYang on 2019/2/14.
//  Copyright © 2019年 Nikoyo (China）Electronics Systems Co., Ltd. All rights reserved.
//

#import "HYBaseViewModel.h"

@implementation HYBaseViewModel

- (instancetype)initWithSuccess:(SuccessBlock)success failed:(FailedBlock)failed {
    self = [super init];
    if (self) {
        self.successBlock = success;
        self.failedBlock = failed;
    }
    return self;
}

@end
