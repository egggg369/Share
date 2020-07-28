//
//  ShangCollectionViewCell.m
//  share
//
//  Created by 郭红乐 on 2020/7/27.
//  Copyright © 2020 无. All rights reserved.
//

#import "ShangCollectionViewCell.h"

@implementation ShangCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame]) {
        _button = [[UIButton alloc] init];
        [self.contentView addSubview:_button];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    _button.frame = CGRectMake(0, 0, 90, 90);
}

//- (instancetype)initWithFrame:(CGRect)frame {
//    self = [super initWithFrame:frame];
//
//    self.photoImageView = [[UIImageView alloc] init];
//    [self.contentView addSubview:_photoImageView];
//    self.photoButton = [[UIButton alloc] init];
//    [self.contentView addSubview:_photoButton];
//    return self;
//}
//
//- (void)layoutSubviews {
//    //两个属性的位置一样，emm是因为我把button加在——photoImageView上，进行点击按钮来进行选择图片和取消
//    _photoButton.frame = CGRectMake(0, 0, 130, 150);
//    _photoImageView.frame = CGRectMake(0, 0, 130, 150);
//    _photoButton.backgroundColor = [UIColor colorWithWhite:0.01 alpha:0.01];
//
//}
//


@end
