//
//  HYHomeHeaderViewCell.m
//  Adonis_20190214_MVVM
//
//  Created by Adonis_HongYang on 2019/2/15.
//  Copyright © 2019年 Nikoyo (China）Electronics Systems Co., Ltd. All rights reserved.
//

#import "HYHomeHeaderViewCell.h"

@implementation HYHomeHeaderViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self makeInterface];
    }
    return self;
}

- (void)makeInterface {
    self.backgroundColor = [UIColor randomColor];
//    self.iconImageView = ({
//        UIImageView *iconImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
//        //        [iconImageView setImage:[UIImage imageNamed:@"beautiful_China"]];
//        [self addSubview:iconImageView];
//        [iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.mas_equalTo(10);
//            make.left.mas_equalTo(space);
//            make.right.mas_equalTo(-space);
//            make.height.mas_equalTo(self.width-space*2);
//        }];
//        iconImageView;
//    });
    self.nameLabel = ({
        UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        nameLabel.textColor = [UIColor getColorFrom:(@"#9769a3")];
        nameLabel.font = [UIFont fontWithName:@"Courier" size:15.6f];
        nameLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:nameLabel];
        [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.bottom.mas_equalTo(-space);
            make.top.left.mas_equalTo(space);
        }];
        nameLabel;
    });
}

@end
