//
//  MyselfViewController.m
//  share
//
//  Created by 郭红乐 on 2020/7/22.
//  Copyright © 2020 无. All rights reserved.
//

#import "MyselfViewController.h"
#import "MyselfTableViewCell.h"
#import "MyupTableViewCell.h"
#import "MyupViewController.h"
#import "MysuggestViewController.h"
#import "MyinformationViewController.h"
#import "SetViewController.h"
@interface MyselfViewController ()

@end

@implementation MyselfViewController

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
        titleLabel.text = @"个人信息";
        self.navigationItem.titleView = titleLabel;
        
        self.view.backgroundColor = [UIColor colorWithRed:0.92f green:0.93f blue:1.00f alpha:1.00f];

    //self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 416, 1200)];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    
    [self.tableView registerClass:[MyselfTableViewCell class] forCellReuseIdentifier:@"myself1"];
    [self.tableView registerClass:[MyselfTableViewCell class] forCellReuseIdentifier:@"myself2"];

    self.tableView.delegate = self;
    self.tableView.dataSource = self;

    [self.view addSubview:_tableView];
    
}

- (CGFloat)tableView: (UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    if(indexPath.section == 0) {
        return 150;
    }
    return 50;
}

//- (void)

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section == 0) {
        return 1;
    }else {
        return 6;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0) {
        MyselfTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myself1" forIndexPath:indexPath];
        return cell;
    
    }else {
        MyselfTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myself2" forIndexPath:indexPath];
        NSArray *timeArr1 = @[@"我上传的", @"我的信息", @"我推荐的", @"院系通知", @"设置", @"退出"];
        NSArray *imageArr1 = @[@"上传", @"youxiang", @"个人-心", @"院系通知",@"设置", @"个人-返回"];

        cell.picture.image = [UIImage imageNamed:imageArr1[indexPath.row]];
        cell.lbTime.text = timeArr1[indexPath.row];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 1 && indexPath.row == 0) {
        MyupViewController *myupViewController = [[MyupViewController alloc]init];
        [self.navigationController pushViewController:myupViewController animated:NO];
    }
    else if (indexPath.section == 1 && indexPath.row == 1) {
        MyinformationViewController *myinformationViewController = [[MyinformationViewController alloc]init];
        [self.navigationController pushViewController:myinformationViewController animated:NO];
    }
    else if (indexPath.section == 1 && indexPath.row == 2) {
        MysuggestViewController *mysuggestViewController = [[MysuggestViewController alloc]init];
        [self.navigationController pushViewController:mysuggestViewController animated:NO];
    }
    else if (indexPath.section == 1 && indexPath.row == 4) {
        SetViewController *setViewController = [[SetViewController alloc]init];
        [self.navigationController pushViewController:setViewController animated:NO];
    }else if (indexPath.section == 1 && indexPath.row == 3) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"您现在没有通知" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
        
        [self presentViewController:alert animated:true completion:nil];
    }else if (indexPath.section == 1 && indexPath.row == 5){
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"不能退出" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
        
        [self presentViewController:alert animated:true completion:nil];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
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


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
