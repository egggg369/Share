//
//  MyinformationViewController.m
//  share
//
//  Created by 郭红乐 on 2020/7/25.
//  Copyright © 2020 无. All rights reserved.
//

#import "MyinformationViewController.h"
#import "FollowViewController.h"
#import "MessageViewController.h"
@interface MyinformationViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation MyinformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 44)];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.font = [UIFont boldSystemFontOfSize:25];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = @"我的信息";
    self.navigationItem.titleView = titleLabel;
    
    
    
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped ];
    
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
    
    
    [self createUI];
    
    
    _arrayData = [[NSMutableArray alloc] init];
    
    NSArray *array = [NSArray arrayWithObjects:@"评论                                                                 >  7", @"推荐我的                                                         >  9", @"新关注的                                                         >  5", @"私信                                                                 >  4", @"活动通知                                                         >  1",nil];
    [_arrayData addObject:array];
    
}

-(void) createUI
{
    
    
    UIImage *ima01 = [[UIImage imageNamed:@"返回"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *image01 = [[UIBarButtonItem alloc]initWithImage:ima01 style:UIBarButtonItemStyleDone target:self action:@selector(next)];
    self.navigationItem.leftBarButtonItems = @[image01];
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0 && indexPath.row == 2) {
        FollowViewController *followViewController = [[FollowViewController alloc]init];
        [self.navigationController pushViewController:followViewController animated:NO];
    }else if(indexPath.section == 0 && indexPath.row == 3) {
        MessageViewController *messageViewController = [[MessageViewController alloc]init];
        [self.navigationController pushViewController:messageViewController animated:NO];
    }else {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"目前没有新内容" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
        
        [self presentViewController:alert animated:true completion:nil];
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}



-(void) next
{

    [self.navigationController popViewControllerAnimated:YES];
}

- (CGFloat)tableView: (UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    return 50;
}

//- (void)

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
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
    NSString* str = @"cell";
    
    UITableViewCell* cell = [_tableView dequeueReusableCellWithIdentifier:str];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
    cell.textLabel.text = _arrayData[indexPath.section][indexPath.row];
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
