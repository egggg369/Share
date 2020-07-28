//
//  MyselfTableViewCell.m
//  share
//
//  Created by 郭红乐 on 2020/7/25.
//  Copyright © 2020 无. All rights reserved.
//

#import "MyselfTableViewCell.h"

@implementation MyselfTableViewCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if([self.reuseIdentifier isEqualToString:@"myself1"])
    {
    
        UIImageView *image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"假日头像"]];
        image.frame = CGRectMake(20, 20, 120, 120);
        [self.contentView addSubview:image];
        
        
        UILabel *label = [[UILabel alloc] init];
        label.text = @"share小白";
        label.frame = CGRectMake(160, 25, 200, 40);
        label.font = [UIFont systemFontOfSize:24];
        [self.contentView addSubview:label];
        
        UILabel *label1 = [[UILabel alloc] init];
        label1.text = @"数媒/设计爱好者";
        label1.frame = CGRectMake(160, 65, 200, 20);
        [self.contentView addSubview:label1];
        
        UILabel *label2 = [[UILabel alloc] init];
        label2.text = @"开心了就笑，不开心了就过会儿再笑";
        label2.frame = CGRectMake(160, 90, 300, 20);
        label2.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:label2];
        
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [btn setImage:[[UIImage imageNamed:@"心.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:10];
        [self.contentView addSubview:btn];
        btn.frame = CGRectMake(225, 115, 30, 30);
        [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
        
        
       
        
        UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [btn1 setImage:[[UIImage imageNamed:@"眼睛.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        btn1.titleLabel.font = [UIFont systemFontOfSize:10];
        btn1.frame = CGRectMake(295, 115, 30, 30);
        [self.contentView addSubview:btn1];
        //[_btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
        
        
        
        UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [btn2 setImage:[[UIImage imageNamed:@"分享.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        btn2.titleLabel.font = [UIFont systemFontOfSize:10];
        btn2.frame = CGRectMake(355, 115, 30, 30);
        [self.contentView addSubview:btn2];
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
    }else if([self.reuseIdentifier isEqualToString:@"myself2"]) {
        _picture = [[UIImageView alloc] init];
        [self.contentView addSubview:_picture];
        
        _lbTime = [[UILabel alloc] initWithFrame:CGRectMake(35, 0, 150, 30)];
        [self.contentView addSubview:_lbTime];
    }
    
    return self;
}

- (void) layoutSubviews {
    _Zan.frame = CGRectMake(260, 120, 50, 20);
    _picture.frame = CGRectMake(0, 5, 25, 25);
    _lbTime.font = [UIFont systemFontOfSize:16];
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
