//
//  XiaoxiTableViewCell.m
//  share
//
//  Created by 郭红乐 on 2020/7/26.
//  Copyright © 2020 无. All rights reserved.
//

#import "XiaoxiTableViewCell.h"

@implementation XiaoxiTableViewCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if([self.reuseIdentifier isEqualToString:@"xiaoxi"]) {
        _label = [[UILabel alloc] init];
        _label.font = [UIFont systemFontOfSize:19];
        [self.contentView addSubview:_label];
        
        
        
        
        _btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btn setImage:[[UIImage imageNamed:@"关闭.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        //_btn.titleLabel.font = [UIFont systemFontOfSize:10];
        [self.contentView addSubview:_btn];
        [_btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        
        
        
    }
    
    return self;
}

- (void) layoutSubviews {
    //_image1.frame = CGRectMake(5, 5, 60, 60);
    _label.frame = CGRectMake(15, 15, 300, 20);
    
    _btn.frame = CGRectMake(300, 15, 90, 30);
    
}




- (void) click:(UIButton *) btn
{
    btn.selected = !btn.selected;
    if (!btn.selected) {
       [btn setImage:[UIImage imageNamed:@"关闭.png"] forState:UIControlStateNormal];
    }else{
       [btn setImage:[UIImage imageNamed:@"开启.png"] forState:UIControlStateNormal];
        
    }
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
