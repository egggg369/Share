//
//  UpTableViewCell.m
//  share
//
//  Created by 郭红乐 on 2020/7/26.
//  Copyright © 2020 无. All rights reserved.
//

#import "UpTableViewCell.h"

@implementation UpTableViewCell


- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.label = [[UILabel alloc] init];
    [self.contentView addSubview:_label];
    
    return self;
}

- (void) layoutSubviews {
    [super layoutSubviews];
    _label.frame = CGRectMake(0, 0, 300, 30);
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
