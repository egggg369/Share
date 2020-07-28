//
//  MysuggestViewController.m
//  share
//
//  Created by 郭红乐 on 2020/7/25.
//  Copyright © 2020 无. All rights reserved.
//

#import "MysuggestViewController.h"
#import "MysuggestTableViewCell.h"
@interface MysuggestViewController ()

@end

@implementation MysuggestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 44)];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.font = [UIFont boldSystemFontOfSize:25];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = @"我推荐的";
    self.navigationItem.titleView = titleLabel;
    
    
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 416, 740)];
    
    
    [self.tableView registerClass:[MysuggestTableViewCell class] forCellReuseIdentifier:@"suggest"];

    self.tableView.delegate = self;
    self.tableView.dataSource = self;

    [self.view addSubview:_tableView];
    

    [self createUI];
    
}

-(void) createUI
{
    
    
    UIImage *ima01 = [[UIImage imageNamed:@"返回"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *image01 = [[UIBarButtonItem alloc]initWithImage:ima01 style:UIBarButtonItemStyleDone target:self action:@selector(next)];
    self.navigationItem.leftBarButtonItems = @[image01];
    
}

-(void) next
{
//    MyselfViewController *myselfViewController = [[MyselfViewController alloc] init];
//    [self.navigationController pushViewController:myselfViewController animated:YES];
    [self.navigationController popViewControllerAnimated:YES];
}

- (CGFloat)tableView: (UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    return 150;
}

//- (void)

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 6;
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
    
            MysuggestTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"suggest" forIndexPath:indexPath];
            NSArray *titileArr1 = @[@"假日",@"用户设计PK站",@"字体故事",@"板式整理术",@"水彩速绘",@"大白"];
            NSArray *nameArr1 = @[@"share小白",@"share小王", @"share小吕", @"share小王",@"share小王",@"share小白"];
            NSArray *timeArr1 = @[@"16分钟前", @"17分钟前", @"45分钟前", @"4小时前",@"4天前",@"7小时前"];
            NSArray *imageArr1 = @[@"1-1", @"3-1-2", @"3-1-3", @"3-1-4",@"3-3-1.jpeg",@"2-2-1"];
    
            cell.image1.image = [UIImage imageNamed:imageArr1[indexPath.section]];
            cell.label1.text = titileArr1[indexPath.section];
            cell.label2.text = nameArr1[indexPath.section];
            cell.label3.text = timeArr1[indexPath.section];
    
    
            return cell;
        
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
