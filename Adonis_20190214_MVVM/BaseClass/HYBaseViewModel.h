//
//  HYBaseViewModel.h
//  Adonis_20190214_MVVM
//
//  Created by Adonis_HongYang on 2019/2/14.
//  Copyright © 2019年 Nikoyo (China）Electronics Systems Co., Ltd. All rights reserved.
//

#import "HYBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface HYBaseViewModel : HYBaseModel
/** key */
@property (nonatomic, copy) NSString *contentKey;

- (instancetype)initWithSuccess:(SuccessBlock)success failed:(FailedBlock)failed;

/** 成功 */
@property (nonatomic, copy) SuccessBlock successBlock;

/** 失败 */
@property (nonatomic, copy) FailedBlock failedBlock;

@end

NS_ASSUME_NONNULL_END
