//
//  DabaiViewController.m
//  share
//
//  Created by 郭红乐 on 2020/7/24.
//  Copyright © 2020 无. All rights reserved.
//

#import "DabaiViewController.h"
#import "DabaiTableViewCell.h"
@interface DabaiViewController () <UITableViewDelegate,UITableViewDataSource>

@end

@implementation DabaiViewController

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
        titleLabel.text = @"搜索";
        self.navigationItem.titleView = titleLabel;
        
        self.view.backgroundColor = [UIColor colorWithRed:0.92f green:0.93f blue:1.00f alpha:1.00f];
    
    
    UITextField* textField = [[UITextField alloc] init];
        textField.frame = CGRectMake(19, 20, 375, 50);
        textField.text = @"大白";
        textField.font = [UIFont systemFontOfSize:15];
        textField.textColor = [UIColor blackColor];
        textField.borderStyle = UITextBorderStyleRoundedRect;
        textField.keyboardType = UIKeyboardTypeDefault;
        //textField.placeholder = @"搜索 用户名 作品分类 文章";
        textField.secureTextEntry = NO;
        [self.view addSubview: textField];
        
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 0, 20, 20)];
        imgView.image = [UIImage imageNamed:@"搜索.png"];
        textField.leftView = imgView;
        textField.leftViewMode = UITextFieldViewModeAlways;
    
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 90, 416, 300)];
    [self.tableView registerClass:[DabaiTableViewCell class] forCellReuseIdentifier:@"dabai"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    [self createUI];
    
}


- (void) createUI
{
    UIImage *ima01 = [[UIImage imageNamed:@"返回"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *image01 = [[UIBarButtonItem alloc]initWithImage:ima01 style:UIBarButtonItemStyleDone target:self action:@selector(next)];
    self.navigationItem.leftBarButtonItems = @[image01];
}

-(void) next
{
    [self.navigationController popViewControllerAnimated:YES];
}




- (CGFloat)tableView: (UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    return 150;
}

//- (void)

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
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

            DabaiTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"dabai" forIndexPath:indexPath];
            NSArray *titileArr1 = @[@"Icon of Baymax",@"每个人心中都需要大白"];
            NSArray *nameArr1 = @[@"share小白", @"share小王"];
            NSArray *timeArr1 = @[@"16分钟前", @"4小时前"];
            NSArray *imageArr1 = @[@"2-2-1", @"2-2-2"];

            cell.image1.image = [UIImage imageNamed:imageArr1[indexPath.section]];
            cell.label1.text = titileArr1[indexPath.section];
            cell.label2.text = nameArr1[indexPath.section];
            cell.label3.text = timeArr1[indexPath.section];

    //NSLog(@"%d", indexPath.section);
    
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
