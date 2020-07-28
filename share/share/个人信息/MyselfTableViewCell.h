//
//  MyselfTableViewCell.h
//  share
//
//  Created by 郭红乐 on 2020/7/25.
//  Copyright © 2020 无. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyselfTableViewCell : UITableViewCell
@property(nonatomic, strong) UILabel *lbTime;
@property(nonatomic, strong) UIImageView *picture;
@property (nonatomic, strong) UILabel *Zan;

@property  BOOL zanSelect;
@end

NS_ASSUME_NONNULL_END
