//
//  MyupTableViewCell.m
//  share
//
//  Created by 郭红乐 on 2020/7/25.
//  Copyright © 2020 无. All rights reserved.
//

#import "MyupTableViewCell.h"

@implementation MyupTableViewCell


- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];

    _picture = [[UIImageView alloc] init];
    [self.contentView addSubview:_picture];
    
    _lbTitle = [[UILabel alloc] initWithFrame:CGRectMake(190, 20, 350, 30)];
    [self.contentView addSubview:_lbTitle];
    
    _lbName = [[UILabel alloc] initWithFrame:CGRectMake(190, 50, 100, 30)];
    [self.contentView addSubview:_lbName];
    
    _lbTime = [[UILabel alloc] initWithFrame:CGRectMake(190, 85, 90, 15)];
    [self.contentView addSubview:_lbTime];
    
    _btLove = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.contentView addSubview:_btLove];
    
    _btLook = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.contentView addSubview:_btLook];
    
    _btShare = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.contentView addSubview:_btShare];
    
    _lblove = [[UILabel alloc] initWithFrame:CGRectMake(213, 125, 30, 15)];
    [self.contentView addSubview:_lblove];
    _lblove.text = @"99";
    
    _lblook = [[UILabel alloc] initWithFrame:CGRectMake(277, 125, 30, 15)];
    [self.contentView addSubview:_lblook];
    _lblook.text = @"17";
    
    _lbShare = [[UILabel alloc] initWithFrame:CGRectMake(333, 125, 30, 15)];
    [self.contentView addSubview:_lbShare];
    _lbShare.text = @"64";
    
    [_btLove addTarget:self action:@selector(pressOne) forControlEvents:UIControlEventTouchUpInside];
    
    return self;
    
}


- (void) layoutSubviews {
    _picture.frame = CGRectMake(0, 0, 155, 155);
    
    _lbTitle.font = [UIFont systemFontOfSize:20];
    _lbTime.font = [UIFont systemFontOfSize:13];
    
    _btLove.frame = CGRectMake(190, 120, 20, 20);
    [_btLove setImage:[UIImage imageNamed:@"心"] forState:UIControlStateNormal];
    _lblove.font = [UIFont systemFontOfSize:12];
    _lblove.textColor = [UIColor colorWithRed:0.05 green:0.4 blue:0.74 alpha:1.0];
    
    
    _btLook.frame = CGRectMake(250, 125, 25, 15);
    [_btLook setImage:[UIImage imageNamed:@"眼睛"] forState:UIControlStateNormal];
    
    _lblook.font = [UIFont systemFontOfSize:12];
    _lblook.textColor = [UIColor colorWithRed:0.05 green:0.4 blue:0.74 alpha:1.0];
    
    _btShare.frame = CGRectMake(310, 125, 20, 15);
    [_btShare setImage:[UIImage imageNamed:@"分享"] forState:UIControlStateNormal];
    
    _lbShare.font = [UIFont systemFontOfSize:12];
    _lbShare.textColor = [UIColor colorWithRed:0.05 green:0.4 blue:0.74 alpha:1.0];
}

- (void) pressOne
{
    if(_btLove.selected == NO) {
        _btLove.selected = YES;
        _lblove.text = @"99";
    }else {
        _btLove.selected = NO;
        _lblove.text = @"100";
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
