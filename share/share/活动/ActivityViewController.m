//
//  ActivityViewController.m
//  share
//
//  Created by 郭红乐 on 2020/7/22.
//  Copyright © 2020 无. All rights reserved.
//

#import "ActivityViewController.h"
#import "ActivityTableViewCell.h"
@interface ActivityViewController ()  <UITableViewDelegate,UITableViewDataSource>

@end

@implementation ActivityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.18f green:0.52f blue:0.77f alpha:1.00f];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize: 20], NSForegroundColorAttributeName:[UIColor whiteColor]}];

    self.navigationController.navigationBar.translucent = NO;
    
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 44)];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.font = [UIFont boldSystemFontOfSize:25];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = @"活动";
    self.navigationItem.titleView = titleLabel;
    
    self.view.backgroundColor = [UIColor colorWithRed:0.92f green:0.93f blue:1.00f alpha:1.00f];

    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 416, self.view.frame.size.height - 180)];
    [self.tableView registerClass:[ActivityTableViewCell class] forCellReuseIdentifier:@"activity"];
    [self.tableView registerClass:[ActivityTableViewCell class] forCellReuseIdentifier:@"activity01"];
    [self.tableView registerClass:[ActivityTableViewCell class] forCellReuseIdentifier:@"activity02"];

    self.tableView.delegate = self;
    self.tableView.dataSource = self;

    [self.view addSubview:_tableView];
}



- (CGFloat)tableView: (UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    return 270;
}

//- (void)

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //ActivityTableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:@"activity"forIndexPath:indexPath];
    if(indexPath.section == 0) {
        ActivityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"activity" forIndexPath:indexPath];
        return cell;
    }else if (indexPath.section == 1) {
        ActivityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"activity01" forIndexPath:indexPath];
        return cell;
    }else {
        ActivityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"activity02" forIndexPath:indexPath];
        return cell;
    }
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
