//
//  JibenViewController.h
//  share
//
//  Created by 郭红乐 on 2020/7/26.
//  Copyright © 2020 无. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JibenViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property UIButton *btn1;
@property UIButton *btn;
@property BOOL man;
@end

NS_ASSUME_NONNULL_END
