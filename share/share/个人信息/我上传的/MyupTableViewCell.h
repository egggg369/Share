//
//  MyupTableViewCell.h
//  share
//
//  Created by 郭红乐 on 2020/7/25.
//  Copyright © 2020 无. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyupTableViewCell : UITableViewCell
@property (nonatomic, strong) UIImageView *picture;
@property (nonatomic, strong) UILabel *lbTitle;
@property (nonatomic, strong) UILabel *lbName;
@property (nonatomic, strong) UILabel *lbTime;
@property (nonatomic, strong) UILabel *lblove;
@property (nonatomic, strong) UILabel *lblook;
@property (nonatomic, strong) UILabel *lbShare;
@property (nonatomic, strong) UIButton *btLove;
@property (nonatomic, strong) UIButton *btLook;
@property (nonatomic, strong) UIButton *btShare;
@end

NS_ASSUME_NONNULL_END
