//
//  PasswordViewController.m
//  share
//
//  Created by 郭红乐 on 2020/7/26.
//  Copyright © 2020 无. All rights reserved.
//

#import "PasswordViewController.h"
#import "PasswordTableViewCell.h"
@interface PasswordViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *arrayData1;
@property (nonatomic, strong) NSArray *arrayData2;
@end

@implementation PasswordViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //self.view.backgroundColor = [UIColor whiteColor];
    
    _passwordTextField1 = [[UITextField alloc] init];
    _passwordTextField2 = [[UITextField alloc] init];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 44)];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.font = [UIFont boldSystemFontOfSize:25];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = @"设置密码";
    self.navigationItem.titleView = titleLabel;
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
    [self.tableView registerClass:[PasswordTableViewCell class] forCellReuseIdentifier:@"password"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.tableView.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.backgroundColor = [UIColor colorWithRed:0.25f green:0.25f blue:0.25f alpha:1.00f];
    btn.frame = CGRectMake(167, 200, 80, 42);
    btn.layer.cornerRadius = 5;
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setTitle:@"提交" forState:normal];
    [btn addTarget:self action:@selector(press) forControlEvents:UIControlEventTouchUpInside];
    [self.tableView addSubview:btn];
    
    _arrayData1 = [[NSArray alloc] initWithObjects:@"旧密码",@"新密码", @"确认密码",  nil];
    _arrayData2 = [[NSArray alloc] initWithObjects:@"6-20英文或数字结合",@"6-20英文或数字结合",@"请再次确认输入密码", nil];
    
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


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PasswordTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"password" forIndexPath:indexPath];
    cell.textField.delegate = self;
    cell.label.text = _arrayData1[indexPath.row];
    cell.textField.placeholder = _arrayData2[indexPath.row];
    switch (indexPath.row) {
        case 1:
            cell.textField.tag = 1;
            break;
        case 2:
            cell.textField.tag = 2;
            break;
        default:
            break;
    }
    return cell;
}
  

- (void)press {
    if(_passwordTextField1.text == _passwordTextField2.text) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"修改成功" message:nil preferredStyle:UIAlertControllerStyleAlert];
        alertController.view.tintColor = [UIColor colorWithRed:0.25f green:0.25f blue:0.25f alpha:1.00f];
        [self presentViewController:alertController animated:YES completion:nil];
        [self performSelector:@selector(clean:) withObject:alertController afterDelay:1.5];
    }else {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"修改失败，两次密码输入不一致" message:nil preferredStyle:UIAlertControllerStyleAlert];
        alertController.view.tintColor = [UIColor colorWithRed:0.25f green:0.25f blue:0.25f alpha:1.00f];
        [self presentViewController:alertController animated:YES completion:nil];
        [self performSelector:@selector(clean:) withObject:alertController afterDelay:1.5];
    }
}


- (void) clean:(UIAlertController *)alert
{
    [alert dismissViewControllerAnimated:YES completion:nil];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if(textField.tag == 1) {
        _passwordTextField1.text = textField.text;
    }else if(textField.tag == 2) {
        _passwordTextField2.text = textField.text;
    }
}

- (void)actionSheet{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"确认修改密码？" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *deleteAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleCancel handler:nil];
    [alertController addAction:cancelAction];
    [alertController addAction:deleteAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    [self.tableView endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    //返回一个BOOL值，指明是否允许在按下回车键时结束编辑
    //如果允许要调用resignFirstResponder 方法，这回导致结束编辑，而键盘会被收起
    [self.tableView endEditing:YES];
    return YES;
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
