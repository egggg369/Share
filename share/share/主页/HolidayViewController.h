//
//  HolidayViewController.h
//  share
//
//  Created by 郭红乐 on 2020/7/24.
//  Copyright © 2020 无. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HolidayViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>
@property  BOOL zanSelect;
@property (nonatomic, strong) UILabel *Zan;
@property (nonatomic, strong) UITableView *tableView;
@end

NS_ASSUME_NONNULL_END
