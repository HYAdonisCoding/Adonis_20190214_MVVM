//
//  HYHomeHeaderView.h
//  Adonis_20190214_MVVM
//
//  Created by Adonis_HongYang on 2019/2/14.
//  Copyright © 2019年 Nikoyo (China）Electronics Systems Co., Ltd. All rights reserved.
//

#import "HYBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface HYHomeHeaderView : HYBaseView

/** 返回数据 */
@property (nonatomic, copy) SuccessBlock operationblock;

- (void)headerViewWithData:(NSArray *)array;

@end

NS_ASSUME_NONNULL_END
