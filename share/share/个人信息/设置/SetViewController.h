//
//  SetViewController.h
//  share
//
//  Created by 郭红乐 on 2020/7/26.
//  Copyright © 2020 无. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SetViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray* _arrayData;
}
@property (nonatomic, strong) UITableView *tableView;
@end

NS_ASSUME_NONNULL_END
