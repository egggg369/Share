//
//  MessageTableViewCell.m
//  share
//
//  Created by 郭红乐 on 2020/7/25.
//  Copyright © 2020 无. All rights reserved.
//

#import "MessageTableViewCell.h"

@implementation MessageTableViewCell


- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if([self.reuseIdentifier isEqualToString:@"message"]) {
        _label = [[UILabel alloc] init];
        _label.font = [UIFont systemFontOfSize:19];
        [self.contentView addSubview:_label];
        
        
        _label1 = [[UILabel alloc] init];
        _label1.font = [UIFont systemFontOfSize:12];
        _label1.textColor = [UIColor blueColor];
        [self.contentView addSubview:_label1];
        
        
        _image1 = [[UIImageView alloc] init];
        [self.contentView addSubview:_image1];
        
    }
    
    return self;
}

- (void) layoutSubviews {
    _image1.frame = CGRectMake(5, 5, 60, 60);
    _label.frame = CGRectMake(75, 15, 200, 20);
    
    _label1.frame = CGRectMake(75, 45, 300, 20);
    
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
