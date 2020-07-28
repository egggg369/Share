//
//  HomeTableViewCell.m
//  share
//
//  Created by 郭红乐 on 2020/7/23.
//  Copyright © 2020 无. All rights reserved.
//

#import "HomeTableViewCell.h"

@implementation HomeTableViewCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if([self.reuseIdentifier isEqualToString:@"home"]) {
        _label1 = [[UILabel alloc] init];
        [self.contentView addSubview:_label1];
        //_label1.text = @"假日";
        _label1.font = [UIFont systemFontOfSize:30];
        
        _label2 = [[UILabel alloc] init];
        [self.contentView addSubview:_label2];
        //_label2.text = @"share小白";
        _label1.font = [UIFont systemFontOfSize:17];
        
        _label3 = [[UILabel alloc] init];
        [self.contentView addSubview:_label3];
        _label3.font = [UIFont systemFontOfSize:12];
        //_label3.text = @"原创—插画-练习写作";
        
        _label4 = [[UILabel alloc] init];
        [self.contentView addSubview:_label4];
        _label4.font = [UIFont systemFontOfSize:12];
        //_label4.text = @"15分钟前";
//        _image1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1-1"]];
//        [self.contentView addSubview:_image1];
        
        _btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_btn setImage:[[UIImage imageNamed:@"心.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        _btn.titleLabel.font = [UIFont systemFontOfSize:10];
        [self.contentView addSubview:_btn];
        [_btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
        
        
        
        _btn1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_btn1 setImage:[[UIImage imageNamed:@"眼睛.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        _btn1.titleLabel.font = [UIFont systemFontOfSize:10];
        [self.contentView addSubview:_btn1];
        //[_btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
        
        
        
        _btn2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_btn2 setImage:[[UIImage imageNamed:@"分享.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        _btn2.titleLabel.font = [UIFont systemFontOfSize:10];
        [self.contentView addSubview:_btn2];
        //[_btn2 addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
        
        
        
        
        _Zan = [[UILabel alloc] init];
        _Zan.textColor = [UIColor blueColor];
        _Zan.text = @"102";
        _Zan.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:_Zan];
        
        UILabel *Yan = [[UILabel alloc] init];
        Yan.frame = CGRectMake(330, 120, 50, 20);
        Yan.textColor = [UIColor blueColor];
        Yan.text = @"23";
        [self.contentView addSubview:Yan];
        
        UILabel *Fen = [[UILabel alloc] init];
        Fen.frame = CGRectMake(385, 120, 50, 20);
        Fen.textColor = [UIColor blueColor];
        Fen.text = @"62";
        [self.contentView addSubview:Fen];
        
        _image1 = [[UIImageView alloc] init];
        [self.contentView addSubview:_image1];
        
    }
    
    return self;
}

- (void) layoutSubviews {
    _image1.frame = CGRectMake(6, 6, 200, 120);
    _label1.frame = CGRectMake(225, 15, 200, 20);
    _label2.frame = CGRectMake(225, 40, 100, 15);
    _label3.frame = CGRectMake(225, 60, 200, 15);
    _label4.frame = CGRectMake(225, 80, 70, 15);
    _btn.frame = CGRectMake(225, 115, 30, 30);
    _btn1.frame = CGRectMake(295, 115, 30, 30);
    _btn2.frame = CGRectMake(355, 115, 30, 30);
    _Zan.frame = CGRectMake(260, 120, 50, 20);
}




- (void) click {
    if(_zanSelect == NO) {
        _zanSelect = YES;
        _Zan.text = @"103";
    }else {
        _zanSelect = NO;
        _Zan.text = @"102";
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
