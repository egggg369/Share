//
//  HomeViewController.h
//  share
//
//  Created by 郭红乐 on 2020/7/22.
//  Copyright © 2020 无. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomeViewController : UIViewController <UIScrollViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@end

NS_ASSUME_NONNULL_END
