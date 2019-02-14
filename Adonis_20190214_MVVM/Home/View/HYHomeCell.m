//
//  HYHomeCell.m
//  Adonis_20190214_MVVM
//
//  Created by Adonis_HongYang on 2019/2/14.
//  Copyright © 2019年 Nikoyo (China）Electronics Systems Co., Ltd. All rights reserved.
//

#import "HYHomeCell.h"

#define space 8.0f



@implementation HYHomeCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self makeInterface];
        
    }
    return self;
}
- (void)makeInterface {
    
    
    
    self.nameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.nameLabel.textColor = [UIColor getColorFrom:(@"#9769a3")];
    self.nameLabel.font = [UIFont fontWithName:@"Courier" size:15.6f];
    
    [self addSubview:self.nameLabel];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(space);
        make.bottom.mas_equalTo(-space);
        make.left.mas_equalTo(20.0f);
        make.height.mas_equalTo(30);
        make.right.mas_equalTo(-space);
    }];
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
