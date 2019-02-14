//
//  HYHomeViewModel.h
//  Adonis_20190214_MVVM
//
//  Created by Adonis_HongYang on 2019/2/14.
//  Copyright © 2019年 Nikoyo (China）Electronics Systems Co., Ltd. All rights reserved.
//

#import "HYBaseViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface HYHomeViewModel : HYBaseViewModel

/** 成功 */
@property (nonatomic, copy) SuccessBlock successBlock;


/**
 加载数据
 */
- (void)loadData;

@end

NS_ASSUME_NONNULL_END
