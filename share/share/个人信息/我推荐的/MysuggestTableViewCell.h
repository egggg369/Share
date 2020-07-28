//
//  MysuggestTableViewCell.h
//  share
//
//  Created by 郭红乐 on 2020/7/25.
//  Copyright © 2020 无. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MysuggestTableViewCell : UITableViewCell
@property (nonatomic, strong) UIImageView *image1;

@property (nonatomic, strong) UILabel *label1;

@property (nonatomic, strong) UILabel *label2;

@property (nonatomic, strong) UILabel *label3;

@property (nonatomic, strong) UILabel *label4;
@property (nonatomic, strong) UILabel *Zan;

@property  BOOL zanSelect;

@property (nonatomic, strong) UIButton *btn;
@property (nonatomic, strong) UIButton *btn1;
@property (nonatomic, strong) UIButton *btn2;
@end

NS_ASSUME_NONNULL_END
