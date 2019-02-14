//
//  HYHomeHeaderView.m
//  Adonis_20190214_MVVM
//
//  Created by Adonis_HongYang on 2019/2/14.
//  Copyright © 2019年 Nikoyo (China）Electronics Systems Co., Ltd. All rights reserved.
//

#import "HYHomeHeaderView.h"

@interface HYHomeHeaderView ()
/** 数据源 */
@property (nonatomic, copy) NSArray *dataArray;


@end

@implementation HYHomeHeaderView



- (void)headerViewWithData:(NSArray *)array {
    self.dataArray = array;
}

@end
