//
//  ActivityTableViewCell.m
//  share
//
//  Created by 郭红乐 on 2020/7/23.
//  Copyright © 2020 无. All rights reserved.
//

#import "ActivityTableViewCell.h"

@implementation ActivityTableViewCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if([self.reuseIdentifier isEqualToString:@"activity"]) {
        _label1 = [[UILabel alloc] init];
        [self.contentView addSubview:_label1];
        _label1.text = @"下厨也要美美的，从一条围裙开始一六月鲜围裙创意设计大赛";
        _image1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"4-1"]];
        [self.contentView addSubview:_image1];
    }
    else if ([self.reuseIdentifier isEqualToString:@"activity01"]) {
        _label1 = [[UILabel alloc] init];
        [self.contentView addSubview:_label1];
        _label1.text = @"MIUI主题市场让你的创意改变世界！";
        _image1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"4-2"]];
        [self.contentView addSubview:_image1];
    }else {
        _label1 = [[UILabel alloc] init];
        [self.contentView addSubview:_label1];
        _label1.text = @"千万花粉，为你而来";
        _image1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"4-3"]];
        [self.contentView addSubview:_image1];
    }
    return self;
}

- (void) layoutSubviews {
    _image1.frame = CGRectMake(6, 6, 416, 210);
    _label1.frame = CGRectMake(15, 230, 404, 30);
    _label1.font = [UIFont systemFontOfSize:13];
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
