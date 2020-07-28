//
//  UpViewController.h
//  share
//
//  Created by 郭红乐 on 2020/7/26.
//  Copyright © 2020 无. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UpTableViewCell.h"
NS_ASSUME_NONNULL_BEGIN

@interface UpViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;

@property UIButton *button;
@property UIButton *btn09;
@property NSMutableArray *strArr;
@property NSMutableString *str;
@property BOOL openSelect;
//@property int numm;
@property NSNumber *num;
@property UpTableViewCell *cell;

@property UITextField *proTextField;
@property UITextView *messTextView;
@property UIImageView *localImageView;
@property UILabel *localLabel;

@property UIButton *selectButton;
@property UIButton *upButton;
@property UITableView *ttableView;
@property UIButton *ttButton;

@property UIImageView *iimageView;




@end

NS_ASSUME_NONNULL_END
